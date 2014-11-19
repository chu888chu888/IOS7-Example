//
//  FKViewController.h
//  AVAudioPlayerTest
//
//  Created by yeeku on 13-8-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
// 实现AVAudioPlayerDelegate接口
@interface FKViewController : UIViewController<AVAudioPlayerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *bn1;
@property (strong, nonatomic) IBOutlet UIButton *bn2;
@property (strong, nonatomic) IBOutlet UILabel *show;
@property (strong, nonatomic) IBOutlet UIProgressView *prog;
- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
@end
