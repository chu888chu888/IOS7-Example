//
//  SlingShot.h
//  AngryBirds
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SlingShot : CCSprite {
	
	//两个起点
	CGPoint _startPoint1;
	CGPoint _startPoint2;
	//一个终点
	CGPoint _endPoint;
}

@property(nonatomic,assign) CGPoint startPoint1;
@property(nonatomic,assign) CGPoint startPoint2;
@property(nonatomic,assign) CGPoint endPoint;

@end
