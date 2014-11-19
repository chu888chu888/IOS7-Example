//
//  FKViewController.h
//  MyBrowser
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *addr;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)goClicked:(id)sender;

@end
