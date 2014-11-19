//
//  FKViewController.m
//  ThreadTest
//
//  Created by yeeku on 13-9-2.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
}
- (IBAction)showImage:(id)sender
{
	NSString* url = @"http://www.crazyit.org/logo.jpg";
	// 创建新线程对象
	NSThread *thread = [[NSThread alloc]initWithTarget:self
		selector:@selector(downloadImageFromURL:) object:url];
	// 启动线程
	[thread start];
}
// 定义一个方法作为线程执行体。
-(void)downloadImageFromURL:(NSString *) url
{
	// 从网络获取数据
	NSData *data = [[NSData alloc]
		initWithContentsOfURL:[NSURL URLWithString:url]];
	// 将网络数据初始化为UIImage对象
	UIImage *image = [[UIImage alloc]initWithData:data];
	if(image != nil)
	{
		// 在主线程中执行updateUI:方法
		[self performSelectorOnMainThread:@selector(updateUI:)
			withObject:image waitUntilDone:YES]; // ①
	}
	else
	{
		NSLog(@"---下载图片出现错误---");
	}
}
-(void)updateUI:(UIImage*) image
{
	self.iv.image = image;
}
@end
