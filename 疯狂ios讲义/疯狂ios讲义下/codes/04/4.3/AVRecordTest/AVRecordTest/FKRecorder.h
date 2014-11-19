//
//  FKRecorder.h
//  AVRecordTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol FKRecorderDelegate;

@interface FKRecorder : NSObject <AVCaptureFileOutputRecordingDelegate>

@property (nonatomic,retain) AVCaptureSession *session;
@property (nonatomic,retain) AVCaptureMovieFileOutput *movieFileOutput;
@property (nonatomic,copy) NSURL *outputFileURL;
@property (nonatomic,readonly) BOOL recordsVideo;
@property (nonatomic,readonly) BOOL recordsAudio;
@property (nonatomic,readonly,getter=isRecording) BOOL recording;
@property (nonatomic,assign) id <NSObject,FKRecorderDelegate> delegate;

-(id)initWithSession:(AVCaptureSession *)session
	outputFileURL:(NSURL *)outputFileURL;
-(void)startRecordingWithOrientation:(AVCaptureVideoOrientation)videoOrientation;
-(void)stopRecording;
@end

@protocol FKRecorderDelegate
@required
-(void)recorderRecordingDidBegin:(FKRecorder *)recorder;
-(void)recorder:(FKRecorder *)recorder recordingDidFinishToOutputFileURL:
	(NSURL *)outputFileURL error:(NSError *)error;
@end
