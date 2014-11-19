//
//  FKViewController.h
//  UISearchBarTest
//
//  Created by yeeku on 13-6-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UITableViewDataSource
	, UITableViewDelegate ,UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end
