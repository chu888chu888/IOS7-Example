//
//  UIKitPrjUIDatePickerViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-27.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "UIKitPrjUIDatePickerViewController.h"

@interface UIKitPrjUIDatePickerViewController ()

@end

@implementation UIKitPrjUIDatePickerViewController

@synthesize datePicker;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *icon=[UIImage imageNamed:@"free-badge-32.png"];
        self.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"Hello" image:icon tag:0];
    }
    return self;
}

-(void)buttonShowDate
{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM//dd HH:mm"];
    NSString *dateString=[formatter stringFromDate:datePicker.date];
    UIAlertView *alert=[[UIAlertView alloc]init];
    alert.message=dateString;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    
}
-(void)buttonActivtyIndicator
{
    UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame=CGRectMake(0, 0, 50, 50);
    indicator.center=self.view.center;
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CGPoint centerPoint=self.view.center;
    centerPoint.y+=50;
    
    //添加日期选择框
    datePicker=[[UIDatePicker alloc] init];
    datePicker.frame=CGRectMake(0, 100, self.view.bounds.size.width, 200);
    [self.view addSubview:datePicker];
    
    UIButton *btnDatePicker=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnDatePicker setTitle:@"显示时间" forState:UIControlStateNormal];
    [btnDatePicker sizeToFit];
    centerPoint.y+=50;
    btnDatePicker.center=centerPoint;
    btnDatePicker.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [btnDatePicker addTarget:self action:@selector(buttonShowDate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDatePicker];
    
    UIButton *btnActivtyIndicator=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnActivtyIndicator setTitle:@"显示提示对话框" forState:UIControlStateNormal];
    [btnActivtyIndicator sizeToFit];
    centerPoint.y+=60;
    btnActivtyIndicator.center=centerPoint;
    btnActivtyIndicator.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [btnActivtyIndicator addTarget:self action:@selector(buttonActivtyIndicator) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnActivtyIndicator];
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
