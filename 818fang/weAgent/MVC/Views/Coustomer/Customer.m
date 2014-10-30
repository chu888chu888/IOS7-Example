//
//  Customer.m
//  weChat
//
//  Created by apple on 14-9-24.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (void) initialize
{
    [self addView];
}
-(void) addView{
    
    
    _forRentCustomer  = [UIButton buttonWithType:UIButtonTypeSystem];
    _forRentCustomer.frame = CGRectMake(0.0, 0.0, 80, 80);
    [_forRentCustomer setBackgroundImage:[UIImage imageNamed:@"rent.png"] forState:UIControlStateNormal];
    CSLinearLayoutItem *forRentCustomerItem = [CSLinearLayoutItem layoutItemForView:_forRentCustomer];
    forRentCustomerItem.padding = CSLinearLayoutMakePadding(30.0, 0.0, 0.0, 0.0);
    forRentCustomerItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:forRentCustomerItem];
    
    _rentCustomer  = [UIButton buttonWithType:UIButtonTypeSystem];
    _rentCustomer.frame = CGRectMake(0.0, 0.0, 80, 80);
    [_rentCustomer setBackgroundImage:[UIImage imageNamed:@"house_sourse.png"] forState:UIControlStateNormal];
    CSLinearLayoutItem *rentCustomerItem = [CSLinearLayoutItem layoutItemForView:_rentCustomer];
    rentCustomerItem.padding = CSLinearLayoutMakePadding(20.0, 0.0, 0.0, 0.0);
    rentCustomerItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:rentCustomerItem];
    
    _secondCustomer  = [UIButton buttonWithType:UIButtonTypeSystem];
    _secondCustomer.frame = CGRectMake(0.0, 0.0, 80, 80);
    [_secondCustomer setBackgroundImage:[UIImage imageNamed:@"second_house"] forState:UIControlStateNormal];
    CSLinearLayoutItem *secondCustomerItem = [CSLinearLayoutItem layoutItemForView:_secondCustomer];
    secondCustomerItem.padding = CSLinearLayoutMakePadding(20.0, 0.0, 0.0, 0.0);
    secondCustomerItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:secondCustomerItem];
    
    _callRecord  = [UIButton buttonWithType:UIButtonTypeSystem];
    _callRecord.frame = CGRectMake(0.0, 0.0, 80, 80);
    [_callRecord setBackgroundImage:[UIImage imageNamed:@"phone_today.png"] forState:UIControlStateNormal];
    CSLinearLayoutItem *historyContactItem = [CSLinearLayoutItem layoutItemForView:_callRecord];
    historyContactItem.padding = CSLinearLayoutMakePadding(20.0, 0.0, 0.0, 0.0);
    historyContactItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:historyContactItem];

    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
