//
//  BaseSprite.h
//  AngryBirds
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

// 定义了一个“像素/米”的比率
#define PTM_RATIO 32
// 小鸟
#define BIRD_TAG 1
// 小猪
#define PIG_TAG 2
// 冰块
#define ICE_TAG 3


@interface BaseSprite : CCSprite
{
	float _HP;  // 生命值
	NSString *_imageName;  // 精灵图片名称
	b2World *_world;
}
@property (nonatomic, assign) float HP;


// 初始化方法，参数是x，y，b2World
-(id) initWithX:(float)x andY:(float)y andWorld:(b2World *)world ;

@end


