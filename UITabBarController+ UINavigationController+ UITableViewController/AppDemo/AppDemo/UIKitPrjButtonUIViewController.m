//
//  UIKitPrjButtonUIViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-27.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "UIKitPrjButtonUIViewController.h"

@interface UIKitPrjButtonUIViewController ()

@end

@implementation UIKitPrjButtonUIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"UIButton";
    }
    return self;
}
// 按钮被触碰时调用的方法
-(void) buttonDidPush
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Hello" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}
// 按钮被触碰时调用的方法2
-(void) buttonDidPush2:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button=sender;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:button.currentTitle delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }

}
- (void)initButton
{
    // Do any additional setup after loading the view.
    // 创建按钮
    UIButton * button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    // 设置按钮标题
    [button setTitle:@"点击我!" forState:UIControlStateNormal];
    // 根据标题长度自动决定按钮尺寸
    [button sizeToFit];
    // 将按钮布置在中心位置
    button.center=self.view.center;
    // 画面变化时按钮位置自动调整
    button.autoresizingMask=UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin
    |UIViewAutoresizingFlexibleWidth;
    // 设置按钮被触碰时响应方法
    [button addTarget:self action:@selector(buttonDidPush2:) forControlEvents:UIControlEventTouchUpInside];
    // 将画面添加到画面View中
    [self.view addSubview:button];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initButton];
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
