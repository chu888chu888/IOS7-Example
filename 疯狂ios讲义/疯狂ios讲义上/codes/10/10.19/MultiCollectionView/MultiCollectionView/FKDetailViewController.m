//
//  FKDetailViewController.m
//  UICollectionViewTest
//
//  Created by yeeku on 13-6-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDetailViewController.h"

@implementation FKDetailViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
	self.bookCover.image = [UIImage imageNamed:self.imageName];
	self.bookDetail.text = self.bookName;
}
@end
