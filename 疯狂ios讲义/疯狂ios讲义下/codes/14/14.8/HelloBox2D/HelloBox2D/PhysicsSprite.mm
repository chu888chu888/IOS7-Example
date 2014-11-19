//
//  PhysicsSprite.mm
//  HelloBox2D
//
//  Created by Jason on 13-10-10.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import "PhysicsSprite.h"

// Needed PTM_RATIO
#import "HelloWorldLayer.h"

#pragma mark - PhysicsSprite
@implementation PhysicsSprite

-(void) setPhysicsBody:(b2Body *)body
{
	body_ = body;
}

// this method will only get called if the sprite is batched.
// return YES if the physics values (angles, position ) changed
// If you return NO, then nodeToParentTransform won't be called.
-(BOOL) dirty
{
	return YES;
}

// returns the transform matrix according the Chipmunk Body values
-(CGAffineTransform) nodeToParentTransform
{
	// 获得刚体的位置
	b2Vec2 pos  = body_->GetPosition();
	// 转换成cocos2d的坐标
	float x = pos.x * PTM_RATIO;
	float y = pos.y * PTM_RATIO;

	// ignoreAnchorPointForPosition_判断是否忽略锚点位置
	// 如果为真，则节点锚点坐标为(0,0)
	if (self.ignoreAnchorPointForPosition ) {
		x += self.anchorPointInPoints.x;
		y += self.anchorPointInPoints.y;
	}
	
	// 设置矩阵
	float radians = body_->GetAngle();
	float c = cosf(radians);
	float s = sinf(radians);
	
	// 检测触碰位置
	if( ! CGPointEqualToPoint(self.anchorPointInPoints, CGPointZero) ){
		x += c*-self.anchorPointInPoints.x + -s*-self.anchorPointInPoints.y;
		y += s*-self.anchorPointInPoints.x + c*-self.anchorPointInPoints.y;
	}

	// 转换矩阵
	_transform = CGAffineTransformMake( c, s, -s, c, x, y );
	
	return _transform;
}



@end
