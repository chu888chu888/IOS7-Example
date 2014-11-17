//
//  GlobalUIView.m
//  weChat
//
//  Created by apple on 14-9-18.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalUIView.h"

@implementation GlobalUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        [self addLinearLayoutView];
    }
    return self;
}

- (void)addLinearLayoutView{
    self.linearLayoutView = [[CSLinearLayoutView alloc] initWithFrame:self.bounds];
    _linearLayoutView.orientation = CSLinearLayoutViewOrientationVertical;
    _linearLayoutView.scrollEnabled = YES;
//    _linearLayoutView.autoAdjustFrameSize = YES;
    _linearLayoutView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    _linearLayoutView.backgroundColor = [UIColor baseBackgroundColor];
    _linearLayoutView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_linearLayoutView];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
