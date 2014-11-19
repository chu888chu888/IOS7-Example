//
//  FKDetailViewController.h
//  UICollectionViewTest
//
//  Created by yeeku on 13-6-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *bookCover;
@property (strong, nonatomic) IBOutlet UITextView *bookDetail;
// 用于接受上一个控制器传入参数的属性
@property (strong, nonatomic) NSString* imageName;
@property (nonatomic, assign) NSInteger bookNo;
@end
