//
//  FKBookViewController.h
//  UINavigationControllerTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKBookViewController : UITableViewController
// 定义2个NSMutableArray对象，分别保存图书名和图书详情
@property (nonatomic , strong) NSMutableArray* books;
@property (nonatomic , strong) NSMutableArray* details;
@end
