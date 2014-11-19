//
//  FKViewController.m
//  ImagePickerTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "FKViewController.h"

@implementation FKViewController
UIImagePickerController* picker;
- (void)viewDidLoad
{
	[super viewDidLoad];
	picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
}
- (IBAction)takePhoto:(id)sender
{
	// 如果拍摄的摄像头可用
	if ([UIImagePickerController isSourceTypeAvailable:
		UIImagePickerControllerSourceTypeCamera])
	{
		// 将sourceType设为UIImagePickerControllerSourceTypeCamera代表拍照或拍视频		
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		// 设置拍摄照片
		picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
		// 设置使用手机的后置摄像头（默认使用后置摄像头）
		picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
		// 设置使用手机的前置摄像头。
//		picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
		// 设置拍摄的照片允许编辑
		picker.allowsEditing = YES;
	}
	else
	{
		NSLog(@"模拟器无法打开摄像头");
	}
	// 显示picker视图控制器
	[self presentViewController:picker animated: YES completion:nil];
}
- (IBAction)takeVideo:(id)sender
{
	if ([UIImagePickerController isSourceTypeAvailable:
		UIImagePickerControllerSourceTypeCamera])
	{
		// 将sourceType设为UIImagePickerControllerSourceTypeCamera代表拍照或拍视频
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		// 将mediaTypes设为所有支持的多媒体类型
		picker.mediaTypes = [UIImagePickerController
			availableMediaTypesForSourceType:
			UIImagePickerControllerSourceTypeCamera];
		// 设置拍摄视频
		picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
		// 设置拍摄高质量的视频
		picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
	}
	else
	{
		NSLog(@"模拟器无法打开摄像头");
	}
	[self presentViewController:picker animated: YES completion:nil];
}
- (IBAction)loadPhoto:(id)sender
{
	// 设置选择载相册的图片或视频
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	picker.allowsEditing = NO;
	[self presentViewController:picker animated: YES completion:nil];	
}
// 当得到照片或者视频后，调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker
	didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	NSLog(@"成功：%@", info);
	// 获取用户拍摄的是照片还是视频
	NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
	// 判断获取类型：图片，并且是刚拍摄的照片
	if ([mediaType isEqualToString:(NSString *)kUTTypeImage]
		&& picker.sourceType == UIImagePickerControllerSourceTypeCamera)
	{
		UIImage *theImage = nil;
		// 判断，图片是否允许修改
		if ([picker allowsEditing])
		{
			// 获取用户编辑之后的图像
			theImage = [info objectForKey:UIImagePickerControllerEditedImage];
		}
		else
		{
			// 获取原始的照片
			theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
		}
		// 保存图片到相册中
		UIImageWriteToSavedPhotosAlbum(theImage, self,nil, nil);
	}
	// 判断获取类型：视频，并且是刚拍摄的视频
	else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
	{
		//获取视频文件的url
		NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
		
		//创建ALAssetsLibrary对象并将视频保存到媒体库
		ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
		// 将视频保存到相册中
		[assetsLibrary writeVideoAtPathToSavedPhotosAlbum:mediaURL
			completionBlock:^(NSURL *assetURL, NSError *error)
			{
				// 如果没有错误，显示保存成功。
				if (!error)
				{
					NSLog(@"视频保存成功！");
				}
				else
				{
					NSLog(@"保存视频出现错误：%@", error);
				}
			}];
	}
	// 隐藏UIImagePickerController
	[picker dismissViewControllerAnimated:YES completion:nil];
}
// 当用户取消时，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	NSLog(@"用户取消的拍摄！");
	// 隐藏UIImagePickerController
	[picker dismissViewControllerAnimated:YES completion:nil];
}
@end