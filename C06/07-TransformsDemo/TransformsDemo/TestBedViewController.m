//
//  TestBedViewController.m
//  TransformsDemo
//
//  Created by chuguangming on 14-7-29.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "TestBedViewController.h"
#import <math.h>

#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

@interface TestBedViewController ()

@end

@implementation TestBedViewController
@synthesize imageView,theta,timer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) move: (NSTimer *) aTimer
{
	// Rotate each iteration by 1% of PI
    CGFloat angle = theta * (M_PI / 100.0f);
    CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
    
	// Theta ranges between 0% and 199% of PI, i.e. between 0 and 2*PI
	theta = (theta + 1) % 200;
	
    // For fun, scale by the absolute value of the cosine
    float degree = cos(angle);
    if (degree < 0.0) degree *= -1.0f;
    degree += 0.5f;
	
	// Create add scaling to the rotation transform
    CGAffineTransform scaled = CGAffineTransformScale(transform, degree, degree);
	
    // Apply the affine transform
    if(imageView)
		[imageView setTransform:scaled];
}

- (void) start: (id) sender
{
	timer = [NSTimer scheduledTimerWithTimeInterval:0.03f target:self selector:@selector(move:) userInfo:nil repeats:YES];
	[self move:nil];
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Stop", @selector(stop:));
}

- (void) stop: (id) sender
{
	[timer invalidate];
	timer = nil;
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Start", @selector(start:));
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Start", @selector(start:));
    
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BflyCircle.png"]];
	[self.view addSubview:imageView];
    //让图片居中
    imageView.center =CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
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
