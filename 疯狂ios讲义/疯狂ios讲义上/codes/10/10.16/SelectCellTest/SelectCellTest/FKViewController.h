//
//  FKViewController.h
//  UITableViewTest
//
//  Created by yeeku on 13-6-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UITableViewDataSource
	, UITableViewDelegate>
// 绑定到界面上UITableView控件的IBOutlet属性
@property (strong, nonatomic) IBOutlet UITableView *table;
@end
