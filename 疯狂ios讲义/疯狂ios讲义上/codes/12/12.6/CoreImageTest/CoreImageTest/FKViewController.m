//
//  FKViewController.m
//  CoreImageTest
//
//  Created by yeeku on 13-7-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
UIImagePickerController *imagePicker;
CIContext* ctx;
CIImage* beginImage;
UIImage* resultImage;
CIFilter* filter1;
CIFilter* filter2;
CIFilter* filter3;
CIFilter* filter4;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建UIImagePickerController对象，用于选取照片库的照片
	imagePicker = [[UIImagePickerController alloc] init];
	// 将UIImagePickerController的委托设self
	imagePicker.delegate = self;
	self.slider1.minimumValue = 0;
	self.slider1.maximumValue = 10;
	self.slider2.minimumValue = -4;
	self.slider2.maximumValue = 4;
	self.slider3.minimumValue = -2 * M_PI;
	self.slider3.maximumValue = 2 * M_PI;
	self.slider4.minimumValue = 0;
	self.slider4.maximumValue = 30;
	// 调用reset方法来初始化程序界面。
	[self reset:nil];
	// 打印所有过滤器信息（仅仅是为了查看）
	[self logAllFilters];
	// 创建基于CPU的CIContext对象
	ctx = [CIContext contextWithOptions:
		[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES]
		forKey:kCIContextUseSoftwareRenderer]];
	// 创建基于GPU的CIContext对象
	ctx = [CIContext contextWithOptions: nil];
	// 创建基于OpenGL优化的CIContext对象，可获得实时性能
	EAGLContext * eaglctx = [[EAGLContext alloc]
		initWithAPI:kEAGLRenderingAPIOpenGLES2];
	ctx = [CIContext contextWithEAGLContext:eaglctx];
	// 根据过滤器名来创建过滤器
	filter1 = [CIFilter filterWithName:@"CIGaussianBlur"];
	filter2 = [CIFilter filterWithName:@"CIBumpDistortion"];
	filter3 = [CIFilter filterWithName:@"CIHueAdjust"];
	filter4 = [CIFilter filterWithName:@"CIPixellate"];
}
// 定义一个工具方法，对程序本身没有任何作用，仅仅用于查看系统内建的所有过滤器
- (void)logAllFilters
{
	NSArray *properties = [CIFilter filterNamesInCategory:
						kCICategoryBuiltIn];
	NSLog(@"所有内建过滤器:\n%@", properties);
	for (NSString *filterName in properties)
	{
		CIFilter *fltr = [CIFilter filterWithName:filterName];
		// 打印所有过滤器的默认属性
		NSLog(@"====%@====\n%@", filterName, [fltr attributes]);
	}
}
- (IBAction)sliderChange1:(id)sender
{
	// 重设界面上其他UISlider的初始值
	self.slider2.value = 0;
	self.slider3.value = 0;
	self.slider4.value = 0;
	float slideValue = self.slider1.value;
	// 设置过滤器该过滤器处理的原始图片
	[filter1 setValue:beginImage forKey:@"inputImage"];
	// 为过滤器设置参数
	[filter1 setValue:[NSNumber numberWithFloat:slideValue]
		forKey:@"inputRadius"];
	// 得到过滤器处理后的图片
	CIImage* outImage = [filter1 outputImage];
	CGImageRef tmp = [ctx createCGImage:outImage
							   fromRect:[outImage extent]];
	// 将处理后的图片转换为UIImage
	resultImage = [UIImage imageWithCGImage:tmp];
	CGImageRelease(tmp);
	// 显示图片
	[self.iv setImage:resultImage];
}

