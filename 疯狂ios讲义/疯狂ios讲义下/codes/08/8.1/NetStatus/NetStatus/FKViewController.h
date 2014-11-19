//
//  FKViewController.h
//  NetStatus
//
//  Created by yeeku on 13-9-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *siteField;
- (IBAction)testNetStatus:(id)sender;
- (IBAction)testWifi:(id)sender;
- (IBAction)testInternet:(id)sender;
- (IBAction)finishEdit:(id)sender;
@end
