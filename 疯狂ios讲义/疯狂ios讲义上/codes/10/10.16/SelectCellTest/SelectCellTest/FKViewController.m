//
//  FKViewController.m
//  UITableViewTest
//
//  Created by yeeku on 13-6-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FKAppDelegate.h"
#import "FKDetailViewController.h"

@implementation FKViewController
// 定义应用程序委托对象
FKAppDelegate* appDelegate;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 为UITableView控件设置dataSource和delegate
	self.table.dataSource = self;
	self.table.delegate = self;
	appDelegate = [UIApplication sharedApplication].delegate;
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.table reloadData];
}
// 该方法返回值决定各表格行的控件。
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 为表格行定义一个静态字符串作为标示符
	static NSString* cellId = @"cellId";
	// 从可重用表格行的队列中取出一个表格行
	UITableViewCell* cell = [tableView
		dequeueReusableCellWithIdentifier:cellId];
	// 如果取出的表格行为nil
	if(cell == nil)
	{
		// 创建一个UITableViewCell对象，使用默认风格
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleSubtitle
			reuseIdentifier:cellId];
	}
	// 从IndexPath参数中获取当前行的行号
	NSUInteger rowNo = indexPath.row;
	// 取出books中索引为rowNo的元素作为UITableViewCell的文本标题
	cell.textLabel.text = [appDelegate.books objectAtIndex:rowNo];
	// 将单元格的边框设置为圆角
	cell.layer.cornerRadius = 12;
	cell.layer.masksToBounds = YES;
	// 为UITableViewCell的左端设置图片
	cell.imageView.image = [UIImage imageNamed:@"ic_gray.png"];
	// 为UITableViewCell的左端设置高亮状态视时的图片
	cell.imageView.highlightedImage = [UIImage imageNamed:
		@"ic_highlight.png"];
	// 取出details中索引为rowNo的元素作为UITableViewCell的详细内容
	cell.detailTextLabel.text = [appDelegate.details objectAtIndex:rowNo];
	return cell;
}
// 该方法的返回值决定指定分区内包含多少个表格行。
- (NSInteger)tableView:(UITableView*)tableView
	numberOfRowsInSection:(NSInteger)section
{
	// 由于该表格只有一个分区，直接返回books中集合元素个数代表表格的行数
	return appDelegate.books.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
	(NSIndexPath *)indexPath
{
	// 获取该应用的应用程序委托对象
	FKAppDelegate* appDelegate = [UIApplication
		sharedApplication].delegate;
	// 获取Storyboard文件中ID为detail的视图控制器
	FKDetailViewController* detailController = [self.storyboard
		instantiateViewControllerWithIdentifier:@"detail"];
	// 保存用户正在编辑的表格行对应的NSIndexPath
	detailController.editingIndexPath = indexPath;
	// 让应用程序的窗口显示detailViewController
	appDelegate.window.rootViewController = detailController;
}
@end
