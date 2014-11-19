//
//  FKViewController.h
//  BlendTest
//
//  Created by yeeku on 13-7-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<
	UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
