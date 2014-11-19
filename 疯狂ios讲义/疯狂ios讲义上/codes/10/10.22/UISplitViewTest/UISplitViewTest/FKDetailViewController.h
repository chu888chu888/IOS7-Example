//
//  FKDetailViewController.h
//  Books
//
//  Created by yeeku on 13-2-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKDetailViewController : UIViewController
	<UISplitViewControllerDelegate>
// 用于记录传过来的数据的属性
@property (strong, nonatomic) id detailItem;
// 用于绑定到页面上UILabel、UIImageView的两个IBOutlet属性
@property (strong, nonatomic) IBOutlet UILabel *bookName;
@property (strong, nonatomic) IBOutlet UIImageView *bookCover;
- (void)configureView;
@end
