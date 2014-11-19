//
//  FKViewController.m
//  HelloiOS
//
//  Created by yeeku on 13-5-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
// 定义FKViewController的扩展，对该项目没什么实际意义，可删除
@interface FKViewController ()
@end
// 定义FKViewController的实现部分
@implementation FKViewController
// 重写该方法，当该控制器关联的视图加载完成后系统会调用该方法
- (void)viewDidLoad
{
	[super viewDidLoad];
	NSLog(@"nib文件加载完成!!");
	// 如果程序需要再nib视图文件加载完成执行某些额外的处理，可在此处编写代码。
	// 借助于viewWithTag:方法即可通过UI控件的Tag属性来获取该控件，
	UILabel* myLb = (UILabel*)[self.view viewWithTag:12];
	// 设置myLb的文本内容
	[myLb setText:@"欢迎学习iOS开发！"];
	// 直接通过IBOutlet属性来访问第一个UILable控件
	[self.myTxt setText:@"iOS真有趣！"];
	// 为loginBn控件的UIControlEventTouchUpInside事件绑定事件处理方法
	// 以当前对象的loginHandler:方法作为事件处理方法
	[self.loginBn addTarget:self action:@selector(loginHandler:)
		forControlEvents:UIControlEventTouchUpInside];
}
// 重写该方法，当系统内存紧张时，系统会调用该方法
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
	// 此处可考虑释放那些可以以后重建的资源。
}
- (IBAction)clickHandler:(UIButton *)sender {
	[self.myTxt setText:@"IBAction事件机制"];
}
- (void) loginHandler:(UIButton *)sender {
	[self.myTxt setText:@"通过代码绑定事件处理方法"];
}
@end
