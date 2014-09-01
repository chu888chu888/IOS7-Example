//
//  UIKitPrjResponderChainViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-28.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "UIKitPrjResponderChainViewController.h"
#import "TouchableLabelForResponder.h"
@interface UIKitPrjResponderChainViewController ()

@end

@implementation UIKitPrjResponderChainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //首先将3个标签中最里面父标签追加到画面View中
    TouchableLabelForResponder *grandFather=[[TouchableLabelForResponder alloc]init];
    grandFather.frame=CGRectInset(self.view.bounds, 40, 20);
    grandFather.text=@"A";
    grandFather.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:grandFather];
    //将第2个标签追回到上述标签上
    TouchableLabelForResponder *father=[[TouchableLabelForResponder alloc] init];
    father.frame=CGRectInset(grandFather.bounds, 40, 20);
    father.text=@"B";
    father.backgroundColor=[UIColor grayColor];
    [grandFather addSubview:father];
    //将第3个标签追加到上述第2个标签上
    //完成3层标签创建
    TouchableLabelForResponder *me=[[TouchableLabelForResponder alloc]init];
    me.frame=CGRectInset(father.bounds, 40, 20);
    me.text=@"C";
    me.backgroundColor=[UIColor whiteColor];
    [father addSubview:me];
    
    
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
