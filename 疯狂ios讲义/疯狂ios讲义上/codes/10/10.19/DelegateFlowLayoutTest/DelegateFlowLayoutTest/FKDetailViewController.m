//
//  FKDetailViewController.m
//  UICollectionViewTest
//
//  Created by yeeku on 13-6-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDetailViewController.h"

@implementation FKDetailViewController
NSArray* bookDetails;
- (void)viewDidLoad
{
	[super viewDidLoad];
	bookDetails = [NSArray arrayWithObjects:
	   @"长期雄踞各网店Ajax销量排行榜榜首的图书，全面深入介绍了前端开发知识",
	   @"长期雄踞各网店Andrioid销量排行榜榜首的图书。",
	   @"重点介绍HTML 5、CSS3、JavaScript等前端开发基础知识" ,
	   @"Java图书，值得仔细阅读的图书",
	   @"帮助Java程序员查漏补缺的、突破重点的图书",
	   @"Java领域3大框架整合开发的图书",
	   @"以EJB 3为核心的Java EE开发图书",
	   @"详细介绍有关XML方方面面的图书" ,nil];
}
- (void)viewWillAppear:(BOOL)animated
{
	// 设置bookCover控件显示的图片
	self.bookCover.image = [UIImage imageNamed:self.imageName];
	// 设置bookDetail显示的内容
	self.bookDetail.text = [bookDetails objectAtIndex:self.bookNo];
}
@end
