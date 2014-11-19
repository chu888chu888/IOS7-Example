//
//  FKVerticalBoard.m
//  Link
//
//  Created by yeeku on 13-7-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKVerticalBoard.h"
#import "FKPiece.h"

@implementation FKVerticalBoard
- (NSArray*) createPieces:(NSArray*) pieces
{
	// 创建一个NSMutableArray集合, 该集合里面存放初始化游戏时所需的FKPiece对象
	NSMutableArray* notNullPieces = [[NSMutableArray alloc] init];
	for (int i = 0; i < pieces.count; i++)
	{
		for (int j = 0; j < [[pieces objectAtIndex:i] count]; j++)
		{
			// 加入判断, 符合一定条件才去构造FKPiece对象, 并加到集合中
			// 如果i能被2整除, 即单数列不会创建方块
			if (i % 2 == 0)
			{
				// 先构造一个FKPiece对象, 只设置它在FKPiece二维数组中的索引值，
				// 所需要的FKPieceImage由其父类负责设置。
				FKPiece* piece = [[FKPiece alloc] initWithIndexX:i indexY:j];
				// 添加到FKPiece集合中
				[notNullPieces addObject:piece];
			}
		}
	}
	return notNullPieces;
}
@end
