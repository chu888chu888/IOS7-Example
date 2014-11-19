//
//  FKViewController.m
//  blockTest
//
//  Created by yeeku on 13-9-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSOperationQueue* queue;
- (void)viewDidLoad
{
	[super viewDidLoad];
	queue = [[NSOperationQueue alloc]init];
	// 设置该队列最多支持10条并发线程
	queue.maxConcurrentOperationCount = 10;
}
- (IBAction)clicked:(id)sender
{
	NSString* url = @"http://www.crazyit.org/logo.jpg";
	// 以传入的代码块作为执行体，创建NSOperation
	NSBlockOperation* operation = [NSBlockOperation
		blockOperationWithBlock:^{
			// 从网络获取数据
			NSData *data = [[NSData alloc]
				initWithContentsOfURL:[NSURL URLWithString:url]];
			// 将网络数据初始化为UIImage对象
			UIImage *image = [[UIImage alloc]initWithData:data];
			if(image != nil)
			{
				// 在主线程中执行updateUI:方法
				[self performSelectorOnMainThread:@selector(updateUI:)
					withObject:image waitUntilDone:YES];
			}
			else
			{
				NSLog(@"---下载图片出现错误---");
			}
		}];
	// 将NSOperation添加给NSOperationQueue
	[queue addOperation:operation];
}
-(void)updateUI:(UIImage*) image
{
	self.iv.image = image;
}
@end
