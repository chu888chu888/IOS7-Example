//
//  FKViewController.h
//  CustomPicker
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
	<UIPickerViewDataSource, UIPickerViewDelegate>
// 分别绑定到应用界面的3个UI控件
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIButton *startBn;
- (IBAction)clicked:(id)sender;
@end
