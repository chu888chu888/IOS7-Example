//
//  FKViewController.h
//  UITextViewTest
//
//  Created by yeeku on 13-6-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController <UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end
