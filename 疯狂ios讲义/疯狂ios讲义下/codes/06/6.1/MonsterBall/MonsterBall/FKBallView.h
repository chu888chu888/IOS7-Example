//
//  FKBallView.h
//  MoveBall
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface FKBallView : UIView
// 定义属性来记录足球的当前位置
@property (nonatomic , assign) CGPoint currentPoint;
@property (nonatomic , assign) CMAcceleration acceleration;
// 定义属性来记录足球滚动的X、Y轴方向的速度
@property (nonatomic , assign) CGFloat xVelocity;
@property (nonatomic , assign) CGFloat yVelocity;
- (void)update;
@end
