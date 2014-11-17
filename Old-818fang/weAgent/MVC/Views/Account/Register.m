//
//  Register.m
//  weChat
//
//  Created by apple on 14-9-22.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "Register.h"

@implementation Register

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
//     self.linearLayoutView.scrollEnabled == NO;
    [self addInput];
//    [self.linearLayoutView setBackgroundColor:[UIColor whiteColor]];
   
    
}


//创建输入框
- (void)addInput
{
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 100)];
    [logoView setImage:[UIImage imageNamed:@"logo"]];
    CSLinearLayoutItem *item = [CSLinearLayoutItem layoutItemForView:logoView];
    item.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    item.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:item];
    
    
    _phoneText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    _phoneText.borderStyle = UITextBorderStyleNone;
    _phoneText.placeholder = @"电话号码";
    [_phoneText beGreen];
    CSLinearLayoutItem *phoneTextitem = [CSLinearLayoutItem layoutItemForView:_phoneText];
    phoneTextitem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    phoneTextitem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:phoneTextitem];
    
    _codeText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)];
    _codeText.borderStyle = UITextBorderStyleNone;
    _codeText.placeholder = @"验证码";
    [_codeText beGreen];
    _codeBtn = [[UIButton alloc] initWithFrame:CGRectMake(190.0, 0.0, 100, 30)];
    [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_codeBtn beBlue];
    _codeBtn.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:16];
    UIView *codeView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    [codeView addSubview:_codeText];
    [codeView addSubview:_codeBtn];
    CSLinearLayoutItem *codeItem = [CSLinearLayoutItem layoutItemForView:codeView];
    codeItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    codeItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:codeItem];
    
   
    
    _passwordText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    _passwordText.borderStyle = UITextBorderStyleRoundedRect;
    _passwordText.placeholder = @"密码";
   [_passwordText beGreen];
    CSLinearLayoutItem *passwordTextItem = [CSLinearLayoutItem layoutItemForView:_passwordText];
    passwordTextItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    passwordTextItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:passwordTextItem];
    
    _passwordAgainText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    _passwordAgainText.borderStyle = UITextBorderStyleRoundedRect;
    _passwordAgainText.placeholder = @"再次输入密码";
    [_passwordAgainText beGreen];
    CSLinearLayoutItem *passwordAgainTextItem = [CSLinearLayoutItem layoutItemForView:_passwordAgainText];
    passwordAgainTextItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    passwordAgainTextItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:passwordAgainTextItem];
    
    
    
    _registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 30)];
    [_registerBtn beOrange];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    CSLinearLayoutItem *registerBtnItem = [CSLinearLayoutItem layoutItemForView:_registerBtn];
    registerBtnItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    registerBtnItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:registerBtnItem];
 

    
  

    
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
