//
//  FKViewController.m
//  AFNetworkingUpload
//
//  Created by yeeku on 13-10-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "ASIFormDataRequest.h"
@interface FKViewController ()
{
	NSArray* images;
}
@end
@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.picker.dataSource = self;
	self.picker.delegate = self;
	// 使用简化语法创建NSArray集合
	images = @[@"logo", @"java" , @"android"];
}
// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
	// 返回1表明该控件只包含1列
	return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
	numberOfRowsInComponent:(NSInteger)component
{
	return images.count;
}
#define kImageTag 1
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:
	(NSInteger)row forComponent:(NSInteger)component
	reusingView:(UIView *)view
{

	// 如果可重用的view的tag不等于kImageTag，表明该view已经不存在，需要重新创建
	if(view.tag != kImageTag)
	{
		view = [[UIView alloc] init];
		// 为该UIView设置tag属性
		view.tag = kImageTag;
		// 设置不允许用户交互
		view.userInteractionEnabled = NO;
		UIImageView* iv = [[UIImageView alloc] initWithImage:
			[UIImage imageNamed:[images objectAtIndex:row]]];
		iv.frame = CGRectMake(0 , 0  , 48 ,48);
		iv.contentMode = UIViewContentModeScaleAspectFit;
		[view addSubview:iv];
	}
	return view;
}
// UIPickerViewDelegate中定义的方法，该方法的返回值决定列表项的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView
rowHeightForComponent:(NSInteger)component
{
	return 48;
}
// UIPickerViewDelegate中定义的方法，该方法的返回值决定列表项的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView
	widthForComponent:(NSInteger)component
{
	return 48;
}
- (IBAction)upload:(id)sender
{
	// 获取用户选中的行
	NSInteger selectedRow = [self.picker selectedRowInComponent:0];
	// 获取用户选中的文件名
	NSString* fileName = [images objectAtIndex:selectedRow];
	// 根据用户选中的文件名确定需要上传的文件
	NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName
		ofType:@"png"];
	// 定义提交文件上传请求的URL
	NSURL* url = [NSURL URLWithString:
		@"http://192.168.1.88:8888/ASIHTTPServer/upload"];
	__block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	// 设置POST请求参数
	[request setPostValue:@"额外的请求参数" forKey:@"name"];
	// 设置要上传的文件
	[request setFile:filePath  // 指定上传的文件
		// 指定上传文件的原始文件名
		withFileName:[NSString stringWithFormat:@"%@.png" , fileName]
		andContentType:@"image/png" // 指定上传文件的MIME类型
		forKey:@"file"];  // 指定上传文件对应的请求参数名
	// 设置发送请求、获取服务器响应完成时激发的代码块
	[request setCompletionBlock:^{
		NSString *responseString = [request responseString];
		[[[UIAlertView alloc] initWithTitle:@"登录结果"
			message:responseString delegate:self
			cancelButtonTitle:@"确定" otherButtonTitles:nil]
		 show];
	}];
	// 设置发送请求失败时激发该方法
	[request setFailedBlock:^{
		NSError *error = request.error;
		NSLog(@"获取服务器响应出现错误%@" , error);
	}];
	// 发送异步请求
	[request startAsynchronous];
}
@end
