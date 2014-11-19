//
//  FKViewController.m
//  gcdDownImage
//
//  Created by yeeku on 13-9-9.
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
- (IBAction)downImage:(id)sender
{
	// 将代码块提交给系统的全局并发队列
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),
		^(void){
			NSString* url = @"http://www.crazyit.org/logo.jpg";
			// 从网络获取数据
			NSData *data = [[NSData alloc]
				initWithContentsOfURL:[NSURL URLWithString:url]];
			// 将网络数据初始化为UIImage对象
			UIImage *image = [[UIImage alloc]initWithData:data];
			if(image != nil)
			{
				// 将代码块提交给主线程关联的队列，该代码块将会由主线程完成
				dispatch_async(dispatch_get_main_queue(), ^{
					self.iv.image = image;
				}); // ①
			}
			else
			{
				NSLog(@"---下载图片出现错误---");
			}
		});
}
@end
