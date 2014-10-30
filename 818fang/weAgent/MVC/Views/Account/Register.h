//
//  Register.h
//  weChat
//
//  Created by apple on 14-9-22.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalUIView.h"

@interface Register : GlobalUIView

   @property (strong, nonatomic) UITextField *phoneText;
   @property (strong, nonatomic) UITextField *codeText;
   @property (strong, nonatomic) UITextField *passwordText;
   @property (strong, nonatomic) UITextField *passwordAgainText;
   @property (strong, nonatomic) UIButton *codeBtn;
   @property (strong, nonatomic) UIButton *registerBtn;
 

@end
