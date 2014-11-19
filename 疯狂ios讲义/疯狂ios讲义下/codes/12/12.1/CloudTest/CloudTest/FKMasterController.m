//
//  FKMasterController.m
//  CloudTest
//
//  Created by yeeku on 13-11-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDiary.h"
#import "FKMasterController.h"
#import "FKDetailController.h"
@interface FKMasterController () <UIAlertViewDelegate>
{
	// 定义导航栏左边的按钮
	UIBarButtonItem *deleteButton;
}
@property (strong, nonatomic) NSMetadataQuery *query;
@property (strong, nonatomic) NSMutableArray *documentFilenames;
@property (strong, nonatomic) NSMutableArray *documentURLs;
@property (strong, nonatomic) FKDiary *chosenDiary;
@end
@implementation FKMasterController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建导航栏右边的按钮
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
		target:self action:@selector(addDiary)];
	// 将导航栏按钮设置为导航栏的右边按钮
	self.navigationItem.rightBarButtonItem = addButton;
	// 创建导航栏左边的按钮
	deleteButton = [[UIBarButtonItem alloc]
		initWithTitle:@"删除" style:UIBarButtonItemStylePlain
		target:self action:@selector(deleteDiary)];
		// 创建导航栏左边的按钮
	self.navigationItem.leftBarButtonItem = deleteButton;
	// 调用reloadFiles从云端下载文件
	[self reloadFiles];
}
- (void)reloadFiles
{
	// 创建一个NSMetadataQuery对象
	self.query = [[NSMetadataQuery alloc] init];
	// 设置查询谓词
	self.query.predicate = [NSPredicate predicateWithFormat:@"%K like '*.diary'",
		NSMetadataItemFSNameKey];
	// 设置查询范围，此处指定查询范围为NSMetadataQueryUbiquitousDocumentsScope，
	// 即在云端的Documents目录下查询
	self.query.searchScopes = [NSArray arrayWithObject:
		NSMetadataQueryUbiquitousDocumentsScope];
	// 获取数据结束时激发updateUbiquitousDocuments方法
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(updateUbiquitousDocuments:)
	name:NSMetadataQueryDidFinishGatheringNotification object:nil];
	// 查询更新完成时激发updateUbiquitousDocuments方法
	[[NSNotificationCenter defaultCenter] addObserver:self
		selector:@selector(updateUbiquitousDocuments:)
		name:NSMetadataQueryDidUpdateNotification object:nil];
	// 开始查询
	[self.query startQuery];
}
- (void)updateUbiquitousDocuments:(NSNotification *)notification
{
	self.documentURLs = [NSMutableArray array];
	self.documentFilenames = [NSMutableArray array];
	// 对查询结果进行排序，排序所使用的比较标准是创建时间
	NSArray *results = [self.query.results sortedArrayUsingComparator:
		^NSComparisonResult(id obj1, id obj2)
		{
			NSMetadataItem *item1 = obj1;
			NSMetadataItem *item2 = obj2;
			// 比较两个NSMetadataItem的创建时间
			return [[item2 valueForAttribute:NSMetadataItemFSCreationDateKey]
				compare: [item1 valueForAttribute:NSMetadataItemFSCreationDateKey]];
		}];
	// 遍历查询结果
	for (NSMetadataItem *item in results)
	{
		// 获取查询结果中包含的NSURL属性
		NSURL *url = [item valueForAttribute:NSMetadataItemURLKey];
		// 将NSURL添加到documentURLs集合中
		[self.documentURLs addObject:url];
		// 将NSURL的最后一个路径（即文件名）添加到documentFilenames集合中
		[self.documentFilenames addObject:[url lastPathComponent]];
	}
	// 控制界面上表格重新加载数据
	[self.tableView reloadData];
}
// 该方法返回值决定该表格包含多少行：documentFilenames集合有多少元素，表格就包含多少行
- (NSInteger)tableView:(UITableView *)tableView
 	numberOfRowsInSection:(NSInteger)section
{
	return [self.documentFilenames count];
}
// 该方法的返回值决定每个表格行的控件
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 获取可重用的单元格
	UITableViewCell *cell = [tableView
		dequeueReusableCellWithIdentifier:@"titleCell" forIndexPath:indexPath];
	// 根据单元格所在的行号获取对应的文档名。
	NSString *path = [self.documentFilenames objectAtIndex:indexPath.row];
	// 设置该单元格的文本为该文档名取消后缀。
	cell.textLabel.text = path.lastPathComponent.stringByDeletingPathExtension;
	return cell;
}


