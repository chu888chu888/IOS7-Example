//
//  FKAddAuthorController.m
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "FKAddBookController.h"
#import "FKAppDelegate.h"
#import "FKBook.h"

@interface FKAddBookController ()
@property (nonatomic , weak) FKAppDelegate* appDelegate;
@end

@implementation FKAddBookController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 获取当前应用程序的委托对象
	self.appDelegate = (FKAppDelegate *)
		[[UIApplication sharedApplication] delegate];
}
- (IBAction)finishEdit:(id)sender
{
	[sender resignFirstResponder];
}
- (IBAction)addBook:(id)sender
{
	// 获取界面上两个输入控件的内容
	NSString* bookName = self.nameField.text;
	NSString* publishHouse = self.publishField.text;
	// 只有当nameField、publishField两个控件内有内容时才执行添加
	if (bookName != nil && bookName.length > 0
		&& publishHouse != nil && publishHouse.length > 0)
	{
		// 控制Core Data在托管对象上下文中创建一个新实体
		FKBook* book = [NSEntityDescription
			insertNewObjectForEntityForName:@"FKBook"
			inManagedObjectContext:self.appDelegate.managedObjectContext];
		// 为新实体设置属性
		book.name = bookName;
		book.publishHouse = publishHouse;
		book.author = self.selectedAuthor;
		// 定义一个NSError对象，用于接受保存错误
		NSError *error;
		// 设置完实体属性之后，调用托管对象上下文的save:方法将实体写入数据库，如果保存成功
		if ([self.appDelegate.managedObjectContext save:&error])
		{
			// 使用UIActionSheet提示添加成功
			[[[UIActionSheet alloc] initWithTitle:@"添加成功" delegate:nil
				cancelButtonTitle:nil destructiveButtonTitle:@"确定"
				otherButtonTitles:nil, nil] showInView:self.view];
			// 返回显示图书列表的视图控制器
			[self.navigationController popViewControllerAnimated:YES];
		}
		else
		{
			NSLog(@"添加FKBook出错: %@,%@" , error ,[error userInfo]);
		}
	}
}
@end
