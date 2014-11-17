//
//  GlobalUIView.h
//  weChat
//
//  Created by apple on 14-9-18.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSLinearLayoutView.h"
#import "UIColor+base.h"
#import "UIButton+base.h"
#import "UITextField+base.h"
#import "UIFont+base.h"
#import "UIBarButtonItem+base.h"

@interface GlobalUIView : UIView
@property (nonatomic, strong) CSLinearLayoutView *linearLayoutView;
@property (nonatomic, strong) CSLinearLayoutItem *linearLayoutItem;

@end
