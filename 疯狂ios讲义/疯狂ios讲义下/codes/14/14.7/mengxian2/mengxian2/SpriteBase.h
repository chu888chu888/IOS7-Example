//
//  SpriteBase.h
//  mengxian
//
//  Created by Jason on 13-10-23.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SpriteBase : CCSprite {
	int _lifeValue; // 精灵的生命值
	CCProgressTimer* _HP; // 精灵的血条
	float _HPInterval; // 血条的更新量
	BOOL _isMove; // 是否移动
	int _moveCount; // 移动的次数
}
@property int lifeValue;
@property CCProgressTimer* HP;
@property float HPInterval;
@property BOOL isMove;
@property int moveCount;
@end
