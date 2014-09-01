//
//  UIKitPrjTouchesBeganViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-27.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "UIKitPrjTouchesBeganViewController.h"
#import "TouchableLabel.h"
@interface UIKitPrjTouchesBeganViewController ()

@end

@implementation UIKitPrjTouchesBeganViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"UIResponder演示";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 将新创建的标签布局到画面上
    TouchableLabel *label=[[TouchableLabel alloc] init];
    label.frame=CGRectMake(60, 100, 200, 50);
    label.text=@"Touch me@!";
    label.textAlignment=UITextAlignmentCenter;
    //必须将userInteractionEnable属性设置成为YES,默认为NO,用于支持组件响应事件
    label.userInteractionEnabled=YES;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 此方法为接受触摸事件的方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"测试" message:@"测试" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
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
