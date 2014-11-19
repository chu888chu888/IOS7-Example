//
//  HelloWorldLayer.h
//  BallBox2D
//
//  Created by Jason on 13-10-11.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"

//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.
// 定义了一个“像素/米”的比率
#define PTM_RATIO 32

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer 
{
	b2World *_world;
	CCArray *_imageArray;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
