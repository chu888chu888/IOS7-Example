//
//  FKViewController.h
//  DashLineTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic, strong) IBOutlet UIPickerView *picker;
@property(nonatomic, strong) IBOutlet UISlider *phase;
-(IBAction)reset;
@end
