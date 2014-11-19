//
//  Bird.h
//  AngryBirds
//
//

#import <Foundation/Foundation.h>
#import "Box2D.h"
#import "BaseSprite.h"

// 小鸟 继承BaseSprite
@interface Bird : BaseSprite
{
	// 小鸟是否准备好
	BOOL _isReady;
	// 小鸟是否在飞
	BOOL _isFly;
}
@property (nonatomic, assign) BOOL isFly;
@property (nonatomic, assign) BOOL isReady;

// 设置物理世界
-(void)setBodyWithX:(float)x andY:(float)y andWorld:(b2World*)world;
-(void)hitAnimationWithX:(float)x andY:(float)y andLayer:(CCLayer*) layer;
@end
