//
//  FKViewController.m
//  I18NTest
//
//  Created by yeeku on 13-9-29.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 准确获取当前语言的方式
	NSString* strLanguage = [[[NSUserDefaults standardUserDefaults]
		objectForKey:@"AppleLanguages"] objectAtIndex:0];
	NSLog(@"%@" , strLanguage);
	self.iv.contentMode = UIViewContentModeCenter;
	// 设置self.iv控件显示的图片为logo.jpg，由于该图片有英语、简体中文两个本地化副本
	// 因此随着当该应用的所在系统的语言是英语时，该图片将使用英语本地化副本
	// 因此随着当该应用的所在系统的语言是简体中文时，该图片将使用简体中文本地化副本
	self.iv.image = [UIImage imageNamed:@"logo.jpg"];
	// 通过NSLocalizedString()函数使用国际化消息
	self.localeLabel.text = NSLocalizedString(@"locale", @"I18NTest");
	self.label2.text = NSLocalizedString(@"test", @"测试字符串的注释内容");	
}
@end
