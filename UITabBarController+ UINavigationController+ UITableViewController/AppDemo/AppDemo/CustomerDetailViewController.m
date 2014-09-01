//
//  CustomerDetailViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-9-1.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "CustomerDetailViewController.h"

@interface CustomerDetailViewController ()

@end

@implementation CustomerDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"单元格显示细节";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *lblName=[[UILabel alloc] initWithFrame:CGRectMake(0, 64, 100, 50)];
    //lblName.backgroundColor=[UIColor redColor];
    lblName.text=self.strName;
    [self.view addSubview:lblName];
    
    UILabel *lblAge=[[UILabel alloc] initWithFrame:CGRectMake(0, 120, 100, 50)];
    lblAge.text=self.strAge;
    [self.view addSubview:lblAge];
    
    UILabel *lblDesc=[[UILabel alloc] initWithFrame:CGRectMake(0, 170, 100, 50)];
    lblDesc.text=self.strDesc;
    [self.view addSubview:lblDesc];
    
    
    //读入图片文件
    UIImage *image=[UIImage imageNamed:self.strHeadImage];
    //UIImageView的创建
    UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
    imageView.frame=CGRectMake(0, 0, 100, 100);
    //设置中心位置以及自动调节参数
    imageView.center=self.view.center;
    imageView.autoresizingMask=UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    //将图片View追加到self.view中
    [self.view addSubview:imageView];

    
    
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
