//
//  Login.m
//  weChat
//
//  Created by apple on 14-9-23.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "Login.h"

@implementation Login

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void) initialize
{
//    [self.linearLayoutView setBackgroundColor:[UIColor whiteColor]];
    [self addView];
    [self addLinkView];

}

-(void) addView
{
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 100)];
    [logoView setImage:[UIImage imageNamed:@"logo"]];
    CSLinearLayoutItem *item = [CSLinearLayoutItem layoutItemForView:logoView];
    item.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    item.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:item];
    
    
    _nameText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    _nameText.borderStyle = UITextBorderStyleNone;
    _nameText.placeholder = @"电话号码";
    [_nameText beGreen];
    [_nameText addUserLeftImg];
  
    CSLinearLayoutItem *nameTextItem = [CSLinearLayoutItem layoutItemForView:_nameText];
    nameTextItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    nameTextItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:nameTextItem];
    
    _passwordText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    _passwordText.borderStyle = UITextBorderStyleNone;
    _passwordText.placeholder = @"密码";
    [_passwordText beGreen];
    [_passwordText addLockLeftImg];
    CSLinearLayoutItem *passwordTextItem = [CSLinearLayoutItem layoutItemForView:_passwordText];
    passwordTextItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    passwordTextItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:passwordTextItem];

    
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    [_loginBtn beOrange];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    CSLinearLayoutItem *loginBtnItem = [CSLinearLayoutItem layoutItemForView:_loginBtn];
    loginBtnItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    loginBtnItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:loginBtnItem];
  
}

-(void) addLinkView{
    
    _registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 70, 30)];
    [_registerBtn beBlueLink];
    [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    
    _findBtn = [[UIButton alloc] initWithFrame:CGRectMake(220.0, 0.0, 70, 30)];
    [_findBtn beBlueLink];
    [_findBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    
    UIView *btnItemsView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    [btnItemsView addSubview:_registerBtn];
    [btnItemsView addSubview:_findBtn];
 
    CSLinearLayoutItem *btnItems = [CSLinearLayoutItem layoutItemForView:btnItemsView];
    btnItems.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    btnItems.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:btnItems];
   
    
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
