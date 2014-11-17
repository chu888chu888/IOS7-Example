//
//  GraphViewController.m
//  weChat
//
//  Created by apple on 14-8-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "AchievementHomeViewController.h"
#import "LoadingView.h"

@interface AchievementHomeViewController (){
    int totalNumber;
    LoadingView *loadingView;
}

@end

@implementation AchievementHomeViewController


-(void)loadView{
    self.view = [[Achievement alloc] init];
    self.view.achievementGraph.delegate = self;
    self.view.achievementGraph.dataSource = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"业绩"];

    self.ArrayOfValues = [[NSMutableArray alloc] init];
    self.ArrayOfDates = [[NSMutableArray alloc] init];
    

    totalNumber = 0;
    
    for (int i = 0; i < 9; i++) {
        [self.ArrayOfValues addObject:@([self getRandomInteger])]; // Random values for the graph
        [self.ArrayOfDates addObject:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:2000 + i]]]; // Dates for the X-Axis of the graph
        
        totalNumber = totalNumber + [[self.ArrayOfValues objectAtIndex:i] intValue]; // All of the values added together
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    loadingView = [[LoadingView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:loadingView];
    [self initialize];

}

-(void) initialize{
    int days = 7;
    
     NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",[NSString stringWithFormat:@"%d",days],@"days",nil];
    
    DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        [self.ArrayOfValues removeAllObjects];
        [self.ArrayOfDates removeAllObjects];
        for (int i = days-1; i >= 0; i--) {
            [self.ArrayOfValues addObject:[NSNumber numberWithInteger:[[[[[methodResult objectForKey:@"result"] objectForKey:@"dayCallNum"] objectAtIndex:i] objectForKey:@"number"] integerValue]]];
            
            [self.ArrayOfDates addObject:[NSString stringWithFormat:@"%@",[[[[methodResult objectForKey:@"result"] objectForKey:@"dayCallNum"] objectAtIndex:i] objectForKey:@"day"]]];
        }
        
        self.view.dayRateData.text =[[methodResult objectForKey:@"result"] objectForKey:@"dayRate"];
        self.view.monthRateData.text =[[methodResult objectForKey:@"result"] objectForKey:@"monthRate"];
        self.view.thisWeekNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"weekTotal"];
        self.view.todayNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"dayTotal"];
        self.view.totalNum.text =[[methodResult objectForKey:@"result"] objectForKey:@"callTotal"];
        
        [loadingView removeFromSuperview];
        
        [self.view.achievementGraph reloadGraph];
        
    };
    
    [self RPCUseClass:@"Call" callMethodName:@"getAchievements" withParameters:condition onCompletion:completionHandler];
    
    
}



- (NSInteger)getRandomInteger
{
    NSInteger i1 = (int)(arc4random() % 10000);
    return i1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)refresh
{
//    [self.ArrayOfValues removeAllObjects];
//    [self.ArrayOfDates removeAllObjects];
//    
//    for (int i = 0; i < 7; i++) {
//        [self.ArrayOfValues addObject:[NSNumber numberWithInteger:(arc4random() % 70000)]]; // Random values for the graph
//        [self.ArrayOfDates addObject:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:2000 + i]]]; // Dates for the X-Axis of the graph
//        
//        totalNumber = totalNumber + [[self.ArrayOfValues objectAtIndex:i] intValue]; // All of the values added together
//    }
//    
//    UIColor *color;
//    color = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
//    
//    //    if (self.graphColorChoice.selectedSegmentIndex == 0) color = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
//    //    else if (self.graphColorChoice.selectedSegmentIndex == 1) color = [UIColor colorWithRed:255.0/255.0 green:187.0/255.0 blue:31.0/255.0 alpha:1.0];
//    //    else if (self.graphColorChoice.selectedSegmentIndex == 2) color = [UIColor colorWithRed:0.0 green:140.0/255.0 blue:255.0/255.0 alpha:1.0];
//    
//    self.view.achievementGraph.colorTop = [UIColor redColor];
//    self.view.achievementGraph.colorBottom = [UIColor blackColor];
//    self.view.achievementGraph.backgroundColor = [UIColor yellowColor];
//    self.view.tintColor = color;
//    self.labelValues.textColor = [UIColor whiteColor];
//    
//    [self.view.achievementGraph reloadGraph];
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

#pragma mark - SimpleLineGraph Data Source




- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    return (int)[self.ArrayOfValues count];
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    return [[self.ArrayOfValues objectAtIndex:index] floatValue];
}

#pragma mark - SimpleLineGraph Delegate
- (NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(BEMSimpleLineGraphView *)graph {
    return 1;
}

- (NSString *)lineGraph:(BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index {
    NSString *label = [self.ArrayOfDates objectAtIndex:index];
    NSMutableString *mstr = [[NSMutableString alloc] init];
    mstr = [NSMutableString stringWithString:label];
    NSString *search = @"-";
    NSString *replace = @"\n";
    NSRange substr;
    substr = [mstr rangeOfString:search];
    if (substr.location != NSNotFound) {
        [mstr replaceCharactersInRange:substr withString:replace];
    }
    return mstr;
}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didTouchGraphWithClosestIndex:(NSInteger)index {
//    self.labelValues.text = [NSString stringWithFormat:@"%@", [self.ArrayOfValues objectAtIndex:index]];
//    self.labelDates.text = [NSString stringWithFormat:@"in %@", [self.ArrayOfDates objectAtIndex:index]];
}
- (void)lineGraph:(BEMSimpleLineGraphView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index {
//    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.labelValues.alpha = 0.0;
//        self.labelDates.alpha = 0.0;
//    } completion:^(BOOL finished) {
//        self.labelValues.text = [NSString stringWithFormat:@"%i", [[self.view.achievementGraph calculatePointValueSum] intValue]];
//        self.labelDates.text = [NSString stringWithFormat:@"between 2000 and %@", [self.ArrayOfDates lastObject]];
//        
//        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            self.labelValues.alpha = 1.0;
//            self.labelDates.alpha = 1.0;
//        } completion:nil];
//    }];
}

- (void)lineGraphDidFinishLoading:(BEMSimpleLineGraphView *)graph {
//    self.labelValues.text = [NSString stringWithFormat:@"%i", [[self.view.achievementGraph calculatePointValueSum] intValue]];
//    self.labelDates.text = [NSString stringWithFormat:@"between 2000 and %@", [self.ArrayOfDates lastObject]];
}



@end
