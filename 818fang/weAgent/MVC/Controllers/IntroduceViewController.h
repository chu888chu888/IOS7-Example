//
//  IntroduceViewController.h
//  weChat
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYBlurIntroductionView.h"


@protocol  NextViewDelegate<NSObject>
@required
-(void)toNextView;
@end

@interface IntroduceViewController : UIViewController <MYIntroductionDelegate>
@property (nonatomic,assign) id <NextViewDelegate> toNextViewDetegate;

@end
