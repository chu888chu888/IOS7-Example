//
//  FKAppDelegate.h
//  SelectCellTest
//
//  Created by yeeku on 13-9-25.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
// 作为UITableView显示数据的两个NSArray
@property (strong, nonatomic) NSMutableArray* books;
@property (strong, nonatomic) NSMutableArray* details;
@end
