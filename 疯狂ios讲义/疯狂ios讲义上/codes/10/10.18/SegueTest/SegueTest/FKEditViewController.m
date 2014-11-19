//
//  FKEditViewController.m
//  SegueTest
//
//  Created by yeeku on 13-7-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKEditViewController.h"

@interface FKEditViewController ()

@end

@implementation FKEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tv.text = self.editContent;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 获取segue将要跳转到的目标视图控制器
	id destController = segue.destinationViewController;
	// 使用KVC方式将tv内的编辑完成的文本设为destController的content属性值
	[destController setValue:self.tv.text forKey:@"content"];
}
@end
