//
//  SurnameView.m
//  weAgent
//
//  Created by apple on 14-10-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SurnameView.h"
#import "UIColor+base.h"
#define PI 3.14159265358979323846
@implementation SurnameView

- (id)initWithSurname:(NSString*)surname
{
    self = [super initWithFrame:CGRectMake(0, 0, 60, 60)];
    if (self) {
        // Initialization code
        self.surname =surname;
        self.backgroundColor = [UIColor baseColor];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    CGContextRef context = UIGraphicsGetCurrentContext();

    
    
    CGContextSetLineWidth(context, 5.0);//线的宽度
    CGContextAddArc(context, 30, 30, 23, 0, 2*PI, 0); //添加一个圆
    // Closing the path connects the current point to the start of the current path.
    CGContextClosePath(context);
    // And stroke the path
    [[UIColor whiteColor] setStroke];
    //CGContextStrokePath(context);
    [[UIColor baseColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextSetRGBFillColor (context,  1, 1, 1, 1.0);//设置填充颜色
    UIFont  *font = [UIFont boldSystemFontOfSize:32.0];//设置
    [self.surname drawInRect:CGRectMake(14, 10, 60, 20) withFont:font];
}


@end
