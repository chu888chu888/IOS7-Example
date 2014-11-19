//
//  FKCitysViewController.h
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
// 定义CityViewControllerDelegate委托协议
@protocol FKCitiesViewControllerDelegate <NSObject>
- (void) addCityToRootView:(NSString *) cityValue;
@end

@interface FKCitiesViewController : UITableViewController
@property (strong,nonatomic) NSArray  *citys;
// 属性，用于为该视图控制器指定delegate对象
@property (nonatomic,strong) id<FKCitiesViewControllerDelegate> delegate;
@end
