//
//  FKPageController.h
//  UIPageControlTest
//
//  Created by yeeku on 13-6-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKPageController : UIViewController
@property (assign, nonatomic) NSUInteger pageIndex;
- (id)initWithPageNumber:(NSInteger)pageNumber;
@end