- (void)addDiary
{
	// 使用UIAlertView来获取文件名字
	UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"输入日记名"
		message:@"输入日记名称" delegate:self
		cancelButtonTitle:@"取消"
		otherButtonTitles:@"创建", nil];
	// 设置该UIAlertView的风格为带输入框的UIAlertView
	alert.alertViewStyle = UIAlertViewStylePlainTextInput;
	[alert show];
}
- (NSURL *)urlForFilename:(NSString *)filename
{
	// 获取默认的NSFileManager对象
	NSFileManager* fileManager = [NSFileManager defaultManager];
	// 根据Identifier获取系统的Ubiquity Container，
	// 如果传入nil参数，默认获取第一个Ubiquity Container。
	NSURL *baseURL = [fileManager URLForUbiquityContainerIdentifier:nil];
	// 获取云端Ubiquity Container的Documents子目录
	NSURL *pathURL = [baseURL URLByAppendingPathComponent:@"Documents"];
	// 在Documents子目录下添加文件名，作保存文件的URL
	NSURL *destinationURL = [pathURL URLByAppendingPathComponent:filename];
	return destinationURL;
}
- (void)alertView:(UIAlertView *)alertView
	didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 1)
	{
		// 获取用户在UIAlertView中输入的文件名，并添加*.diary后缀
		NSString *filename = [NSString stringWithFormat:@"%@.diary",
			[alertView textFieldAtIndex:0].text];
		// 获取云端文档的存储URL
		NSURL* saveURL = [self urlForFilename:filename];
		// 创建一个FKDiary（UIDocument的子类）对象
		self.chosenDiary = [[FKDiary alloc] initWithFileURL:saveURL];  // ①
		// 保存chosenDiary文档
		[self.chosenDiary saveToURL:saveURL
			forSaveOperation:UIDocumentSaveForCreating
			completionHandler:^(BOOL success)
		 	{
				if (success)
				{
					NSLog(@"保存成功！");
					[self reloadFiles];
					// 执行masterToDetail segue，导航到查看、编辑日记的视图控制器
					[self performSegueWithIdentifier:@"masterToDetail"
						sender:self];
				}
				else
				{
					NSLog(@"保存失败！");
			 	}
			}];
	}
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 如果sender等于self，表明是新建FKDiary后导航到查看、修改日期的视图控制器
	if (sender == self)
	{
		UIViewController *destination = segue.destinationViewController;
		// 将用户新建的FKDiary对象传给目标视图控制器
		if ([destination respondsToSelector:@selector(setDetailItem:)])
		{
			[destination setValue:self.chosenDiary forKey:@"detailItem"];
		}
	}
	else
	{
		// 获取激发视图切换的单元格所在的NSIndexPath
		NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
		// 获取激发视图切换的单元格中显示的文件名
		NSString *filename = [self.documentFilenames objectAtIndex:indexPath.row];
		// 获取该文件名对应的FKDiary的存储URL。
		NSURL *docUrl = [self urlForFilename:filename];
		// 以指定的docUrl创建FKDiary对象
		self.chosenDiary = [[FKDiary alloc] initWithFileURL:docUrl];
		// 读取chosenDiary文档
		[self.chosenDiary openWithCompletionHandler:^(BOOL success) {
			// 如果读取成功
			if (success)
			{
				FKDetailController* destination = (FKDetailController*)segue.destinationViewController;
				// 将读取成功的chosenDiary传给destination视图控制器
				destination.detailItem = self.chosenDiary;
				// 调用destination的changeDisplay更新显示
				[destination changeDisplay];
			}
			else
			{
				NSLog(@"failed to load!");
			}
		}];
	}
}



- (void) deleteDiary
{
	// 使用动画切换表格的编辑状态
	[self.tableView setEditing: !self.tableView.editing animated:YES];
	// 修改deleteButton按钮的文本
	deleteButton.title = [deleteButton.title isEqualToString:@"删除"]
		? @"完成" : @"删除";
}
// UITableViewDelegate协议中定义的方法。该方法的返回值决定单元格的编辑状态
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView
	editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 返回UITableViewCellEditingStyleDelete代表删除
	return UITableViewCellEditingStyleDelete;
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
		// 获取用户试图删除的行号
		NSInteger rowNo = [indexPath row];
		// 调用NSFileManager的removeItemAtURL:error:方法即可删除云端文档
		[[NSFileManager defaultManager] removeItemAtURL:
		 	[self.documentURLs objectAtIndex: rowNo] error:nil];
		// 从底层NSArray集合中删除指定数据项
		[self.documentFilenames removeObjectAtIndex: rowNo];
		// 从UITable程序界面上删除指定表格行。
		[self.tableView deleteRowsAtIndexPaths:[NSArray
			arrayWithObject:indexPath]
			withRowAnimation:UITableViewRowAnimationAutomatic];
	}
}
@end
