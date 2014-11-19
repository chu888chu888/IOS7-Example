//
//  FKAddEventController.h
//  CoreDataTest
//
//  Created by yeeku on 13-9-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKAddEventController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *eventField;
- (IBAction)finishEdit:(id)sender;
@end
