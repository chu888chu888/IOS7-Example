//
//  FKViewController.h
//  AFNetworkingUpload
//
//  Created by yeeku on 13-10-4.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UIPickerViewDataSource
	, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)upload:(id)sender;
@end
