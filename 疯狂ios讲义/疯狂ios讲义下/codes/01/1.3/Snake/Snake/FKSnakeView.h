//
//  FKSnakeView.h
//  Snake
//
//  Created by yeeku on 13-7-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
// 记录地图上的宽和高有多少个格子
#define WIDTH 15
#define HEIGHT 22
// 定义每个格子的大小
#define CELL_SIZE 20
typedef enum {
	kDown = 0,
	kLeft,
	kRight,
	kUp
} Orient;
@interface FKSnakeView : UIView <UIAlertViewDelegate>
// 定义蛇的移动方向
@property (nonatomic , assign) Orient orient;
@end