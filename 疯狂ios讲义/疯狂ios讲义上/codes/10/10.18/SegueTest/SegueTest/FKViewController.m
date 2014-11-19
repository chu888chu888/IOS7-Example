//
//  FKViewController.m
//  SegueTest
//
//  Created by yeeku on 13-7-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
	if (!self.content) {
		self.content = @"遗民泪尽胡尘里，\n南望王师又一年！";
	}
	self.label.text = self.content;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 获取segue将要跳转到的目标视图控制器
	id destController = segue.destinationViewController;
	// 使用KVC方式将label内的文本设为destController的editContent属性值
	[destController setValue:self.label.text forKey:@"editContent"];
}
@end
