//
//  FKAddPersonViewController.h
//  AddressBookTest
//
//  Created by yeeku on 13-10-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKAddPersonViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstnameField;
@property (strong, nonatomic) IBOutlet UITextField *lastnameField;
@property (strong, nonatomic) IBOutlet UITextField *homePhoneField;
@property (strong, nonatomic) IBOutlet UITextField *mobilePhoneField;
@property (strong, nonatomic) IBOutlet UITextField *workMailField;
@property (strong, nonatomic) IBOutlet UITextField *privateMailField;
@property (strong, nonatomic) IBOutlet UITextField *countryField;
@property (strong, nonatomic) IBOutlet UITextField *stateField;
- (IBAction)add:(id)sender;
- (IBAction)finishEdit:(id)sender;
@end
