//
//  FKRecordManager.m
//  AVRecordTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "FKRecordManager.h"
#import "FKRecorder.h"
#import "FKRecordUtils.h"

// 为FKRecordManager定义InternalUtilityMethods类别，增加一些新方法
@interface FKRecordManager (InternalUtilityMethods)
- (AVCaptureDevice *) cameraWithPosition:(AVCaptureDevicePosition)position;
- (AVCaptureDevice *) frontFacingCamera;
- (AVCaptureDevice *) backFacingCamera;
- (AVCaptureDevice *) audioDevice;
- (NSURL *) tempFileURL;
- (void) removeFile:(NSURL *)outputFileURL;
- (void) copyFileToDocuments:(NSURL *)fileURL;
@end

@implementation FKRecordManager
- (id) init
{
	self = [super init];
	if (self != nil)
	{
		__block id weakSelf = self;
		// 定义输入设备连接时执行的代码块
		void (^deviceConnectedBlock)(NSNotification *) =
		^(NSNotification *notification)
		{
			AVCaptureDevice *device = [notification object];
			BOOL sessionHasDeviceWithMatchingMediaType = NO;
			// 定义输入设备的类型
			NSString *deviceMediaType = nil;
			if ([device hasMediaType:AVMediaTypeAudio])
			{
				deviceMediaType = AVMediaTypeAudio;
			}
			else if ([device hasMediaType:AVMediaTypeVideo])
			{
				deviceMediaType = AVMediaTypeVideo;
			}
			// 如果输入设备类型不为nil
			if (deviceMediaType != nil)
			{
				for (AVCaptureDeviceInput *input in [self.session inputs])
				{
					if ([input.device hasMediaType:deviceMediaType])
					{
						sessionHasDeviceWithMatchingMediaType = YES;
						break;
					}
				}
				if (!sessionHasDeviceWithMatchingMediaType)
				{
					NSError	*error;
					AVCaptureDeviceInput *input = [AVCaptureDeviceInput
						deviceInputWithDevice:device error:&error];
					if ([self.session canAddInput:input])
					{
						// 为AVCaptureSession添加输入设备						
						[self.session addInput:input];
					}
				}
			}
			// 调用方法通知委托对象，输入设备发生了改变
			if ([self.delegate respondsToSelector:
				 @selector(recordManagerDeviceConfigurationChanged:)])
			{
				[self.delegate recordManagerDeviceConfigurationChanged:self];
			}
		};
		// 定义输入设备断开连接时执行的代码块		
		void (^deviceDisconnectedBlock)(NSNotification *) =
		^(NSNotification *notification)
		{
			AVCaptureDevice *device = [notification object];
			if ([device hasMediaType:AVMediaTypeAudio])
			{
				[self.session removeInput:[weakSelf audioInput]];
				[weakSelf setAudioInput:nil];
			}
			else if ([device hasMediaType:AVMediaTypeVideo])
			{
				[self.session removeInput:[weakSelf videoInput]];
				[weakSelf setVideoInput:nil];
			}
			// 调用方法通知委托对象，输入设备发生了改变			
			if ([self.delegate respondsToSelector:
				@selector(recordManagerDeviceConfigurationChanged:)])
			{
				[self.delegate recordManagerDeviceConfigurationChanged:self];
			}
		};
		// 定义通知中心
		NSNotificationCenter *notificationCenter =
			[NSNotificationCenter defaultCenter];
		// 使用通知中心监听输入设备连接的通知
		[self setDeviceConnectedObserver:[notificationCenter
			addObserverForName:AVCaptureDeviceWasConnectedNotification
			object:nil queue:nil usingBlock:deviceConnectedBlock]];
		// 使用通知中心监听输入设备断开连接的通知	
		[self setDeviceDisconnectedObserver:[notificationCenter
			addObserverForName:AVCaptureDeviceWasDisconnectedNotification
			object:nil queue:nil usingBlock:deviceDisconnectedBlock]];
		[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
		[notificationCenter addObserver:self selector:
		 	@selector(deviceOrientationDidChange) name:
			UIDeviceOrientationDidChangeNotification object:nil];
		self.orientation = AVCaptureVideoOrientationPortrait;
	}
	return self;
}
- (BOOL) setupSession
{
	BOOL success = NO;
	// 如果该设备的后置摄像头有射光灯
	if ([self.backFacingCamera hasFlash])
	{
		if ([self.backFacingCamera lockForConfiguration:nil])
		{
			if ([self.backFacingCamera isFlashModeSupported:AVCaptureFlashModeAuto])
			{
				// 将后置摄像头的闪光灯设为自动模式
				[self.backFacingCamera setFlashMode:AVCaptureFlashModeAuto];
			}
			[self.backFacingCamera unlockForConfiguration];
		}
	}
	// 如果该设备的后置摄像头有电筒	
	if ([self.backFacingCamera hasTorch])
	{
		if ([self.backFacingCamera lockForConfiguration:nil])
		{
			if ([self.backFacingCamera isTorchModeSupported:AVCaptureTorchModeAuto])
			{
				// 将后置摄像头的电筒设为自动模式
				[self.backFacingCamera setTorchMode:AVCaptureTorchModeAuto];
			}
			[self.backFacingCamera unlockForConfiguration];
		}
	}
	// 初始化输入设备
	AVCaptureDeviceInput *newVideoInput = [[AVCaptureDeviceInput alloc]
		initWithDevice:[self backFacingCamera] error:nil];
	AVCaptureDeviceInput *newAudioInput = [[AVCaptureDeviceInput alloc]
		initWithDevice:[self audioDevice] error:nil];
	// 设置照片的输出设备
	AVCaptureStillImageOutput *newStillImageOutput =
		[[AVCaptureStillImageOutput alloc] init];
	// 设置输出照片的格式
	NSDictionary *outputSettings = [[NSDictionary alloc]
		initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey,nil];
	[newStillImageOutput setOutputSettings:outputSettings];
	// 创建AVCaptureSession
	AVCaptureSession *newCaptureSession = [[AVCaptureSession alloc] init];
	// 将输入、输出设备添加到AVCaptureSession中
	if ([newCaptureSession canAddInput:newVideoInput])
	{
		[newCaptureSession addInput:newVideoInput];
	}
	if ([newCaptureSession canAddInput:newAudioInput])
	{
		[newCaptureSession addInput:newAudioInput];
	}
	if ([newCaptureSession canAddOutput:newStillImageOutput])
	{
		[newCaptureSession addOutput:newStillImageOutput];
	}
	[self setStillImageOutput:newStillImageOutput];
	[self setVideoInput:newVideoInput];
	[self setAudioInput:newAudioInput];
	[self setSession:newCaptureSession];
	// 设置视频的输出设备
	NSURL *outputFileURL = [self tempFileURL];
	FKRecorder *newRecorder = [[FKRecorder alloc] initWithSession:
		[self session] outputFileURL:outputFileURL];
	[newRecorder setDelegate:self];
	// 如果不能录制视频、发送错误给该对象的代理
	if (!newRecorder.recordsVideo && newRecorder.recordsAudio)
	{
		NSDictionary *errorDict = [NSDictionary dictionaryWithObjectsAndKeys:
			@"不能录制视频", NSLocalizedDescriptionKey,
			@"不能录制视频，将只有音频文件", NSLocalizedFailureReasonErrorKey, nil];
		// 初始化NSError
		NSError *noVideoError = [NSError errorWithDomain:@"FKRecord"
			code:0 userInfo:errorDict];
		if ([self.delegate respondsToSelector:
			 @selector(recordManager:didFailWithError:)])
		{
			// 调用代理对象的recordManager: didFailWithError:方法
			[self.delegate recordManager:self didFailWithError:noVideoError];
		}
	}
	[self setRecorder:newRecorder];
	success = YES;
	return success;
}
// 开始录制
- (void) startRecording
{
	// 如果当前设备支持多任务
	if ([[UIDevice currentDevice] isMultitaskingSupported])
	{
		[self setBackgroundRecordingID:[[UIApplication sharedApplication]
				beginBackgroundTaskWithExpirationHandler:^{}]];
	}
	[self removeFile:[[self recorder] outputFileURL]];
	// 开始录制
	[self.recorder startRecordingWithOrientation:self.orientation];
}
// 停止录制
- (void) stopRecording
{
	[self.recorder stopRecording];
}
// 定义捕捉静态照片的方法
- (void) captureStillImage
{
	// 获取拍照的AVCaptureConnection
	AVCaptureConnection *stillImageConnection = [FKRecordUtils
		connectionWithMediaType:AVMediaTypeVideo
		fromConnections:[[self stillImageOutput] connections]];
	if ([stillImageConnection isVideoOrientationSupported])
	{
		[stillImageConnection setVideoOrientation:self.orientation];
	}
	// 拍照并保存
	[self.stillImageOutput
		captureStillImageAsynchronouslyFromConnection:stillImageConnection
		completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error)
		{
			ALAssetsLibraryWriteImageCompletionBlock completionBlock =
			^(NSURL *assetURL, NSError *error)
			{
				if (error)
				{
					if ([self.delegate respondsToSelector:
						 @selector(recordManager:didFailWithError:)])
					{
					 	[self.delegate recordManager:self didFailWithError:error];
					}
				}
			};
			// 如果图片缓存不为NULL
			if (imageDataSampleBuffer != NULL)
			{
			 	NSData *imageData = [AVCaptureStillImageOutput
					jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
				// 创建ALAssetsLibrary，用于将照片写入相册
				ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
			 	UIImage *image = [[UIImage alloc] initWithData:imageData];
			 	[library writeImageToSavedPhotosAlbum:[image CGImage]
					orientation:(ALAssetOrientation)[image imageOrientation]
					completionBlock:completionBlock];
			}
			else
			{
			 	completionBlock(nil, error);
			}
			if ([self.delegate respondsToSelector:
				 @selector(recordManagerStillImageCaptured:)])
			{
			 	[self.delegate recordManagerStillImageCaptured:self];
			}
		}];
}
// 切换摄像头的方法
- (BOOL) toggleCamera
{
	BOOL success = NO;
	// 只有当摄像头的数量大于1时才能切换
	if (self.cameraCount > 1)
	{
		NSError *error;
		AVCaptureDeviceInput *newVideoInput;
		AVCaptureDevicePosition position = [self.videoInput.device position];
		//  如果当前正在使用后置摄像头
		if (position == AVCaptureDevicePositionBack)
		{
			newVideoInput = [[AVCaptureDeviceInput alloc]
				initWithDevice:[self frontFacingCamera] error:&error];
		}
		//  如果当前正在使用前置摄像头
		else if (position == AVCaptureDevicePositionFront)
		{
			newVideoInput = [[AVCaptureDeviceInput alloc]
				initWithDevice:[self backFacingCamera] error:&error];
		}
		// 直接返回失败
		else
		{
			return NO;
		}
		// 如果视频设备为为nil
		if (newVideoInput != nil)
		{
			[self.session beginConfiguration];
			[self.session removeInput: self.videoInput];
			if ([self.session canAddInput:newVideoInput])
			{
				[self.session addInput:newVideoInput];
				[self setVideoInput:newVideoInput];
			}
			else
			{
				[self.session addInput: self.videoInput];
			}
			[self.session commitConfiguration];
			success = YES;
		}
		// 如果出现错误，将错误提交给该对象的委托的错误处理方法
		else if (error)
		{
			if ([self.delegate respondsToSelector:
				 @selector(recordManager:didFailWithError:)])
			{
				[self.delegate recordManager:self didFailWithError:error];
			}
		}
	}
	return success;
}
// 获取摄像头的数量
- (NSUInteger) cameraCount
{
	return [[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] count];
}
// 获取麦克风的数量
- (NSUInteger) micCount
{
	return [[AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio] count];
}
// 设置自动对焦的方法
- (void) autoFocusAtPoint:(CGPoint)point
{
	// 获取视频输入设备
	AVCaptureDevice *device = [self.videoInput device];
	if ([device isFocusPointOfInterestSupported] &&
		[device isFocusModeSupported:AVCaptureFocusModeAutoFocus])
	{
		NSError *error;
		if ([device lockForConfiguration:&error]) {
			[device setFocusPointOfInterest:point];
			// 设置自动对焦
			[device setFocusMode:AVCaptureFocusModeAutoFocus];
			[device unlockForConfiguration];
		}
		else
		{
			// 如果设置失败，将错误发送给代理对象
			if ([[self delegate] respondsToSelector:
				 @selector(recordManager:didFailWithError:)])
			{
				[[self delegate] recordManager:self didFailWithError:error];
			}
		}
	}
}
// 设置连续对焦的方法
- (void) continuousFocusAtPoint:(CGPoint)point
{
	// 获取视频输入设备
	AVCaptureDevice *device = [[self videoInput] device];
	if ([device isFocusPointOfInterestSupported] &&
		[device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus])
	{
		NSError *error;
		if ([device lockForConfiguration:&error])
		{
			[device setFocusPointOfInterest:point];
			// 设置连续对焦
			[device setFocusMode:AVCaptureFocusModeContinuousAutoFocus];
			[device unlockForConfiguration];
		}
		else
		{
			// 如果设置失败，将错误发送给代理对象			
			if ([[self delegate] respondsToSelector:
				 @selector(recordManager:didFailWithError:)]) {
				[[self delegate] recordManager:self didFailWithError:error];
			}
		}
	}
}
// ========实现<FKRecorderDelegate协议的方法========
-(void)recorderRecordingDidBegin:(FKRecorder *)recorder
{
	// 调用代理对象的recordManagerRecordingBegan的方法
	if ([[self delegate] respondsToSelector:
		 @selector(recordManagerRecordingBegan:)])
	{
		[self.delegate recordManagerRecordingBegan:self];
	}
}
-(void)recorder:(FKRecorder *)recorder recordingDidFinishToOutputFileURL:
(NSURL *)outputFileURL error:(NSError *)error
{
	// 如果正在录制音频，没有录制视频
	if ([self.recorder recordsAudio] && ![self.recorder recordsVideo])
	{
		// 将outputFileURL文件复制到Documents目录下
		[self copyFileToDocuments:outputFileURL];
		// 如果当前设备支持多任务，停止后台任务
		if ([[UIDevice currentDevice] isMultitaskingSupported])
		{
			[[UIApplication sharedApplication]
			 endBackgroundTask:[self backgroundRecordingID]];
		}
		// 通知代理对象，录制完成
		if ([self.delegate respondsToSelector:
			 @selector(recordManagerRecordingFinished:)])
		{
			[self.delegate recordManagerRecordingFinished:self];
		}
	}
	else
	{
		// 创建ALAssetsLibrary将视频添加到相册库中
		ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
		[library writeVideoAtPathToSavedPhotosAlbum:outputFileURL
									completionBlock:^(NSURL *assetURL, NSError *error)
		 {
			 // 如果有错误
			 if (error)
			 {
				 // 将错误发送给代理对象
				 if ([self.delegate respondsToSelector:
					  @selector(recordManager:didFailWithError:)])
				 {
					 [self.delegate recordManager:self didFailWithError:error];
				 }
			 }
			 // 如果当前设备支持多任务，停止后台任务
			 if ([[UIDevice currentDevice] isMultitaskingSupported])
			 {
				 [[UIApplication sharedApplication]
				  endBackgroundTask:[self backgroundRecordingID]];
			 }
			 // 通知代理对象，录制完成
			 if ([self.delegate respondsToSelector:
				  @selector(recordManagerRecordingFinished:)])
			 {
				 [self.delegate recordManagerRecordingFinished:self];
			 }
		 }];
	}
}
@end
@implementation FKRecordManager (InternalUtilityMethods)
// 跟踪设备方向的改变，保证视频和相片的方向与设备方向一致
- (void)deviceOrientationDidChange
{
	UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
	if (deviceOrientation == UIDeviceOrientationPortrait)
	{
		self.orientation = AVCaptureVideoOrientationPortrait;
	}
	else if (deviceOrientation == UIDeviceOrientationPortraitUpsideDown)
	{
		self.orientation = AVCaptureVideoOrientationPortraitUpsideDown;
	}
	// 需要指出的是：AVCapture与UIDevice的横屏方向是相反的。
	else if (deviceOrientation == UIDeviceOrientationLandscapeLeft)
	{
		self.orientation = AVCaptureVideoOrientationLandscapeRight;
	}
	else if (deviceOrientation == UIDeviceOrientationLandscapeRight)
	{
		self.orientation = AVCaptureVideoOrientationLandscapeLeft;
	}
}
// 定义一个方法，获取前置或后置的视频设备
- (AVCaptureDevice *) cameraWithPosition:(AVCaptureDevicePosition) position
{
	// 获取所偶的视频设备
	NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
	// 遍历所有的视频设备
	for (AVCaptureDevice *device in devices)
	{
		// 如果该设备的位置与被查找位置相同，返回该视频设备
		if (device.position == position)
		{
			return device;
		}
	}
	return nil;
}
// 定义获取前置摄像头的方法
- (AVCaptureDevice *) frontFacingCamera
{
	return [self cameraWithPosition:AVCaptureDevicePositionFront];
}
// 定义获取后置摄像头的方法
- (AVCaptureDevice *) backFacingCamera
{
	return [self cameraWithPosition:AVCaptureDevicePositionBack];
}
// 获取录音设备的方法
- (AVCaptureDevice *) audioDevice
{
	NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio];
	if ([devices count] > 0) {
		return [devices objectAtIndex:0];
	}
	return nil;
}
// 定义获取临时文件URL的方法
- (NSURL *) tempFileURL
{
	return [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@",
		NSTemporaryDirectory(), @"output.mov"]];
}
// 定义删除文件的方法
- (void) removeFile:(NSURL *)fileURL
{
	NSString *filePath = [fileURL path];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	// 如果要删除的文件存在
	if ([fileManager fileExistsAtPath:filePath])
	{
		NSError *error;
		// 删除文件。如果删除失败，发送消息给代理对象
		if ([fileManager removeItemAtPath:filePath error:&error] == NO)
		{
			if ([self.delegate respondsToSelector:
				 @selector(recordManager:didFailWithError:)])
			{
				[self.delegate recordManager:self didFailWithError:error];
			}
		}
	}
}
// 复制文件的方法
- (void) copyFileToDocuments:(NSURL *)fileURL
{
	// 获取Home路径
	NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(
		NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	// 创建日期格式器
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
	// 定义复制文件的目标文件名
	NSString *destinationPath = [documentsDirectory
		stringByAppendingFormat:@"/output_%@.mov",
		[dateFormatter stringFromDate:[NSDate date]]];
	NSError	*error;
	// 复制文件。如果复制失败，发送消息给代理对象	
	if (![[NSFileManager defaultManager] copyItemAtURL:fileURL
		toURL:[NSURL fileURLWithPath:destinationPath] error:&error])
	{
		if ([[self delegate] respondsToSelector:
			 @selector(recordManager:didFailWithError:)])
		{
			[[self delegate] recordManager:self didFailWithError:error];
		}
	}
}
@end
