//
//  FKRecorder.m
//  AVRecordTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKRecorder.h"
#import "FKRecordUtils.h"

@implementation FKRecorder
- (id) initWithSession:(AVCaptureSession *)aSession
	outputFileURL:(NSURL *)anOutputFileURL
{
    self = [super init];
    if (self != nil)
	{
        AVCaptureMovieFileOutput *aMovieFileOutput =
			[[AVCaptureMovieFileOutput alloc] init];
		// 如果该AVCaptureSession能添加aMovieFileOutput，执行添加
        if ([aSession canAddOutput:aMovieFileOutput])
		{
            [aSession addOutput:aMovieFileOutput];
		}
        self.movieFileOutput = aMovieFileOutput;
		self.session = aSession;
		self.outputFileURL = anOutputFileURL;
    }
	return self;
}
// 返回是否录制视频
-(BOOL)recordsVideo
{
	AVCaptureConnection *videoConnection = [FKRecordUtils
		connectionWithMediaType:AVMediaTypeVideo
		fromConnections:[[self movieFileOutput] connections]];
	return videoConnection.isActive;
}
// 返回是否录制音频
-(BOOL)recordsAudio
{
	AVCaptureConnection *audioConnection = [FKRecordUtils
		connectionWithMediaType:AVMediaTypeAudio
		fromConnections:[[self movieFileOutput] connections]];
	return audioConnection.isActive;
}
// 判断是否正在录制
-(BOOL)isRecording
{
    return self.movieFileOutput.isRecording;
}
// 根据指定录制方向开始录制
-(void)startRecordingWithOrientation:(AVCaptureVideoOrientation)videoOrientation
{
    AVCaptureConnection *videoConnection = [FKRecordUtils connectionWithMediaType:
		AVMediaTypeVideo fromConnections:[[self movieFileOutput] connections]];
    if ([videoConnection isVideoOrientationSupported])
	{
        videoConnection.videoOrientation = videoOrientation;
	}
	[self.movieFileOutput startRecordingToOutputFileURL:
			self.outputFileURL recordingDelegate:self];
}
// 停止录制
-(void)stopRecording
{
    [self.movieFileOutput stopRecording];
}
// 实现AVCaptureFileOutputRecordingDelegate协议中的方法：开始录制时执行该方法
- (void) captureOutput:(AVCaptureFileOutput *)captureOutput
	didStartRecordingToOutputFileAtURL:(NSURL *)fileURL
	fromConnections:(NSArray *)connections
{
    if ([self.delegate respondsToSelector:
		 @selector(recorderRecordingDidBegin:)])
	{
        [self.delegate recorderRecordingDidBegin:self];
    }
}
// 实现AVCaptureFileOutputRecordingDelegate协议中的方法：录制完成时执行该方法
- (void) captureOutput:(AVCaptureFileOutput *)captureOutput
	didFinishRecordingToOutputFileAtURL:(NSURL *)anOutputFileURL
	fromConnections:(NSArray *)connections error:(NSError *)error
{
    if ([self.delegate respondsToSelector:
		 @selector(recorder:recordingDidFinishToOutputFileURL:error:)])
	{
        [self.delegate recorder:self
			recordingDidFinishToOutputFileURL:anOutputFileURL error:error];
    }
}
@end