//
//  ModelDialog.m
//  UIViewControllerDemo
//
//  Created by chuguangming on 14-8-6.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "ModelDialog.h"

@interface ModelDialog ()

@end

@implementation ModelDialog

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}
-(void)goodbyeDidPush
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc] initWithFrame:self.view.bounds];
    label.backgroundColor=[UIColor blackColor];
    label.textColor=[UIColor whiteColor];
    label.textAlignment=UITextAlignmentCenter;
    label.text=@"您好,我是模式画面";
    [self.view addSubview:label];
    
    //追加关闭按钮
    UIButton *goodbyeButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [goodbyeButton setTitle:@"good bye" forState:UIControlStateNormal];
    [goodbyeButton sizeToFit];
    
    CGPoint newPoint=self.view.center;
    newPoint.y+=80;
    goodbyeButton.center=newPoint;
    [goodbyeButton addTarget:self action:@selector(goodbyeDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goodbyeButton];
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
