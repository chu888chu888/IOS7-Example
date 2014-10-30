//
//  RadarHomeViewController.m
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "RadarHomeViewController.h"
#import "SecondHousesTableViewController.h"
#import "RentTableViewController.h"
#import "ForRentTableViewController.h"
#import "UIBarButtonItem+base.h"

@interface RadarHomeViewController (){
    BOOL isPause;
}

@end

@implementation RadarHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}





- (void)loadView{
    self.view = [[Radar alloc] init];
    self.view.imagePager.dataSource = self;
    self.view.imagePager.delegate = self;
    [self.view.searchBtn addTarget:self action:@selector(searchBtnHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.forRentBoard addTarget:self action:@selector(forRentBoardHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.rentBoard addTarget:self action:@selector(rentBoardHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.secondBoard addTarget:self action:@selector(secondBoardHandle) forControlEvents:UIControlEventTouchUpInside];
    isPause = YES;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"雷达"];

//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStyleBordered target:self action:@selector(loginHandle)];
//    [rightButton formatToBase];
//    [self.navigationItem setRightBarButtonItem:rightButton];
    
    // Do any additional setup after loading the view.
}

//暂停layer上面的动画
- (void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//继续layer上面的动画
- (void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

- (void)pauseSearch
{
    isPause = YES;
    [self pauseLayer:self.view.radarPointer.layer];
}

- (void)resumeSearch
{
    isPause = NO;
    [self resumeLayer:self.view.radarPointer.layer];
}

- (void)searchBtnHandle{
        if (isPause) {
        [self resumeSearch];
        NSDictionary *home = [NSDictionary dictionaryWithObjectsAndKeys:@"121.485352",@"longitude",@"31.214243",@"latitude",nil];
        
        NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",home,@"home",@"0",@"moneyRange",@"3",@"beforeDay",@"3000",@"distance",nil];
        
        DSJSONRPCCompletionHandler onCompletionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
            
            self.view.forRentBadgeView.text= [[methodResult objectForKey:@"result"] objectForKey:@"wantedNum"];
            self.view.rentBadgeView.text= [[methodResult objectForKey:@"result"] objectForKey:@"rentNum"];
            self.view.secondBadgeView.text= [[methodResult objectForKey:@"result"] objectForKey:@"secondNum"];
             [self pauseSearch];
        };

        
        [self RPCUseClass:@"Mix" callMethodName:@"getRadarNumbers" withParameters:condition onCompletion:onCompletionHandler];
            
                   
       
    }
}


- (void)forRentBoardHandle{
    ForRentTableViewController *forRentVC = [[ForRentTableViewController alloc] init];
    GlobalNavigationViewController *forRentNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:forRentVC];
    [self presentViewController:forRentNVC animated:YES completion:^{}];
    
   
}

- (void)rentBoardHandle{
    RentTableViewController *rentVC = [[RentTableViewController alloc] init];
    GlobalNavigationViewController *rentNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:rentVC];
    [self presentViewController:rentNVC animated:YES completion:^{}];
    
}

- (void)secondBoardHandle{
//    SecondHousesTableViewController *SecondHousesVC = [[SecondHousesTableViewController alloc] init];
//    [self.navigationController pushViewController:SecondHousesVC animated:YES];
    SecondHousesTableViewController *secondHousesVC = [[SecondHousesTableViewController alloc] init];
    GlobalNavigationViewController *secondHousesNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:secondHousesVC];
    [self presentViewController:secondHousesNVC animated:YES completion:^{}];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.view.imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    self.view.imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.view.imagePager.slideshowTimeInterval = 5.5f;
    self.view.imagePager.slideshowShouldCallScrollToDelegate = YES;
    
    //这里的动画还得学习啊
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 3;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    
    [self.view.radarPointer.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [self pauseSearch];
}

//- (void) viewWillAppear:(BOOL)animated{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterForegroundNotification) name:UIApplicationWillEnterForegroundNotification object:nil];
//}
//
//
//- (void) appWillEnterForegroundNotification{
//    NSLog(@"trigger event when will enter foreground.");
//}

#pragma mark - KIImagePager DataSource
- (NSArray *) arrayWithImages
{
    
    NSMutableArray *photos = [NSMutableArray array];
    [photos addObject:[UIImage imageNamed:@"banner1"]];
    [photos addObject:[UIImage imageNamed:@"banner2"]];
    [photos addObject:[UIImage imageNamed:@"banner3"]];
    return photos;
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}

//- (NSString *) captionForImageAtIndex:(NSUInteger)index
//{
//    return @[
//             @"First screenshot",
//             @"Another screenshot",
//             @"Last one! ;-)"
//             ][index];
//}

#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
//    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
//    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}




@end
