//
//  FKMyView.h
//  Gradienter
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKMyView : UIView
// 定义气泡所在位置的X、Y坐标
@property (nonatomic, assign) CGFloat bubbleX;
@property (nonatomic, assign) CGFloat bubbleY;
// 定义气泡图片
@property (nonatomic, readonly) UIImage* bubble;
@end
