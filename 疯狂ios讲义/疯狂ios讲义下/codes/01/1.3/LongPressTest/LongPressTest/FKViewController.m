//
//  FKViewController.m
//  LongPressTest
//
//  Created by yeeku on 13-7-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

#define MARGINE 20
#define BUTTON_WIDTH 80
#define BUTTON_HEIGHT 30
#define CELL_WIDTH 100
#define CELL_HEIGHT 40
@implementation FKViewController
NSInteger bnIndex;
NSMutableArray* bnArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];
	// 创建一个NSMutableArray集合，用于保存多个按钮
	bnArray = [[NSMutableArray alloc] init];
	// 创建一个手势处理器，用于检测、处理长按手势
	UILongPressGestureRecognizer* gesture = [[UILongPressGestureRecognizer
		alloc]initWithTarget:self action:@selector(longPress:)];
	// 为该控件添加手势处理器
	[self.view addGestureRecognizer:gesture];
}
- (void) longPress:(UILongPressGestureRecognizer*)gesture
{
	// 创建一个按钮
	UIButton* bn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	// 获取NSArray中已经包含了几个按钮
	NSInteger count = bnArray.count;
	// 计算当前添加的按钮位于第几行、第几列
	NSInteger row = count / 3;
	NSInteger col = count % 3;
	// 为该按钮设置文本
	[bn setTitle:[NSString stringWithFormat:@"按钮%d", bnIndex]
		forState:UIControlStateNormal];
	// 设置该bn按钮的大小和位置
	bn.frame = CGRectMake(MARGINE + col * CELL_WIDTH
		, row * CELL_HEIGHT + MARGINE , BUTTON_WIDTH , BUTTON_HEIGHT);
	// 为该按钮添加事件处理方法
	[bn addTarget:self action:@selector(remove:)
 		forControlEvents:UIControlEventTouchUpInside];
	[bnArray addObject:bn];
	// 将按钮添加到应用界面的UIView控件中
	[self.view addSubview:bn];
	bnIndex ++;
}
- (void) remove:(id)sender
{
	// 删除事件源控件（激发该事件的按钮）
	[sender removeFromSuperview];
	// 将触发该事件的按钮从NSMutableArray集合中删除
	[bnArray removeObject:sender];
	[self rearrange];
}
- (void) rearrange
{
	// 重新计算每个按钮的大小和位置
	for(int i = 0 ; i < bnArray.count; i ++)
	{
		NSInteger row = i / 3;
		NSInteger col = i % 3;
		UIButton* bn = [bnArray objectAtIndex:i];
		bn.frame = CGRectMake(MARGINE + col * CELL_WIDTH
			, row * CELL_HEIGHT + MARGINE , BUTTON_WIDTH , BUTTON_HEIGHT);
	}
}
@end
