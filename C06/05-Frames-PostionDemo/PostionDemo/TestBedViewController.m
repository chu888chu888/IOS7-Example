//
//  TestBedViewController.m
//  PostionDemo
//
//  Created by chuguangming on 14-7-28.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "TestBedViewController.h"
#import "UIView-ViewFrameGeometry.h"
#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define IS_IPAD	(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface TestBedViewController ()

@end

@implementation TestBedViewController
@synthesize segmentControl,innerView,outerView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) segmentAciton:(UISegmentedControl *)sc
{
    NSLog(@"您点击的是第%d个按钮",sc.selectedSegmentIndex);
    switch ([sc selectedSegmentIndex])
	{
		case 0:
			innerView.top = 0.0f;
			break;
		case 1:
			innerView.bottom = outerView.height;
			break;
        case 2:
            innerView.center = outerView.midpoint;
            break;
		case 3:
			innerView.left = 0.0f;
			break;
		case 4:
			innerView.right = outerView.width;
			break;
		default:
			break;
	}
}
- (void) recenter
{
    self.innerView.center = outerView.midpoint;
    self.segmentControl.selectedSegmentIndex = 2;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
     CGrect screenBounds = [ [UIScreen mainScreen]bounds];//返回的是带有状态栏的Rect
     CGRect viewBounds = [ [UIScreen mainScreen]applicationFrame];//不包含状态栏的Rect
     */
    // Do any additional setup after loading the view.
    //self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.tintColor=COOKBOOK_PURPLE_COLOR;
    
    //创建移动的按钮
    NSArray *buttonNames=[@"Top Bottom Center Left Right" componentsSeparatedByString:@" "];
    self.segmentControl=[[UISegmentedControl alloc] initWithItems:buttonNames];
    self.segmentControl.selectedSegmentIndex=2;
    [self.segmentControl addTarget:self action:@selector(segmentAciton:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView=self.segmentControl;
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    CGRect appRect = (CGRect) {.size = [[UIScreen mainScreen] applicationFrame].size};
    
    CGFloat insetAmount = IS_IPAD ? 80.0f : 5.0f;
    outerView = [[UIView alloc] initWithFrame:CGRectInset(appRect, insetAmount, insetAmount)];
	outerView.backgroundColor = [UIColor lightGrayColor];
    outerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:outerView];
    
    innerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 80.0f)];

    [self recenter];
    
	innerView.backgroundColor = COOKBOOK_PURPLE_COLOR;
	[outerView addSubview:innerView];
    
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
