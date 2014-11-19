//
//  FKAddAuthorController.h
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKAuthor.h"

@interface FKAddBookController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *publishField;
- (IBAction)finishEdit:(id)sender;
- (IBAction)addBook:(id)sender;
@property (strong, nonatomic) FKAuthor* selectedAuthor;
@end
