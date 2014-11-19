//
//  FKViewController.m
//  LocalNotificationTest
//
//  Created by yeeku on 13-10-31.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()
{
	UIApplication *app;
}
@end
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	app = [UIApplication sharedApplication];
}
- (IBAction)changed:(id)sender
{
	UISwitch* sw = (UISwitch*) sender;
	if (sw.on)
	{
		// 创建一个本地通知
		UILocalNotification *notification = [[UILocalNotification alloc]init];
		// 设置通知的触发时间
		notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];;
		// 设置通知的时区
		notification.timeZone = [NSTimeZone defaultTimeZone];
		// 设置通知的重复发送的事件间隔
		notification.repeatInterval = kCFCalendarUnitMinute;
		// 设置通知的声音
		notification.soundName = @"gu.mp3";
		// 设置当设备处于锁屏状态时，显示通知的警告框下方的title
		notification.alertAction = @"打开";
		// 设置通知是否可显示Action
		notification.hasAction = YES;
		// 设置通过通知加载应用时显示的图片
		notification.alertLaunchImage = @"logo.png";
		// 设置通知内容
		notification.alertBody = @"轮到你下棋了，赶快走棋!";
		// 设置显示在应用程序上红色徽标中的数字
		notification.applicationIconBadgeNumber = 1;
		// 设置userinfo，用于携带额外的附加信息。
		NSDictionary *info = @{@"fkjava.org": @"key"};
		notification.userInfo = info;
		// 调度通知
		[app scheduleLocalNotification:notification];  // ①
	}
	else
	{
		// 获取所有处于调度中本地通知数组
		NSArray *localArray = [app scheduledLocalNotifications];
		if (localArray)
		{
			for (UILocalNotification *noti in localArray)
			{
				NSDictionary *dict = noti.userInfo;
				if (dict)
				{
					// 如果找到要取消的通知
					NSString *inKey = [dict objectForKey:@"key"];
					if ([inKey isEqualToString:@"fkjava.org"])
					{
						// 取消调度该通知
						[app cancelLocalNotification:noti];  // ②
					}
				}
			}
		}
	}
}
@end
