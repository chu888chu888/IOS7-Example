//
//  FKViewController.h
//  CloudTest
//
//  Created by yeeku on 13-11-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKDetailController : UIViewController
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UITextView *diaryDetail;
- (void) changeDisplay;
@end
