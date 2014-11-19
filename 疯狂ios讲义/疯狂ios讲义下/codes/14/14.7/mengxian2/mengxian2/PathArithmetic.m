//
//  PathArithmetic.m
//  mengxian
//
//

#import "PathArithmetic.h"
static PathArithmetic *instance;
static const int mapWidth = 26;
static const int mapHeight = 20;
@implementation PathArithmetic
@synthesize invalidPoints = _invalidPoints;
@synthesize pathPoints = _pathPoints;
// 单例模式
+ (id) sharedPathArithmetic {
	if (instance == nil) {
		instance = [[PathArithmetic alloc] init];
	}
	return instance;
}

/**
 * 搜索方法
 * @param from 开始点
 * @param to 结束点
 * @param gridArray 网格二维数组
 * @return
 */
- (NSArray *) getPath:(CGPoint)from  endPoint:(CGPoint)to
	tileMapGrid:(NSMutableArray*) gridArray {
	// 初始化集合
	_invalidPoints = [[NSMutableArray alloc] init];
	_pathPoints = [[NSMutableArray alloc] init];
	// 调用findValidGrid方法递归完成路径查找
	[self findValidGrid:from endPoint:to tileMapGrid:gridArray];
	// 计算路径完成，返回倒转数组
	return [[_pathPoints reverseObjectEnumerator] allObjects];
}

- (BOOL) findValidGrid:(CGPoint)from endPoint:(CGPoint)to 
	tileMapGrid:(NSMutableArray*) gridArray {
	// （1）记录走过的点
	[_invalidPoints addObject:[NSValue valueWithCGPoint:from]];
	// （2）判断当前点的上、右、左、下、左上、左下、右上、右下八个点是否有效或者是目的点
	NSMutableArray *points = [[NSMutableArray alloc] init];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x, from.y - 1)]];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x, from.y + 1)]];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x-1, from.y)]];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x+1, from.y)]];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x-1, from.y - 1)]];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x+1, from.y + 1)]];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x-1, from.y+1)]];
	[points addObject:[NSValue valueWithCGPoint:CGPointMake(from.x+1, from.y-1)]];
	NSMutableArray *temp = [[NSMutableArray alloc] init];
	for (int i=0; i<[points count]; i++) {
		CGPoint p = [[points objectAtIndex:i] CGPointValue];
		// 是不是到了目地点
		if (CGPointEqualToPoint(p,to)) {
			[_pathPoints addObject:[NSValue valueWithCGPoint:p]];
			return YES;
		}
		// 检查当前点的有效性（前后左右是否可以通过）
		if ([self isCheck:p tileMapGrid:gridArray]) {
			[temp addObject:[NSValue valueWithCGPoint:p]];
		}
	}
	// （3）对有效点进按最短路径排序。
	NSArray *sorteArray = [temp sortedArrayUsingComparator:^(id obj1, id obj2){
		NSValue *value1 = obj1;
		NSValue *value2 = obj2;
		CGPoint p1 = [value1 CGPointValue];
		CGPoint p2 = [value2 CGPointValue];
		double r1 = sqrt((p1.x - to.x) * (p1.x - to.x) + (p1.y - to.y) * (p1.y - to.y));
		double r2 = sqrt((p2.x - to.x) * (p2.x - to.x) + (p2.y - to.y) * (p2.y - to.y));
		if(r1 > r2) {
			return(NSComparisonResult)NSOrderedDescending;
		}
		if(r1 < r2 ) {
			return(NSComparisonResult)NSOrderedAscending;
		}
		return(NSComparisonResult)NSOrderedSame;
	}];
	// （4）把距离最近的有效的存储到pathPoints数组
	// （5）递归找出所有有效点直到搜索到终点。
	for (int i=0; i<[sorteArray count]; i++) {
		CGPoint p = [[sorteArray objectAtIndex:i] CGPointValue];
		BOOL flag = [self findValidGrid:p endPoint:to tileMapGrid:gridArray];
		if (flag) {
			[_pathPoints addObject:[NSValue valueWithCGPoint:p]];
			return YES;
		}
	}
	return NO;
}

/**
 * 查检点的有效性
 * @param point   点
 * @param gridArray   地图二维数组
 * @return BOOL
 */
/**
 * 查检点的有效性
 * @param point 点
 * @param gridArray 地图二维数组
 * @return BOOL
 */
- (BOOL) isCheck:(CGPoint)point tileMapGrid:(NSMutableArray*) gridArray {
	// x和y小于0返回NO
	if (point.x < 0 || point.y < 0) {
		return NO;
	}
	// 无效集合中包含这个点，返回NO
	if ([_invalidPoints containsObject:[NSValue valueWithCGPoint:point]]) {
		return NO;
	}
	// x和y超出地图宽度和高度时返回No
	if (point.x >= mapWidth || point.y >= mapHeight) {
		return NO;
	}
	// 从二维数组中获取当前点所代表的地图网格，判断x.y代表的点是否可以通过
	NSMutableArray *tempX = [gridArray objectAtIndex:point.x];
	Grid *grid = [tempX objectAtIndex:point.y];
	if (point.x >= 0  && point.y >= 0 && grid.isPass) {
		return YES;
	}
	return NO;
}
@end
