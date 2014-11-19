//
//  FKCustomAlertView.h
//  CustomAlertView
//
//  Created by yeeku on 13-6-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FKCustomAlertView : UIAlertView
// 定义保存需要额外增加的UI控件的NSArray属性
@property (nonatomic, strong) NSArray * items;
// 定义为UIAlertView额外增加的高度
@property (nonatomic, assign) int extHeight;
@end