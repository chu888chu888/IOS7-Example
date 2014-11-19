//
//  FKViewController.h
//  AVAudioRecorderTest
//
//  Created by yeeku on 13-8-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<AVAudioRecorderDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *sampleRateSeg;
@property (strong, nonatomic) IBOutlet UISegmentedControl *bitDeptSeg;
@property (strong, nonatomic) IBOutlet UISwitch *stereoSwitch;
@property (strong, nonatomic) IBOutlet UIButton *recordBn;
// 该属性代表了该应用的Documnts目录
@property (nonatomic, copy) NSString* documentsPath;
- (IBAction)clicked:(id)sender;
- (IBAction)play:(id)sender;
@end
