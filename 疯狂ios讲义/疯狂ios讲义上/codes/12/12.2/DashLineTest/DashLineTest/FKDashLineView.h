//
//  FKDashLineView.h
//  DashLineTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKDashLineView : UIView
{
	CGFloat dashPattern[10];
	size_t dashCount;
}
@property(nonatomic, assign) CGFloat dashPhase;
-(void)setDashPattern:(CGFloat*)pattern count:(size_t)count;
@end
