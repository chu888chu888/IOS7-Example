//
//  myAccountViewController.m
//  weChat
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "MyAccountViewController.h"
#import "CSLinearLayoutView.h"

@interface MyAccountViewController ()

@end

@implementation MyAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (CSLinearLayoutItem *)newItem {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 400.0)];
    
    UIImageView *bgimgview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 400.0)];
    CGFloat top = 5; // 顶端盖高度
    CGFloat bottom = 5 ; // 底端盖高度
    CGFloat left = 2; // 左端盖宽度
    CGFloat right = 2; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    [bgimgview setImage:[[UIImage imageNamed:@"bg_hotTopicList_cell"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
    [view addSubview:bgimgview];
     [view sendSubviewToBack:bgimgview];
    
    
//    
//    UIImageView *celview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 200.0)];
//    [celview setImage:[[UIImage imageNamed:@"bg_hotTopicList_cell"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
//     [view addSubview:celview];

//    UIImageView *cellview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 100.0)];
//    [cellview setImage:[[UIImage imageNamed:@"bg_hotTopic_detail"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
//    [view addSubview:cellview];
    
    UIImageView *cllview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 310.0, 300.0, 0.5)];
    [cllview setImage:[UIImage imageNamed:@"bg_homepage_line"]];
    [view addSubview:cllview];
    
    
    CGFloat top2 = 0; // 顶端盖高度
    CGFloat bottom2 = 0 ; // 底端盖高度
    CGFloat left2 = 5; // 左端盖宽度
    CGFloat right2 = 5; // 右端盖宽度
    UIEdgeInsets insets2 = UIEdgeInsetsMake(top2, left2, bottom2, right2);
    
    UIImageView *llview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 395.0, 300.0, 5.0)];
    [llview setImage:[[UIImage imageNamed:@"bg_homepage_hottopic_shadow"] resizableImageWithCapInsets:insets2 resizingMode:UIImageResizingModeStretch]];
    [view addSubview:llview];

    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleRemoveView:)];
    [view addGestureRecognizer:tap];
    
    CSLinearLayoutItem *item = [CSLinearLayoutItem layoutItemForView:view];
    item.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    item.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    
    return item;
}

//-(void)loadView{
//    NSMutableString *UIView = [NSMutableString stringWithFormat:@"%@",self.class];
//    [UIView replaceCharactersInRange:[UIView rangeOfString:@"ViewController"] withString:@"UIView"];
//    NSLog(@"%@",UIView);
//    self.view = [[NSClassFromString(UIView) alloc] init];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的账号"];
    [self addBackButton];
    
    self.linearLayoutView = [[CSLinearLayoutView alloc] initWithFrame:self.view.bounds];

    
    _linearLayoutView.orientation = CSLinearLayoutViewOrientationVertical;
    _linearLayoutView.scrollEnabled = YES;
    _linearLayoutView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _linearLayoutView.backgroundColor = [UIColor baseBackgroundColor];
    [self.view addSubview:_linearLayoutView];

    
    
    CSLinearLayoutItem *item = [self newItem];
    [_linearLayoutView addItem:item];
    
    
        // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleRemoveView:(UITapGestureRecognizer*)recognizer {
    for(CSLinearLayoutItem *item in _linearLayoutView.items) {
        if(item.view == recognizer.view) {
            [_linearLayoutView removeItem:item];
            break;
        }
    }
}

@end
