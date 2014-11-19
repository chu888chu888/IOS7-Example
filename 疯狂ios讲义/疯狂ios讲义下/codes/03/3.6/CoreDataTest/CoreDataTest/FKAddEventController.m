//
//  FKAddEventController.m
//  CoreDataTest
//
//  Created by yeeku on 13-9-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"
#import "FKEvent.h"
#import "FKAddEventController.h"

@interface FKAddEventController ()
@property (nonatomic ,weak) FKAppDelegate * appDelegate;
@end

@implementation FKAddEventController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 获取应用程序委托对象
	self.appDelegate = (FKAppDelegate*)[UIApplication sharedApplication]
		.delegate;
}
- (IBAction)finishEdit:(id)sender
{
	[sender resignFirstResponder];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	NSString* eventName = self.eventField.text;
	if(eventName != nil && eventName.length > 0)
	{
		// 控制Core Data在托管对象上下文中创建一个新实体
		FKEvent* event = [NSEntityDescription
			insertNewObjectForEntityForName:@"FKEvent"
			inManagedObjectContext:self.appDelegate.managedObjectContext];
		// 为新实体设置属性
		event.name = eventName;
		event.happenDate = [NSDate date];
		// 定义一个NSError对象，用于接受错误信息
		NSError *error;
		// 设置完实体属性之后，调用托管对象上下文的save:方法将实体写入数据库，如果保存成功
		if ([self.appDelegate.managedObjectContext save:&error])
		{
			[[[UIActionSheet alloc] initWithTitle:@"保存成功" delegate:nil
				cancelButtonTitle:@"确定" destructiveButtonTitle:nil
				otherButtonTitles: nil] showInView:self.view];
		}
		else
		{
			NSLog(@"保存FKEvent实体出错: %@,%@" , error ,[error userInfo]);
		}
	}
}
@end
