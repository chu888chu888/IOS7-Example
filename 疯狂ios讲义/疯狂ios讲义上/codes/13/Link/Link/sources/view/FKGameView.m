//
//  FKGameView.m
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKGameView.h"
#import "FKLinkInfo.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation FKGameView
// 选中标识的图片对象
UIImage* selectedImage;
// 定义两个音效文件
SystemSoundID gu;
SystemSoundID dis;
// 定义连接线的颜色
UIColor* bubbleColor;
- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// 初始化代表选中框的图片
		selectedImage = [UIImage imageNamed:@"selected.png"];
		// 获取两个音效文件的的URL
		NSURL* disUrl = [[NSBundle mainBundle]
			URLForResource:@"dis" withExtension:@"wav"];
		NSURL* guUrl = [[NSBundle mainBundle]
			URLForResource:@"gu" withExtension:@"mp3"];
		// 加载音效文件
		AudioServicesCreateSystemSoundID((__bridge CFURLRef)disUrl , &dis);
		AudioServicesCreateSystemSoundID((__bridge CFURLRef)guUrl , &gu);
		// 使用图片平铺作为定义连接线的颜色
		bubbleColor = [UIColor colorWithPatternImage:
			[UIImage imageNamed:@"bubble.jpg"]];
	}
	return self;
}
- (void)drawRect:(CGRect)rect
{
	if (self.gameService == nil)
		return;
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(ctx, [bubbleColor CGColor]);
	CGContextSetLineWidth(ctx, 10);
	CGContextSetLineJoin(ctx, kCGLineJoinRound);
	CGContextSetLineCap(ctx, kCGLineCapRound);
	NSArray* pieces = self.gameService.pieces;   // ②
	if (pieces != nil)
	{
		// 遍历pieces二维数组
		for (int i = 0; i < pieces.count; i++)
		{
			for (int j = 0; j < [[pieces objectAtIndex:i] count]; j++)
			{
				// 如果二维数组中该元素为FKPiece对象（即有方块），绘制该方块
				if ([[[pieces objectAtIndex:i] objectAtIndex:j]
					 class] == FKPiece.class)
				{
					// 得到这个FKPiece对象
					FKPiece* piece =[[pieces objectAtIndex:i] objectAtIndex:j];
					// 将该FKPiece对象中包含的图片绘制在制定位置
					[piece.image.image drawAtPoint:CGPointMake(
						piece.beginX, piece.beginY)];
				}
			}
		}
	}
	// 如果当前对象中的linkInfo属性不为nil,表明有连接信息
	if (self.linkInfo != nil)
	{
		// 绘制连接线
		[self drawLine: self.linkInfo context:ctx];
		// 处理完后清空linkInfo属性
		self.linkInfo = nil;
		[self performSelector:@selector(setNeedsDisplay)
			withObject:nil afterDelay:0.3];
	}
	// 画选中标识的图片
	if (self.selectedPiece != nil)
	{
		[selectedImage drawAtPoint:CGPointMake(self.selectedPiece.beginX,
			self.selectedPiece.beginY)];
	}
}
// 根据FKLinkInfo绘制连接线的方法。
- (void) drawLine:(FKLinkInfo*)linkInfo context:(CGContextRef)ctx
{

	// 获取FKLinkInfo中封装的所有连接点
	NSArray* points = linkInfo.points;
	FKPoint* firstPoint = [points objectAtIndex:0];
	CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
	// 依次遍历FKLinkInfo中的每个连接点
	for (int i = 1; i < points.count; i++)
	{
		// 获取当前连接点与下一个连接点
		FKPoint* currentPoint = [points objectAtIndex:i];
		CGContextAddLineToPoint(ctx , currentPoint.x, currentPoint.y);
	}
	// 绘制路径
	CGContextStrokePath(ctx);
}
// 开始游戏方法
- (void) startGame
{
	[self.gameService start];
	[self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch* touch = [touches anyObject];
	// 获取FKGameService中的FKPiece二维数组
	NSArray* pieces = self.gameService.pieces;
	// 获取用户触碰的点
	CGPoint touchPoint = [touch locationInView:self];
	// 根据用户触碰的坐标得到对应的FKPiece对象
	FKPiece* currentPiece = [self.gameService findPieceAtTouchX: touchPoint.x
		touchY: touchPoint.y];  //③
	// 如果没有选中任何FKPiece对象(即鼠标点击的地方没有图片), 不再往下执行
	if ([currentPiece class] != FKPiece.class)
		return;
	// 表示之前没有选中任何一个FKPiece
	if (self.selectedPiece == nil)
	{
		// 将当前方块设为已选中的方块, 通知FKGameView重新绘制, 并不再往下执行
		self.selectedPiece = currentPiece;
		// 播放选中方块的音效
		AudioServicesPlaySystemSound(gu);
		[self setNeedsDisplay];
		return;
	}
	// 表示之前已经选择了一个
	else
	{
		// 在这里就要对currentPiece和prePiece进行判断并进行连接
		FKLinkInfo* linkInfo = [self.gameService linkWithBeginPiece:
			self.selectedPiece endPiece:currentPiece];  //④
		// 两个FKPiece不可连, linkInfo为nil
		if (linkInfo == nil)
		{
			// 如果连接不成功, 将当前方块设为选中方块
			self.selectedPiece = currentPiece;
			// 播放选中一个方块的音效		
			AudioServicesPlaySystemSound(gu);
			[self setNeedsDisplay];
		}
		else
		{
			// 播放方块连接成功的音效
			AudioServicesPlaySystemSound(dis);
			// 处理成功连接
			[self handleSuccessLink:linkInfo prevPiece:self	.selectedPiece
				currentPiece: currentPiece pieces:pieces];
		}
	}
}
/**
 * 成功连接后处理
 *
 * @param linkInfo 连接信息
 * @param prePiece 前一个选中方块
 * @param currentPiece 当前选择方块
 * @param pieces 系统中还剩的全部方块
 */
- (void) handleSuccessLink:(FKLinkInfo*) linkInfo prevPiece:(FKPiece*)
	prevPiece currentPiece:(FKPiece*)currentPiece pieces:(NSArray*) pieces  //⑤
{
	// 它们可以相连, 让UIGameView处理FKLinkInfo
	_linkInfo = linkInfo;
	// 将gameView中的选中方块设为nil
	self.selectedPiece = nil;
	// 将两个FKPiece对象从数组中删除
	[[pieces objectAtIndex:prevPiece.indexX] setObject:[NSObject new]
		atIndex:prevPiece.indexY];
	[[pieces objectAtIndex:currentPiece.indexX] setObject:[NSObject new]
		atIndex:currentPiece.indexY];
	[self setNeedsDisplay];
	[self.delegate checkWin:self];
}
@end
