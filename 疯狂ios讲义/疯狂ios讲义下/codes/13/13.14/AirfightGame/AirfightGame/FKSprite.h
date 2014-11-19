//
//  FKSprite.h
//  Airfight
//
//  Created by Jason on 13-9-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

// 继承自CCSprite
@interface FKSprite : CCSprite {
    
}
// 精灵的生命值
@property int lifeValue;
// 精灵的名称
@property NSString* name;
// 敌机的血条
@property CCProgressTimer* enemyPlaneHP;
// 血条的更新量
@property float HPInterval;
@end
