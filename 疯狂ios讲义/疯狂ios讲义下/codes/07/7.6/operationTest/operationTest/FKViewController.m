//
//  FKViewController.m
//  operationTest
//
//  Created by yeeku on 13-9-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKDownImageOperation.h"

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
	// 定义要加载的图片的URL
	NSURL* url = [NSURL URLWithString:@"http://www.crazyit.org/logo.jpg"];
	// 创建FKDownImageOperation对象
	FKDownImageOperation* operation = [[FKDownImageOperation alloc]
		initWithURL:url imageView:self.iv];
	// 将NSOperation的子类的实例提交给NSOperationQueue
	[queue addOperation:operation];
}
@end
