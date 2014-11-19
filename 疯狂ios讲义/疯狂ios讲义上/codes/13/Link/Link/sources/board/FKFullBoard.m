//
//  FKFullBoard.m
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKFullBoard.h"
#import "FKPiece.h"

@implementation FKFullBoard
- (NSArray*) createPieces: (NSArray*) pieces
{
	// 创建一个NSMutableArray, 该集合里面存放初始化游戏时所需的FKPiece对象
	NSMutableArray* notNullPieces = [[NSMutableArray alloc] init];
	// i从1开始、小于pieces.count - 1，用于控制最上、最下一行不放方块
	for (int i = 1; i < pieces.count - 1; i++)
	{
		// i从1开始、小于pieces.count - 1，用于控制最左、最右一列不放方块
		for (int j = 1; j < [[pieces objectAtIndex:i] count] - 1; j++)
		{
			// 先构造一个FKPiece对象, 只设置它在FKPiece二维数组中的索引值，
			// 所需要的FKPieceImage由其父类负责设置。
			FKPiece* piece = [[FKPiece alloc] initWithIndexX:i indexY:j];
			// 添加到FKPiece集合中
			[notNullPieces addObject:piece];
		}
	}
	return notNullPieces;
}
@end
