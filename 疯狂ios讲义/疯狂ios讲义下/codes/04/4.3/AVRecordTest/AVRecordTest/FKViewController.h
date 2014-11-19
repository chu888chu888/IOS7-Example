//
//  FKViewController.h
//  AVRecordTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class FKRecordManager;
@interface FKViewController : UIViewController
@property (nonatomic,retain) FKRecordManager *recordManager;
@property (nonatomic,retain) IBOutlet UIView *videoPreviewView;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *recordButton;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *cameraToggleButton;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *stillButton;
- (IBAction)toggleRecording:(id)sender;
- (IBAction)toggleCamera:(id)sender;
- (IBAction)captureStillImage:(id)sender;
@end

