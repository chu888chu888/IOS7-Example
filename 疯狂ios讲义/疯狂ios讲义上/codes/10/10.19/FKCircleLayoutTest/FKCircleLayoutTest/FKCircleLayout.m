//
//  FKCircleLayout.m
//  FKCircleLayoutTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKCircleLayout.h"


#define ITEM_SIZE 72
@implementation FKCircleLayout
// 开始执行的方法
-(void)prepareLayout
{
	[super prepareLayout];
	
	CGSize size = self.collectionView.frame.size;
	// 计算需要包含多少个单元格
	_cellCount = [[self collectionView] numberOfItemsInSection:0];
	// 计算环的圆心
	_center = CGPointMake(size.width / 2.0, size.height / 2.0);
	// 计算环的半径（以宽、高中较小值的2.5分之一作为半径）
	_radius = MIN(size.width, size.height) / 2.5;
}
// 该方法的返回值决定UICollectionView所包含控件的大小
-(CGSize)collectionViewContentSize
{
	return [self collectionView].frame.size;
}
// 该方法返回的UICollectionViewLayoutAttributes控制指定单元格的大小和位置
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:
	(NSIndexPath *)path
{
	// 创建一个UICollectionViewLayoutAttributes对象
	UICollectionViewLayoutAttributes* attributes =
		[UICollectionViewLayoutAttributes
		layoutAttributesForCellWithIndexPath:path];
	// 设置各单元格的大小
	attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
	// 设置该单元格的中心点坐标，
	// 由于程序需要控制各单元格绕城一个圆圈，因此此处使用了三角函数进行计算。
	attributes.center = CGPointMake(_center.x + _radius
		* cosf(2 * M_PI * path.item / _cellCount),
		_center.y + _radius * sinf(2 * M_PI * path.item / _cellCount));
	return attributes;
}
// 该方法的返回值控制UICollectionViewLayoutAttributes集合依次控制
// 指定CGRect范围内各单元格的大小和位置
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
	NSMutableArray* attributes = [NSMutableArray array];
	// 将控制每个单元格大小和位置的UICollectionViewLayoutAttributes
	// 添加到NSArray中
	for (NSInteger i=0 ; i < _cellCount; i++) {
		NSIndexPath* indexPath = [NSIndexPath
			indexPathForItem:i inSection:0];
		[attributes addObject:
			[self layoutAttributesForItemAtIndexPath:indexPath]];
	}
	return attributes;
}
// 每当单元格动态显示时自动调用该方法
- (UICollectionViewLayoutAttributes *)
	initialLayoutAttributesForAppearingItemAtIndexPath:
	(NSIndexPath *)itemIndexPath
{
	UICollectionViewLayoutAttributes* attributes = [self
		layoutAttributesForItemAtIndexPath:itemIndexPath];
	attributes.alpha = 0.0;
	attributes.center = CGPointMake(_center.x, _center.y);
	return attributes;
}
// 每当单元格动态消失时自动调用该方法
- (UICollectionViewLayoutAttributes *)
	finalLayoutAttributesForDisappearingItemAtIndexPath:
	(NSIndexPath *)itemIndexPath
{
	UICollectionViewLayoutAttributes* attributes = [self
		layoutAttributesForItemAtIndexPath:itemIndexPath];
	attributes.alpha = 0.0;
	attributes.center = CGPointMake(_center.x, _center.y);
	attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
	return attributes;
}
@end
