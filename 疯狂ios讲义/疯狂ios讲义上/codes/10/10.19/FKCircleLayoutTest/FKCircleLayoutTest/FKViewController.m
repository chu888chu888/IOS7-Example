//
//  FKViewController.m
//  FKCircleLayoutTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKCircleLayout.h"
@interface FKViewController ()

@end

@implementation FKViewController
NSInteger cellCount;
-(void)viewDidLoad
{
	// 设置开始的时候包含16个单元格
	cellCount = 16;
	// 创建自定义的FKCircleLayout布局对象
	FKCircleLayout* circleLayout =[[FKCircleLayout alloc] init];
	// 设置使用自定义布局对象
	self.gridView.collectionViewLayout = circleLayout;
	// 设置背景色
	self.gridView.backgroundColor = [UIColor grayColor];
	// 为UICollectionView设置dataSource和delegate
	self.gridView.dataSource = self;
	self.gridView.delegate = self;
	// 创建一个处理点击的手势处理器
	UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc]
		initWithTarget:self action:@selector(handleTap:)];
	// 为UICollectionView增加一个手势处理器	
	[self.gridView addGestureRecognizer:tapRecognizer];
}
// 该方法的返回值决定该UICollectionView包含多少个单元格
- (NSInteger)collectionView:(UICollectionView *)view
	 numberOfItemsInSection:(NSInteger)section;
{
	return cellCount;
}
// 该方法的返回值决定该UICollectionView指定位置的单元格控件
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
	static NSString* cellId = @"cellId";
	
	// 从可重用表格行的队列中取出一个表格行
	UICollectionViewCell* cell = [collectionView
		dequeueReusableCellWithReuseIdentifier:cellId
		forIndexPath:indexPath];
	return cell;
}
// 定义处理点击手势的方法
- (void)handleTap:(UITapGestureRecognizer *)sender
{	
	if (sender.state == UIGestureRecognizerStateEnded)
	{
		// 获取点击点的位置
		CGPoint initialPinchPoint = [sender locationInView:self.gridView];
		// 获取点击点所在的NSIndexPath（可用于获取被点击的单元格）
		NSIndexPath* tappedCellPath = [self.gridView
			indexPathForItemAtPoint:initialPinchPoint];
		// 如果被点击的单元格存在
		if (tappedCellPath)
		{
			// 减少一个单元格
		   	cellCount --;
			// 删除被点击的单元格
			[self.gridView deleteItemsAtIndexPaths:
				[NSArray arrayWithObject:tappedCellPath]];
		}
		else
		{
			// 增加一个单元格
		   	cellCount ++;
			// 在UICollectionView的开始处添加一个单元格
			[self.gridView insertItemsAtIndexPaths:
			 	[NSArray arrayWithObject:
				[NSIndexPath indexPathForItem:0 inSection:0]]];
		}
	}
}
@end
