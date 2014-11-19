//
//  FKEditVewController.h
//  UINavigationControllerTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface FKEditViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextView *detailField;
- (IBAction)finish:(id)sender;
// 保存从上一个控制器传入数据的属性
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* detail;
@property (nonatomic, assign) NSInteger rowNo;
@end
