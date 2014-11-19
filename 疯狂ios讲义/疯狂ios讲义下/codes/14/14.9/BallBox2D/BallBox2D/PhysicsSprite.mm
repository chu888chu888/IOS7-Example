//
//  PhysicsSprite.mm
//  BallBox2D
//
//  Created by Jason on 13-10-11.
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
// 重写精灵的矩阵变换方法nodeToParentTransform，模板提供的这个实现，能改变精灵的位置和角度。
// update重新绘制Sprite时，会调用nodeToParentTransform方法根据刚体的位置，适当修改精灵的位置
-(CGAffineTransform) nodeToParentTransform
{
	b2Vec2 pos  = body_->GetPosition();
	
	float x = pos.x * PTM_RATIO;
	float y = pos.y * PTM_RATIO;
	
	if ( self.ignoreAnchorPointForPosition ) {
		x += self.anchorPointInPoints.x;
		y += self.anchorPointInPoints.y;
	}
	
	// Make matrix
	float radians = body_->GetAngle();
	float c = cosf(radians);
	float s = sinf(radians);
	
	if( ! CGPointEqualToPoint(self.anchorPointInPoints, CGPointZero) ){
		x += c*-self.anchorPointInPoints.x + -s*-self.anchorPointInPoints.y;
		y += s*-self.anchorPointInPoints.x + c*-self.anchorPointInPoints.y;
	}
	
	// Rot, Translate Matrix
	_transform = CGAffineTransformMake( c,  s,
									   -s,	c,
									   x,	y );	
	
	return _transform;
}


@end
