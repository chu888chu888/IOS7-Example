//
//  Obstacle.h
//  mengxian
//
//

#import <Foundation/Foundation.h>

// 地图中的网格
@interface Grid: NSObject
{
	int _x;  // 在地图二维数组中的x坐标
	int _y;  // 在地图二维数组中的y坐标
	BOOL _isPass;  // 是否可以通过变量
}
@property int x;
@property int y;
@property BOOL isPass;
@end
