//
//  FKBallView.m
//  MoveBall
//
//  Created by yeeku on 13-10-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBallView.h"
#define BALL_SIZE 24
// 定义怪物的数量
#define MONSTER_NUM 3
// 定义球门的起始位置
#define GATE_ORIGIN_X 85
// 定义球门的宽度
#define GATE_WIDTH 150
@interface FKBallView () <UIAlertViewDelegate>
{
	NSArray* ballImages;
	NSArray* monsterImages;
	UIImage* gateImage;
	// 定义变量记录足球动画帧的索引
	NSInteger ballIndex , count;
	// 定义变量记录每个怪物当前显示的动画帧的索引
	NSInteger monsterImageIndexs[MONSTER_NUM];
	// 定义数组来记录每个怪物的位置
	CGPoint monsterPoints[MONSTER_NUM];
	NSTimer* timer;
	BOOL isPlaying;  // 定义变量记录游戏的状态
}
@end
@implementation FKBallView
- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		// 加载球门图片
		gateImage = [UIImage imageNamed:@"gate"];
		// 加载足球滚动的每一帧的图片
		ballImages = [NSArray arrayWithObjects:
			[UIImage imageNamed:@"ball1"],
			[UIImage imageNamed:@"ball2"],
			[UIImage imageNamed:@"ball3"],
			[UIImage imageNamed:@"ball4"],
			[UIImage imageNamed:@"ball5"],
			[UIImage imageNamed:@"ball6"],
			[UIImage imageNamed:@"ball7"],
			[UIImage imageNamed:@"ball8"], nil];
		// 加载怪物走动的每一帧的图片
		monsterImages = [NSArray arrayWithObjects:
			[UIImage imageNamed:@"monster_move_1"],
			[UIImage imageNamed:@"monster_move_2"],
			[UIImage imageNamed:@"monster_move_3"],
			[UIImage imageNamed:@"monster_move_4"], nil];
		monsterImageIndexs[1] = 1;
		monsterImageIndexs[2] = 2;
		[self startGame];   // 开始游戏
	}
	return self;
}
- (void) moveMonster
{
	for (int i = 0 ; i < MONSTER_NUM ; i++)
	{
		// 控制怪物动画显示下一帧的图片
		monsterImageIndexs[i] = monsterImageIndexs[i] + 1;
		// 改变第i个怪物的X坐标
		monsterPoints[i].x = monsterPoints[i].x + arc4random() % 9 - 4;
	}
	[self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
	// 绘制足球
	[ballImages[ballIndex++ % 8] drawAtPoint:self.currentPoint];
	// 绘制球门
	[gateImage drawAtPoint:CGPointMake(GATE_ORIGIN_X , 0)];
	// 采用循环绘制3个怪物
	for(int i = 0 ; i < MONSTER_NUM ; i++)
	{
		[monsterImages[monsterImageIndexs[i] % 4] drawAtPoint:monsterPoints[i]];
	}
}
// 重写实现currentPoint属性的setter方法
- (void)setCurrentPoint:(CGPoint)newPoint
{
	// 如果正在游戏中，且足球新的位置点与原来的位置点不位于同一个点。
	if(isPlaying && (fabs(_currentPoint.x - newPoint.x) > 1
	   || fabs(_currentPoint.y - newPoint.y) > 1))
	{
		_currentPoint = newPoint;
		// 如果足球当前的X坐标小于0，就足球已经位于最左边
		if (_currentPoint.x < 0)
		{
			// 将足球设置在最左边，并将水平速度设为0
			_currentPoint.x = 0;
			self.xVelocity = 0;
		}
		// 球已经到了底线, 且没进球门
		if (_currentPoint.y < 75 && (_currentPoint.x < GATE_ORIGIN_X + 2
				|| _currentPoint.x > GATE_ORIGIN_X  + GATE_WIDTH - 4))
		{
			// 将足球设置在底线上，并将垂直速度设为0
			_currentPoint.y = 75;
			self.yVelocity = 0;
		}
		// 球进了球门
		if (_currentPoint.y < 75 && (_currentPoint.x >= GATE_ORIGIN_X + 2
			|| _currentPoint.x <= GATE_ORIGIN_X  + GATE_WIDTH - 4))
		{
			// 使用UIAlertView提示用户游戏结束，并询问用户是否要开始下一盘游戏
			[[[UIAlertView alloc] initWithTitle:@"游戏结束"
				message:@"您进球了，再来一盘？" delegate:self
				cancelButtonTitle:@"好" otherButtonTitles:nil] show];
			// 取消计时器
			[timer invalidate];
			isPlaying = NO;
		}
		// 如果足球的X坐标大于该控件的高度，表明足球已经到了屏幕最下方
		if (_currentPoint.x > self.bounds.size.width - BALL_SIZE)
		{
			// 将足球设置到屏幕最下方，并将垂直速度设为0
			_currentPoint.x = self.bounds.size.width - BALL_SIZE;
			self.xVelocity = 0;
		}
		// 如果足球的Y坐标大于该控件的宽度，表明足球已经到了屏幕最右边
		if (_currentPoint.y > self.bounds.size.height - BALL_SIZE)
		{
			// 将足球设置到屏幕最右边，并将水平速度设为0
			_currentPoint.y = self.bounds.size.height - BALL_SIZE;
			self.yVelocity = 0;
		}
		// 遍历每个怪物，检测怪物与足球是否碰撞
		for (int i = 0 ; i < MONSTER_NUM ; i ++)
		{
			// 如果怪物所在矩形和足球所在矩形有交集，表明二者相撞
			if(CGRectIntersectsRect([self getBallRect], [self getMonsterRect:i]))
			{
				// 怪物将足球快速向下踢出，也就是足球的Y方向上速度增加0.6
				self.yVelocity = self.yVelocity + 0.6;
			}
		}
		[self setNeedsDisplay];
	}
}
- (void)update
{
	static NSDate *lastUpdateTime;
	// 如果初始化过lastUpdateTime变量
	if (lastUpdateTime != nil)
	{
		// 计算上次到现在的时间差
		NSTimeInterval secondsSinceLastDraw =
			-([lastUpdateTime timeIntervalSinceNow]);
		// 根据加速度数据计算足球在X方向、Y方向的速度
		self.yVelocity = self.yVelocity + -(self.acceleration.y *
			secondsSinceLastDraw);
		self.xVelocity = self.xVelocity + self.acceleration.x *
			secondsSinceLastDraw;
		// 根据足球的速度计算足球在单位时间内滚动的距离。
		// 由于实际算出来的滚动距离太小，因此都需要乘以500（实际上可用400、600等）
		CGFloat xDelta = secondsSinceLastDraw * self.xVelocity * 500;
		CGFloat yDelta = secondsSinceLastDraw * self.yVelocity * 500;
		// 设置足球的位置为新计算出来的位置
		self.currentPoint = CGPointMake(self.currentPoint.x + xDelta,
			self.currentPoint.y + yDelta);
	}
	lastUpdateTime = [[NSDate alloc] init];
}
// 获取怪物所在的矩形框
- (CGRect) getMonsterRect:(NSInteger) monsterIndex
{
	CGRect rect;
	// 获取索引为monsterIndex的怪物的左上角坐标
	rect.origin = monsterPoints[monsterIndex];
	// 获取图片的大小
	rect.size = ((UIImage*)monsterImages[0]).size;
	return rect;
}
// 获取足球所在的矩形框
- (CGRect) getBallRect
{
	CGRect rect;
	rect.origin = self.currentPoint;
	rect.size = ((UIImage*)ballImages[0]).size;
	return rect;
}
- (void) resetGame
{
	// 依次设置每个怪物的位置
	monsterPoints[0] = CGPointMake(20 , 50);
	monsterPoints[1] = CGPointMake(190 , 50);
	monsterPoints[2] = CGPointMake(80 , 180);
	// 设置足球开始的位置，位于该UIView的中心
	self.currentPoint = CGPointMake((self.bounds.size.width - BALL_SIZE ) / 2.0f,
		(self.bounds.size.height - BALL_SIZE) / 2.0f);
	// 设置足球的开始速度
	self.xVelocity = 0.0f;
	self.yVelocity = 0.0f;
}
// 当用户单击UIAlertView警告框上按钮时激发该方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:
	(NSInteger)buttonIndex
{
	// 如果用户单击第一个按钮
	if(buttonIndex == 0)
	{
		[self startGame];  // 重新开始游戏
	}
}
- (void) startGame
{
	// 设置游戏状态：正在游戏
	isPlaying = YES;
	// 重设足球和怪物的位置
	[self resetGame];
	// 使用定时器控制怪物的动作
	timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self
		selector:@selector(moveMonster) userInfo:nil repeats:YES];
}
@end
