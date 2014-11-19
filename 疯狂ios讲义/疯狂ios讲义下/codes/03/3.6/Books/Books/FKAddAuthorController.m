//
//  FKAddBookController.m
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "FKAddAuthorController.h"
#import "FKAppDelegate.h"
#import "FKAuthor.h"

@interface FKAddAuthorController ()
@property (nonatomic , weak) FKAppDelegate* appDelegate;
@end
@implementation FKAddAuthorController
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
- (IBAction)addAuthor:(id)sender
{
	// 获取界面上两个输入控件的内容	
	NSString* authorName = self.nameField.text;
	NSString* authorDesc = self.descField.text;
	// 只有当nameField、descField两个控件内有内容时才执行添加	
	if (authorName != nil && authorName.length > 0
		&& authorDesc != nil && authorDesc.length > 0)
	{
		// 控制Core Data在托管对象上下文中创建一个新实体	
		FKAuthor* author = [NSEntityDescription
			insertNewObjectForEntityForName:@"FKAuthor"
			inManagedObjectContext:self.appDelegate.managedObjectContext];
		// 为新实体设置属性
		author.name = authorName;
		author.authorDesc = authorDesc;
		// 定义一个NSError对象，用于接受保存错误
		NSError *error;
		// 设置完实体属性之后，调用托管对象上下文的save:方法将实体写入数据库，如果保存成功
		if ([self.appDelegate.managedObjectContext save:&error])
		{
			// 使用UIActionSheet提示添加成功
			[[[UIActionSheet alloc] initWithTitle:@"添加成功" delegate:nil
				cancelButtonTitle:nil destructiveButtonTitle:@"确定"
				otherButtonTitles:nil, nil] showInView:self.view];
			// 返回显示作者列表的视图控制器
			[self.navigationController popViewControllerAnimated:YES];
		}
		else
		{
			NSLog(@"添加FKAuthor实体出错: %@,%@" , error ,[error userInfo]);
		}
	}
}
@end
