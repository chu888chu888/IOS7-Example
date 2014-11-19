//
//  FKViewController.h
//  MultiPickerTest2
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UIPickerViewDataSource,
	UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@end
