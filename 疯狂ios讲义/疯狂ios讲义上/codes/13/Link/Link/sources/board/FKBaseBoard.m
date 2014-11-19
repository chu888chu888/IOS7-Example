//
//  FKBaseBoard.m
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//


#import "FKBaseBoard.h"
#import "FKPiece.h"
#import "Constants.h"
#import "FKImageUtil.h"

@implementation FKBaseBoard
// 定义一个方法, 让子类去实现
- (NSArray*) createPieces:(NSArray*)pieces
{
	return nil;
}
- (NSArray*) create
{
	// 创建FKPiece的二维数组
	NSMutableArray* pieces = [[NSMutableArray alloc] init];
	for(int i = 0 ; i < xSize ; i++)
	{
		NSMutableArray* arr = [[NSMutableArray alloc] init];
		for (int j = 0 ; j < ySize ; j++)
		{
			[arr addObject:[NSObject new]];
		}
		[pieces addObject:arr];
	}
	// 返回非空的FKPiece集合, 该集合由子类实现的方法负责创建
	NSArray* notNullPieces = [self createPieces:pieces]; //①
	// 根据非空FKPiece对象的集合的大小来取图片
	NSArray* playImages = getPlayImages(notNullPieces.count);
	// 所有图片的宽、高都是相同的，随便取出一个方块的宽、高即可。
	int imageWidth = [[playImages objectAtIndex:0] image].size.width;
	int imageHeight = [[playImages objectAtIndex:0] image].size.height;
	// 遍历非空的FKPiece集合
	for (int i = 0; i < notNullPieces.count; i++)
	{
		// 依次获取每个FKPiece对象
		FKPiece* piece = [notNullPieces objectAtIndex:i];
		piece.image = [playImages objectAtIndex:i];
		// 计算每个方块左上角的X、Y坐标
		piece.beginX = piece.indexX * imageWidth
			+ beginImageX;
		piece.beginY = piece.indexY * imageHeight
			+ beginImageY;
		// 将该方块对象放入方块数组的相应位置处
		[[pieces objectAtIndex:piece.indexX]
			setObject:piece atIndex:piece.indexY];
	}
	return pieces;
}
@end
