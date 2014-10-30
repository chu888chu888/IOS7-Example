//
//  CallRecord.m
//  weChat
//
//  Created by apple on 14-9-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "CallRecord.h"

@implementation CallRecord
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (void) initialize
{
    [self addSegmentedControl];
    [self addSelectedView];
}

-(void) addSegmentedControl{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"求租客户",@"出租客户",@"二手房客户",nil];
    _segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    _segmentedControl.frame = CGRectMake(10.0, 10.0,300.0, 30.0);
    /*
     这个是设置按下按钮时的颜色
     */
    _segmentedControl.tintColor = [UIColor baseColor];
    _segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    /*
     下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
     */
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,[UIColor baseColor], NSForegroundColorAttributeName, nil];
    
    [_segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor baseColor] forKey:NSForegroundColorAttributeName];
    
    [_segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [bgView setImage:[UIImage imageNamed:@"bg_deal_buyAction"]];
    [selectView addSubview:bgView];
    [selectView addSubview:_segmentedControl];
    
    //设置分段控件点击相应事件
//    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:selectView];
}

-(void) addSelectedView{
    float listHeight =[ UIScreen mainScreen ].applicationFrame.size.height-94.0f;
    _listView = [[GlobalUITableView alloc] initWithFrame:CGRectMake(0, 50,[ UIScreen mainScreen ].applicationFrame.size.width, listHeight)];
    
     _listView.rowHeight=54;
    
//    _forRentListView = [[GlobalUITableView alloc] initWithFrame:CGRectMake(0, 50,[ UIScreen mainScreen ].applicationFrame.size.width, [ UIScreen mainScreen ].applicationFrame.size.height)];
//    
//    _secondListView = [[GlobalUITableView alloc] initWithFrame:CGRectMake(0, 50,[ UIScreen mainScreen ].applicationFrame.size.width, [ UIScreen mainScreen ].applicationFrame.size.height)];
    
    [self addSubview:_listView];
    
}








@end
