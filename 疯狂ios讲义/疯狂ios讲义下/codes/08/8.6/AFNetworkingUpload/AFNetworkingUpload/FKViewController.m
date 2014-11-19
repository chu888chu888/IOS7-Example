//
//  FKViewController.m
//  AFNetworkingUpload
//
//  Created by yeeku on 13-10-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKAppDelegate.h"
@interface FKViewController ()
{
	FKAppDelegate* appDelegate;
	NSArray* images;
}
@end
@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	appDelegate = [UIApplication sharedApplication].delegate;
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
	NSURL *filePath = [[NSBundle mainBundle] URLForResource:fileName
		withExtension:@"png"];
	NSDictionary *parameters = @{@"name": @"额外的请求参数"};
	// 使用AFHTTPRequestOperationManager发送POST请求
	[appDelegate.manager
	 	POST:@"http://192.168.1.88:8888/AFNetworkingServer/upload"
	 	parameters:parameters
	 	// 使用代码块来封装要上传的文件数据
		constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
		{
			[formData appendPartWithFileURL:filePath  // 指定上传的文件
				name:@"file"  // 指定上传文件对应的请求参数名
			 	// 指定上传文件的原始文件名
				fileName:[NSString stringWithFormat:@"%@.png" , fileName]
			 	// 指定上传文件的MIME类型
				mimeType:@"image/png"
				error:nil];
		}
		// 获取服务器响应成功时激发的代码块
		success:^(AFHTTPRequestOperation *operation, id responseObject)
		{
			// 当使用HTTP响应解析器时，服务器响应数据被封装在NSData中
			// 此处将NSData转换成NSString、并使用UIAlertView显示登录结果
			[[[UIAlertView alloc] initWithTitle:@"上传结果" message:
			   [[NSString alloc] initWithData:responseObject encoding:
				NSUTF8StringEncoding] delegate:self
				cancelButtonTitle:@"确定" otherButtonTitles:nil]
			show];
		}
		// 获取服务器响应失败时激发的代码块
		failure:^(AFHTTPRequestOperation *operation, NSError *error)
		{
			NSLog(@"获取服务器响应出错！");
		}];
}
@end
