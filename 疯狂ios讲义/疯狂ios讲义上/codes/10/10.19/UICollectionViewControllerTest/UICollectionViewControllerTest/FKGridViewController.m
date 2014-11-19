//
//  FKGridViewController.m
//  UICollectionViewControllerTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKGridViewController.h"
#import "FKCellView.h"
#import "FKFlowLayout.h"

@implementation FKGridViewController

-(void)viewDidLoad
{
	// 为该控件的UICollectionView注册单元格控件
	[self.collectionView registerClass:[FKCellView class]
		forCellWithReuseIdentifier:@"cellId"];
	// 创建自定义FKFlowLayout布局管理器对象
	FKFlowLayout* flowLayout = [[FKFlowLayout alloc] init];
	// 指定使用FKFlowLayout布局管理器
	self.collectionView.collectionViewLayout = flowLayout;
}
// 该方法直接返回20，表明该控件包含20个单元格
- (NSInteger)collectionView:(UICollectionView *)view
	 numberOfItemsInSection:(NSInteger)section;
{
	return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
	cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
	// 从可重用单元格队列中
	FKCellView *cell = [collectionView
		dequeueReusableCellWithReuseIdentifier:@"cellId"
		forIndexPath:indexPath];
	cell.label.text = [NSString stringWithFormat:@"%d",indexPath.item];
	return cell;
}
@end
