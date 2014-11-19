//
//  FKAddBookController.h
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKAddAuthorController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *descField;
- (IBAction)finishEdit:(id)sender;
- (IBAction)addAuthor:(id)sender;
@end
