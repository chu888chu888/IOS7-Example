//
//  PathArithmetic.h
//  mengxian
//
//
#import <GameKit/GameKit.h>
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Grid.h"
#import <math.h>

@interface PathArithmetic : NSObject
{
	// 记录扫描已经经过的点
	NSMutableArray *_invalidPoints;
	// 记录有效路径的点
	NSMutableArray *_pathPoints;
}
@property NSMutableArray *invalidPoints;
@property NSMutableArray *pathPoints;
// 获得单例对象方法
+ (id) sharedPathArithmetic;
// 寻路算法
- (NSArray *) getPath:(CGPoint)from  endPoint:(CGPoint)to
	tileMapGrid:(NSMutableArray*) gridArray;
@end
