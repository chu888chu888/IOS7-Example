//
//  FKCircleLayout.h
//  FKCircleLayoutTest
//
//  Created by yeeku on 13-6-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKCircleLayout : UICollectionViewLayout
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;
@end
