//
//  SlingShot.m
//  AngryBirds
//
//

#import "SlingShot.h"

@implementation SlingShot

@synthesize startPoint1 = _startPoint1;
@synthesize startPoint2 = _startPoint2;
@synthesize endPoint = _endPoint;

-(void) draw{

	// OpenGL的方法，设置线宽
	glLineWidth(4.0f);
	
	// ccDrawColor4B()函数用于按RGBA方式设置绘制颜色
	ccDrawColor4B(255,0,0,255);
	
	// 画线
	ccDrawLine(ccp(_startPoint1.x, _startPoint1.y), ccp(_endPoint.x, _endPoint.y));
	
	ccDrawLine(ccp(_startPoint2.x, _startPoint2.y), ccp(_endPoint.x, _endPoint.y));
	
}

@end
