//
//  FKSnakeView.m
//  Snake
//
//  Created by yeeku on 13-7-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "FKSnakeView.h"
#import "FKPoint.h"
@implementation FKSnakeView
// 记录蛇的点, 最后一个点代表蛇头
NSMutableArray* snakeData;
// 定义食物所在的点
FKPoint* foodPos;
NSTimer* timer;
UIColor* bgColor;
UIImage* cherryImage;
UIAlertView * overAlert;
// 代表游戏音效变量
SystemSoundID gu;
SystemSoundID crash;
@synthesize orient;
- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// 加载食物图片
		cherryImage = [UIImage imageNamed:@"cherry.png"];
		// 加载游戏背景图片，并将背景图片转换为平铺形式的颜色
		bgColor = [UIColor colorWithPatternImage:
				   [UIImage imageNamed:@"grass.png"]];
		// 获取两个音效文件的的URL		
		NSURL* guUrl = [[NSBundle mainBundle]
						URLForResource:@"gu" withExtension:@"mp3"];
		NSURL* crashUrl = [[NSBundle mainBundle]
						URLForResource:@"crash" withExtension:@"wav"];
		// 加载两个音效文件
		AudioServicesCreateSystemSoundID((__bridge CFURLRef)guUrl , &gu);
		AudioServicesCreateSystemSoundID((__bridge CFURLRef)crashUrl , &crash);
 		overAlert = [[UIAlertView alloc] initWithTitle:@"游戏结束"
			message:@"您输了，是否重新再来？" delegate:self
			cancelButtonTitle:@"不来了" otherButtonTitles:@"再来一盘！", nil];
		[self startGame];
	}
	return self;
}
- (void) startGame
{
	// FKPoint 第1个参数控制位于水平第几格，第2个参数控制位于垂直第几格
	snakeData = [NSMutableArray arrayWithObjects:
				 [[FKPoint alloc] initWithX:1 y:0],
				 [[FKPoint alloc] initWithX:2 y:0],
				 [[FKPoint alloc] initWithX:3 y:0],
				 [[FKPoint alloc] initWithX:4 y:0],
				 [[FKPoint alloc] initWithX:5 y:0],nil];
	
	// 定义蛇的初始移动方向
	orient = kRight;
	timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self
		selector:@selector(move) userInfo:nil repeats:YES];
}
- (void) move
{
	// 除了蛇头受方向控制之外，其他点都是占它的前一个
	// 获取最后一个点，作为蛇头
	FKPoint* first = [snakeData objectAtIndex: snakeData.count - 1];
	FKPoint* head = [[FKPoint alloc] initWithX:first.x y:first.y];
	
	switch(orient)
	{
		case kDown: // 代表向下
			// 新蛇头的位置
			head.y = head.y + 1;
			break;
		case kLeft: // 代表向左
			// 新蛇头的位置
			head.x = head.x - 1;
			break;
		case kRight: // 代表向右
			// 新蛇头的位置
			head.x = head.x + 1;
			break;
		case kUp: // 3代表上
			// 新蛇头的位置
			head.y = head.y - 1;
			break;
	}
	// 如果移动后蛇头超出界面或与蛇身碰撞，游戏结束	
	if(head.x < 0 || head.x > WIDTH - 1
	   || head.y < 0 || head.y > HEIGHT - 1
	   || [snakeData containsObject:head])
	{
		// 播放碰撞的音效
		AudioServicesPlaySystemSound(crash);
		[overAlert show];
		[timer invalidate];
	};
	// 表明蛇头与食物点重合
	if([head isEqual:foodPos])
	{
		// 播放吃食物的音效
		AudioServicesPlaySystemSound(gu);
		// 将食物点添加成新的蛇头
		[snakeData addObject:foodPos];
		// 食物清空
		foodPos = nil;
	}
	else
	{
		// 从第一个点开始，控制蛇身向前
		for (int i = 0 ; i < snakeData.count - 1; i++)
		{
			// 将第i个点的坐标设置为第i+1个点的的坐标
			FKPoint* curPt = [snakeData objectAtIndex:i];
			FKPoint* nextPt = [snakeData objectAtIndex:i + 1];
			curPt.x = nextPt.x;
			curPt.y = nextPt.y;
		}
		// 重新设置蛇头坐标
		[snakeData setObject:head atIndexedSubscript:(snakeData.count - 1)];
	}
	if(foodPos == nil)
	{
		while(true)
		{
			FKPoint* newFoodPos = [[FKPoint alloc]
				initWithX:arc4random() % WIDTH
				y:arc4random() % HEIGHT];
			// 如果新产生的食物点，没有位于蛇身体上
			if(![snakeData containsObject:newFoodPos])
			{
				foodPos = newFoodPos;
				break; // 成功生成了食物的位置，跳出循环
			}
		}
	}
	[self setNeedsDisplay];
}
// 定义绘制蛇头的方法
- (void) drawHeadInRect:(CGRect)rect context:(CGContextRef)ctx
{
	CGContextBeginPath(ctx);
	// 根据蛇头的方向，决定开口的角度
	CGFloat startAngle;
	switch (orient) {
		case kUp:
			startAngle = M_PI * 7 / 4;
			break;
		case kDown:
			startAngle = M_PI * 3 / 4;
			break;
		case kLeft:
			startAngle = M_PI * 5 / 4;
			break;
		case kRight:
			startAngle = M_PI * 1 / 4;
			break;
		default:
			break;
	}
	// 添加一段弧作为路径
	CGContextAddArc(ctx, CGRectGetMidX(rect), CGRectGetMidY(rect)
		, CELL_SIZE / 2, startAngle, M_PI * 1.5 + startAngle, 0);
	// 将绘制点移动到中心
	CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMidY(rect));
	// 关闭路径
	CGContextClosePath(ctx);
	CGContextFillPath(ctx);
}
- (void)drawRect:(CGRect)rect
{	
	// 获取绘图API
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextClearRect(ctx, CGRectMake(0 , 0
		, WIDTH * CELL_SIZE , HEIGHT * CELL_SIZE));
	CGContextSetFillColorWithColor(ctx, [bgColor CGColor]);
	// 绘制背景，
	CGContextFillRect(ctx, CGRectMake(0 , 0
		, WIDTH * CELL_SIZE , HEIGHT * CELL_SIZE));
	// 绘制文字
	[@"疯狂贪食蛇" drawAtPoint:CGPointMake(50 ,20)
		withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
		[UIFont fontWithName:@"Heiti SC" size: 40] , NSFontAttributeName,
		[UIColor colorWithRed:1 green:0 blue:1 alpha:.4],
		NSForegroundColorAttributeName,  nil]];
	[@"www.fkjava.org" drawAtPoint:CGPointMake(50 ,60)
		withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
		[UIFont fontWithName:@"Heiti SC" size: 26] , NSFontAttributeName,
		[UIColor colorWithRed:1 green:0 blue:1 alpha:.4],
		NSForegroundColorAttributeName, nil]];
	// 设置绘制蛇的填充颜色
	CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
	// 遍历蛇的数据，绘制蛇的数据
	for (int i = 0 ; i < snakeData.count ; i++ )
	{
		// 为每个蛇的点(记录的是在数组的位置)，在屏幕上绘制一个圆点
		FKPoint* cp = [snakeData objectAtIndex:i];
		// 定义将要绘制蛇身点的矩形
		CGRect rect = CGRectMake(cp.x * CELL_SIZE , cp.y * CELL_SIZE
			, CELL_SIZE , CELL_SIZE);
		// 绘制蛇尾巴，让蛇的尾巴小一些
		if(i < 4)
		{
			CGFloat inset =  (4 - i);
			CGContextFillEllipseInRect(ctx,CGRectInset(rect, inset, inset));
		}
		// 如果是最后一个元素，代表蛇头，绘制蛇头
		else if (i == snakeData.count - 1)
		{
			[self drawHeadInRect:rect context:ctx];
		}
		else
		{
			CGContextFillEllipseInRect(ctx, rect);
		}
	}
	// 绘制“食物”图片
	[cherryImage drawAtPoint:CGPointMake(foodPos.x * CELL_SIZE
		, foodPos.y * CELL_SIZE)];
}

-(void)alertView:(UIAlertView *)alertView
	clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// 如果用户点击了第二个按钮，重新开始游戏
	if(buttonIndex == 1)
		[self startGame];
}
@end
