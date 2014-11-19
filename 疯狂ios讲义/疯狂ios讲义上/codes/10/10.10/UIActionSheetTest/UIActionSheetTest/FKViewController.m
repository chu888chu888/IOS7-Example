//
//  FKViewController.m
//  UIActionSheetTest
//
//  Created by yeeku on 13-6-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (IBAction)clicked:(id)sender {
	// 创建一个UIActionSheet
	UIActionSheet* sheet = [[UIActionSheet alloc]
		initWithTitle:@"请确认是否删除" // 指定标题
		delegate:self // 指定该UIActionSheet的委托对象就是该控制器自身
		cancelButtonTitle:@"取消" // 指定取消按钮的标题
		destructiveButtonTitle:@"确定" // 指定销毁按钮的标题
		otherButtonTitles:@"按钮一", @"按钮二", nil]; // 为其他按钮指定标题
	// 设置UIActionSheet的风格	
	sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
	[sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet
	clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// 使用UIAlertView来显示用户单击了第几个按钮
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
		message:[NSString stringWithFormat:@"您单击了第%d个按钮" , buttonIndex]
		delegate:nil
		cancelButtonTitle:@"确定"
		otherButtonTitles: nil];
	[alert show];
}
@end
