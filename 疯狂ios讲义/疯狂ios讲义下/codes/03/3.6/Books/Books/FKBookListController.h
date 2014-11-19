//
//  FKBookListController.h
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKAuthor.h"

@interface FKBookListController : UITableViewController
	<UINavigationControllerDelegate>
@property (nonatomic, strong) FKAuthor* selectedAuthor;
@end
