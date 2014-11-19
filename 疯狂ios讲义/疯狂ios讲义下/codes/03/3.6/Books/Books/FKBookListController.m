//
//  FKBookListController.m
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "FKBookListController.h"
#import "FKAddBookController.h"
#import "FKAppDelegate.h"
#import "FKBook.h"

@interface FKBookListController ()
@property (nonatomic , weak) FKAppDelegate * appDelegate;
@property (nonatomic , strong) UIBarButtonItem* deleteBn;
@end

@implementation FKBookListController
NSMutableArray* bookArray;
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationItem.title = [NSString stringWithFormat:@"%@的图书",
		self.selectedAuthor.name];
	self.navigationController.delegate = self;
	// 获取当前应用程序的委托对象
	self.appDelegate = (FKAppDelegate *)
		[[UIApplication sharedApplication] delegate];
	// 创建一个导航条上的删除按钮
	self.deleteBn = [[UIBarButtonItem alloc] initWithTitle:@"删除"
		style:UIBarButtonItemStyleBordered
		target:self action:@selector(toggleDelete:)];
	//  将删除按钮添加到导航条上
	self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:
		self.navigationItem.rightBarButtonItem , self.deleteBn , nil];

}
// 当该导航视图控制器控制某个视图控制器显示出来时激发该方法
-(void)navigationController:(UINavigationController *)navigationController
	 willShowViewController:(UIViewController *)
viewController animated:(BOOL)animated
{
	if ([viewController isKindOfClass: [UITableViewController class]])
	{
		[viewController viewWillAppear:animated];
		// 控制表格重新加载数据
		[((UITableViewController*)viewController).tableView reloadData];
	}
}
- (void)viewWillAppear:(BOOL)animated;
{
	[super viewWillAppear:animated];
	// 创建抓取数据的请求对象
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	// 设置要抓取哪种类型的实体
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"FKBook"
		inManagedObjectContext:self.appDelegate.managedObjectContext];
	// 设置抓取实体
	[request setEntity:entity];
	// 定义抓取条件：只抓取当前作者的图书
	request.predicate = [NSPredicate predicateWithFormat:@"author=%@"
		, self.selectedAuthor];
	NSError *error = nil;
	// 执行抓取数据的请求，返回符合条件的数据
	bookArray = [[self.appDelegate.managedObjectContext
		executeFetchRequest:request error:&error] mutableCopy];
	if (bookArray == nil)
	{
		NSLog(@"获取FKBook实体时出错: %@,%@",error,[error userInfo]);
	}
}
// 该方法的返回值决定该表格包含多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
// 该方法的返回值决定该表格的指定分区内包含多少个表格行
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	return bookArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
	(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"book";
	// 取出可重用的表格行	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
		CellIdentifier forIndexPath:indexPath];
	// 根据表格行的行号取出对应的FKBook对象	
	FKBook* book = [bookArray objectAtIndex:indexPath.row];
	// 为表格行内的两个UI控件设置内容
	cell.textLabel.text = book.name;
	cell.detailTextLabel.text = book.publishHouse;
	return cell;
}
// UITableViewDelegate协议中定义的方法。
// 该方法的返回值作为删除指定表格行时确定按钮的文本
- (NSString *)tableView:(UITableView *)tableView
	titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return @"确认删除";
}
// UITableViewDataSource协议中定义的方法。
// 编辑（包括删除或插入）完成时激发该方法
- (void) tableView:(UITableView *)tableView commitEditingStyle:
	(UITableViewCellEditingStyle)editingStyle
	forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 如果正在提交删除操作
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		NSInteger rowNo = [indexPath row];
		// 获取将要删除的图书
		FKBook* deleteBook = [bookArray objectAtIndex:rowNo];
		// 从托管对象上下文中删除指定对象
		[self.appDelegate.managedObjectContext deleteObject:deleteBook];
		NSError *error;
		// 保存删除操作，如果出现错误，显示错误信息	
		if (![self.appDelegate.managedObjectContext save:&error])
		{
			NSLog(@"删除FKBook实体出错:%@,%@",error,[error userInfo]);
		}
		// 从bookArray集合中删除该元素
		[bookArray removeObject:deleteBook];
		// 从UITable程序界面上删除指定表格行。
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
			withRowAnimation:UITableViewRowAnimationAutomatic];
	}
}
- (IBAction)toggleDelete:(id)sender
{
	// 使用动画切换表格的编辑状态
	[self.tableView setEditing: !self.tableView.editing animated:YES] ;
	// 如果当前处于编辑状态
	if (self.tableView.editing)
	{
		// 修改工具条上按钮的文本
		self.deleteBn.title = @"完成";
	}
	// 如果当前没有处于编辑状态
	else
	{
		// 修改工具条上按钮的文本
		self.deleteBn.title	= @"删除";
	}
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	FKAddBookController* addBookController = (FKAddBookController*)
		segue.destinationViewController;
	addBookController.selectedAuthor = self.selectedAuthor;
}
@end
