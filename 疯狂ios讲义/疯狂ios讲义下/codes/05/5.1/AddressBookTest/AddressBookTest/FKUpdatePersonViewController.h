//
//  FKUpdatePersonViewController.h
//  AddressBookTest
//
//  Created by yeeku on 13-10-25.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKUpdatePersonViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstnameField;
@property (strong, nonatomic) IBOutlet UITextField *lastnameField;
- (IBAction)update:(id)sender;
- (IBAction)finishEdit:(id)sender;
@end
