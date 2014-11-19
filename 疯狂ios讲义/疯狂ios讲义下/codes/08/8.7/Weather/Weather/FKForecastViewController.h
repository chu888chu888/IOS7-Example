//
//  FKForecastViewController.h
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKForecastViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *icons;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (nonatomic, copy)	NSString* weatherString;
@end
