//
//  UIKitPrjAppViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-29.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "UIKitPrjAppViewController.h"

@interface UIKitPrjAppViewController ()

@end

@implementation UIKitPrjAppViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
// 按钮被触碰时调用的方法2
-(void) buttonDidPush2:(id)sender
{
    //附加应用程序标记
    [UIApplication sharedApplication].applicationIconBadgeNumber=2;
    //去掉应用程序标记
    //[UIApplication sharedApplication].applicationIconBadgeNumber=0;
}
// 按钮被触碰时调用的方法2
-(void) buttonDidPush3:(id)sender
{
    //附加应用程序标记
    //[UIApplication sharedApplication].applicationIconBadgeNumber=2;
    //去掉应用程序标记
    //[UIApplication sharedApplication].applicationIconBadgeNumber=0;
    NSURL *url=[NSURL URLWithString:@"http://www.sina.com.cn"];
    UIApplication *application=[UIApplication sharedApplication];
    if ([application canOpenURL:url]) {
        [application openURL:url];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"您要访问的网址不存在!@" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
// 按钮被触碰时调用的方法2
-(void) buttonDidPush4:(id)sender
{
    //附加应用程序标记
    //[UIApplication sharedApplication].applicationIconBadgeNumber=2;
    //去掉应用程序标记
    //[UIApplication sharedApplication].applicationIconBadgeNumber=0;
    NSURL *url=[NSURL URLWithString:@"sms:139-0000-0000"];
    UIApplication *application=[UIApplication sharedApplication];
    if ([application canOpenURL:url]) {
        [application openURL:url];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"您要访问的网址不存在!@" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // 创建按钮
    UIButton * button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    // 设置按钮标题
    [button setTitle:@"设置应用程序标记为2" forState:UIControlStateNormal];
    // 根据标题长度自动决定按钮尺寸
    [button sizeToFit];
    // 将按钮布置在中心位置
    button.center=CGPointMake(self.view.center.x, 100);
    // 画面变化时按钮位置自动调整
    button.autoresizingMask=UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin
    |UIViewAutoresizingFlexibleWidth;
    // 设置按钮被触碰时响应方法
    [button addTarget:self action:@selector(buttonDidPush2:) forControlEvents:UIControlEventTouchUpInside];
    // 将画面添加到画面View中
    [self.view addSubview:button];
    
    UIButton * buttonURL=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    // 设置按钮标题
    [buttonURL setTitle:@"打开浏览器" forState:UIControlStateNormal];
    // 根据标题长度自动决定按钮尺寸
    [buttonURL sizeToFit];
    // 将按钮布置在中心位置
    buttonURL.center=CGPointMake(self.view.center.x, 130);
    // 画面变化时按钮位置自动调整
    buttonURL.autoresizingMask=UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin
    |UIViewAutoresizingFlexibleWidth;
    // 设置按钮被触碰时响应方法
    [buttonURL addTarget:self action:@selector(buttonDidPush3:) forControlEvents:UIControlEventTouchUpInside];
    // 将画面添加到画面View中
    [self.view addSubview:buttonURL];
    
    UIButton * buttonEmail=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    // 设置按钮标题
    [buttonEmail setTitle:@"发送邮件" forState:UIControlStateNormal];
    // 根据标题长度自动决定按钮尺寸
    [buttonEmail sizeToFit];
    // 将按钮布置在中心位置
    buttonEmail.center=CGPointMake(self.view.center.x, 160);
    // 画面变化时按钮位置自动调整
    buttonEmail.autoresizingMask=UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin
    |UIViewAutoresizingFlexibleWidth;
    // 设置按钮被触碰时响应方法
    [buttonEmail addTarget:self action:@selector(buttonDidPush4:) forControlEvents:UIControlEventTouchUpInside];
    // 将画面添加到画面View中
    [self.view addSubview:buttonEmail];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
