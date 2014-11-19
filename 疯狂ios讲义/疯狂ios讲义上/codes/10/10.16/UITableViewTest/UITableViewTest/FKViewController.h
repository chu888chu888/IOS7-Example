//
//  FKViewController.h
//  UITableViewTest
//
//  Created by yeeku on 13-6-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UITableViewDataSource>
// 绑定到界面上UITableView控件的IBOutlet属性
@property (strong, nonatomic) IBOutlet UITableView *table;
// 作为UITableView显示数据的两个NSArray
@property (strong, nonatomic) NSArray* books;
@property (strong, nonatomic) NSArray* details;
@end
