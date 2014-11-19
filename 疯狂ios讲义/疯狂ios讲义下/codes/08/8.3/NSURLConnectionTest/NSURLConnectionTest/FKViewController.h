//
//  FKViewController.h
//  NSURLConnectionTest
//
//  Created by yeeku on 13-9-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FKViewController : UIViewController <NSURLConnectionDataDelegate>
@property (strong, nonatomic) IBOutlet UITextView *showView;

@end
