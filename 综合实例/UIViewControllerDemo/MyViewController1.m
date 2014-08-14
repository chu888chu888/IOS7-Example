//
//  MyViewController1.m
//  UIViewControllerDemo
//
//  Created by chuguangming on 14-8-4.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "MyViewController1.h"

@interface MyViewController1 ()

@end

@implementation MyViewController1
@synthesize lblSlider,slider;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *icon=[UIImage imageNamed:@"free-badge-32.png"];
        self.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"Hello" image:icon tag:0];
        
    }
    return self;
}
-(void)buttonDidPush
{
    [self.view.window sendSubviewToBack:self.view];
}
-(void)segmentDidChange:(id)sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment=sender;
        if(segment.selectedSegmentIndex==0)
        {
            self.view.backgroundColor=[UIColor blackColor];
        }
        else
        {
            self.view.backgroundColor=[UIColor whiteColor];
        }
    }
}
-(void)sliderDidChange:(id)sender
{
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider=sender;
        lblSlider.font=[UIFont boldSystemFontOfSize:(96*slider.value)];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UILabel *label=[[UILabel alloc] initWithFrame:self.view.bounds];
    label.text=@"MyViewController1";
    label.textAlignment=UITextAlignmentCenter;
    label.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"画面跳转" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint centerPoint=self.view.center;
    centerPoint.y+=50;
    button.center=centerPoint;
    button.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSArray *items=[NSArray arrayWithObjects:@"Black",@"White", nil];
    UISegmentedControl *segment=[[UISegmentedControl alloc] initWithItems:items ];
    segment.selectedSegmentIndex=1;
    segment.frame=CGRectMake(0, 0, 130, 30);
    [segment addTarget:self action:@selector(segmentDidChange:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *barButton=[[UIBarButtonItem alloc]initWithCustomView:segment];
    self.navigationItem.rightBarButtonItem=barButton;
    
    
    //滑块变动显示
    lblSlider=[[UILabel alloc]init];
    lblSlider.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2);
    lblSlider.textAlignment=UITextAlignmentCenter;
    lblSlider.text=@"拖动我,改变字体大小";
    [self.view addSubview:lblSlider];
    
    slider=[[UISlider alloc] init ];
    slider.frame=CGRectMake(0, 0, self.view.bounds.size.width, 200);
    slider.minimumValue=0.0;
    slider.maximumValue=1.0;
    slider.value=0.5;
    [slider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
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