- (IBAction)sliderChange2:(id)sender
{
	// 重设界面上其他UISlider的初始值
	self.slider1.value = 0;
	self.slider3.value = 0;
	self.slider4.value = 0;
	float slideValue = self.slider2.value;
	// 设置过滤器该过滤器处理的原始图片
	[filter2 setValue:beginImage forKey:@"inputImage"];
	// 为过滤器设置参数
	[filter2 setValue:[CIVector vectorWithX:150 Y:240]
		forKey:@"inputCenter"];
	[filter2 setValue:[NSNumber numberWithFloat:150]
		forKey:@"inputRadius"];
	[filter2 setValue:[NSNumber numberWithFloat:slideValue]
		forKey:@"inputScale"];
	// 得到过滤器处理后的图片
	CIImage* outImage = [filter2 outputImage];
	CGImageRef tmp = [ctx createCGImage:outImage
							   fromRect:[outImage extent]];
	// 将处理后的图片转换为UIImage
	resultImage = [UIImage imageWithCGImage:tmp];
	CGImageRelease(tmp);
	// 显示图片
	[self.iv setImage:resultImage];
}
- (IBAction)sliderChange3:(id)sender
{
	// 重设界面上其他UISlider的初始值
	self.slider1.value = 0;
	self.slider2.value = 0;
	self.slider4.value = 0;
	float slideValue = self.slider3.value;
	// 设置过滤器该过滤器处理的原始图片
	[filter3 setValue:beginImage forKey:@"inputImage"];
	// 为过滤器设置参数	
	[filter3 setValue:[NSNumber numberWithFloat:slideValue]
		forKey:@"inputAngle"];
	// 得到过滤器处理后的图片
	CIImage* outImage = [filter3 outputImage];
	CGImageRef tmp = [ctx createCGImage:outImage
							   fromRect:[outImage extent]];
	// 将处理后的图片转换为UIImage
	resultImage = [UIImage imageWithCGImage:tmp];
	CGImageRelease(tmp);
	// 显示图片
	[self.iv setImage:resultImage];
}
- (IBAction)sliderChange4:(id)sender
{
	// 重设界面上其他Slider的初始值
	self.slider1.value = 0;
	self.slider2.value = 0;
	self.slider3.value = 0;
	float slideValue = self.slider4.value;
	// 设置过滤器参数
	[filter4 setValue:beginImage forKey:@"inputImage"];
	[filter4 setValue:[CIVector vectorWithX:150 Y:240]
		forKey:@"inputCenter"];
	[filter4 setValue:[NSNumber numberWithFloat:slideValue]
		forKey:@"inputScale"];
	// 得到过滤器处理后的图片
	CIImage* outImage = [filter4 outputImage];
	CGImageRef tmp = [ctx createCGImage:outImage
							   fromRect:[outImage extent]];
	// 将处理后的图片转换为UIImage
	resultImage = [UIImage imageWithCGImage:tmp];
	CGImageRelease(tmp);
	// 显示图片
	[self.iv setImage:resultImage];
}
- (IBAction)reset:(id)sender
{
	// 重设界面上UISlider的初始值
	self.slider1.value = 0;
	self.slider2.value = 0;
	self.slider3.value = 0;
	self.slider4.value = 0;
	// 得到原始的图片路径
	NSString *filePath = [[NSBundle mainBundle]
		pathForResource:@"all-fish" ofType:@"png"];
	// 将图片路径转换为图片URL
	NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
	// 使用文件路径来创建UIImage，设置界面初始显示的图片
	self.iv.image = [UIImage imageWithContentsOfFile:filePath];
	// 使用图片URL创建CIImage
	beginImage = [CIImage imageWithContentsOfURL:fileUrl];
}

- (IBAction)load:(id)sender
{
	// 显示照片库
	[self presentViewController:imagePicker
		animated:YES completion:nil];
}
- (IBAction)save:(id)sender
{
	// 调用UIImageWriteToSavedPhotosAlbum函数将结果图片保存到照片库
	UIImageWriteToSavedPhotosAlbum(resultImage, nil, nil,nil);
}
// 当用户选中照片的某个方法时激发该方法
- (void)imagePickerController:(UIImagePickerController *)picker
	didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	// 隐藏照片库、退回原来界面
	[self dismissViewControllerAnimated:YES completion:nil];
	// 获取用户选中的照片
	UIImage *selectedImage = [info objectForKey:
		UIImagePickerControllerOriginalImage];
	// 根据已有的UImage创建CIImage
	beginImage = [CIImage imageWithCGImage:selectedImage.CGImage];
	// 显示用户选中的照片
	self.iv.image = selectedImage;
}
// 当用户单击照片库的取消按钮时激发该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	// 隐藏照片库、退回原来界面
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
