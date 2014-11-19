//
//  FKRecordManager.h
//  AVRecordTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import "FKRecorder.h"

@protocol FKRecordManagerDelegate;

@interface FKRecordManager : NSObject <FKRecorderDelegate>
// 定义AVCaptureSession对象，管理输入设备到输出端的数据流
@property (nonatomic,retain) AVCaptureSession *session;
@property (nonatomic,assign) AVCaptureVideoOrientation orientation;
// 定义捕捉视频和声音的输入设备
@property (nonatomic,retain) AVCaptureDeviceInput *videoInput;
@property (nonatomic,retain) AVCaptureDeviceInput *audioInput;
// 定义输出静态照片的输出端
@property (nonatomic,retain) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic,retain) FKRecorder *recorder;
@property (nonatomic,assign) id deviceConnectedObserver;
@property (nonatomic,assign) id deviceDisconnectedObserver;
@property (nonatomic,assign) UIBackgroundTaskIdentifier backgroundRecordingID;
@property (nonatomic,assign) id <FKRecordManagerDelegate> delegate;
- (BOOL) setupSession;
- (void) startRecording;
- (void) stopRecording;
- (void) captureStillImage;
- (BOOL) toggleCamera;
- (NSUInteger) cameraCount;
- (NSUInteger) micCount;
- (void) autoFocusAtPoint:(CGPoint)point;
- (void) continuousFocusAtPoint:(CGPoint)point;
@end
// 定义该对象的代理对象必须遵守的协议
@protocol FKRecordManagerDelegate <NSObject>
@optional
- (void) recordManager:(FKRecordManager *)recordManager
	didFailWithError:(NSError *)error;
- (void) recordManagerRecordingBegan:(FKRecordManager *)recordManager;
- (void) recordManagerRecordingFinished:(FKRecordManager *)recordManager;
- (void) recordManagerStillImageCaptured:(FKRecordManager *)recordManager;
- (void) recordManagerDeviceConfigurationChanged:(FKRecordManager *)recordManager;
@end
