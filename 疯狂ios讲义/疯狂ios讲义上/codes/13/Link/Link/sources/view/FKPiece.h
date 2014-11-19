//
//  FKPiece.h
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKPieceImage.h"
#import "FKPoint.h"

@interface FKPiece : NSObject
@property (nonatomic , strong) FKPieceImage* image;
// 该方块的左上角的x坐标
@property (nonatomic , assign) NSInteger beginX;
// 该方块的左上角的y坐标
@property (nonatomic , assign) NSInteger beginY;
// 该对象在FKPiece二维数组中第一维的索引值
@property (nonatomic , assign) NSInteger indexX;
// 该对象在FKPiece二维数组中第二维的索引值
@property (nonatomic , assign) NSInteger indexY;
- (id)initWithIndexX:(NSInteger) indexX indexY:(NSInteger)indexY;
// 获取该FKPiece的中心
- (FKPoint*) getCenter;
// 判断两个FKPiece上的图片是否相同
- (BOOL) isEqual:(FKPiece*) other;
@end
