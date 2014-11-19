//
//  FKViewController.m
//  DynaLabel
//
//  Created by yeeku on 13-6-28.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

#import "FKViewController.h"
// 定义FKViewController的扩展
@interface FKViewController ()
// 定义一个属性来记录所有动态添加的UILabel控件
@property (nonatomic, strong) NSMutableArray* labels;
@end

@implementation FKViewController
// 定义一个变量来记录下一个将要添加的UILabel的位置
int nextY = 80;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 设置该view的背景色
	self.view.backgroundColor = [UIColor grayColor];
	// 初始化labels数组
	self.labels = [NSMutableArray array];
	// 创建UIButtonTypeRoundedRect类型的UIButton对象
	UIButton* addBn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	// 设置addBn的大小和位置
	addBn.frame = CGRectMake(30 , 30  , 60 , 40);
	// 为UIButton设置按钮文本
	[addBn setTitle:@"添加"
		forState:UIControlStateNormal];
	// 为addBn的Touch Up Inside事件绑定事件处理方法
	[addBn addTarget:self action:@selector(add:)
		forControlEvents:UIControlEventTouchUpInside];
	// 创建UIButtonTypeRoundedRect类型的UIButton对象
	UIButton* removeBn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	// 设置removeBn的大小和位置	
	removeBn.frame = CGRectMake(230 , 30  , 60 , 40);
	// 为UIButton设置按钮文本	
	[removeBn setTitle:@"删除"
		forState:UIControlStateNormal];
	// 为removeBn的Touch Up Inside事件绑定事件处理方法	
	[removeBn addTarget:self action:@selector(remove:)
	   	forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:addBn];
	[self.view addSubview:removeBn];
}
- (void)add:(id)sender {
	// 创建一个UILabel控件
	UILabel* label = [[UILabel alloc] initWithFrame:
					  CGRectMake(80 , nextY  , 160 , 30)];
	// 设置该UILabel显示的文本
	label.text = @"疯狂iOS讲义";
	// 将该UILabel添加到labels数组中
	[self.labels addObject: label];
	// 将UILabel控件添加到view父控件内
	[self.view addSubview:label];
	// 控制nextY的值加50
	nextY += 50;
}
- (void)remove:(id)sender {
	// 如果labels数组中元素个数大于0，表明有UILabel可删除
	if([self.labels count] > 0)
	{
		// 将最后一个UILabel从界面上删除
		[[self.labels lastObject] removeFromSuperview];
		// 从labels数组中删除最后一个元素
		[self.labels removeLastObject];
		// 控制nextY的值减50
		nextY -= 50;
	}
}
@end
