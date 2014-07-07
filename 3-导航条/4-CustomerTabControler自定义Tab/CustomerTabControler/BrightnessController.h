//
//  BrightnessController.h
//  CustomerTabControler
//
//  Created by chuguangming on 14-7-7.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrightnessController : UIViewController
{
    int brightness;
}
+ (id) controllerWithBrightness: (int) brightness;
@end
