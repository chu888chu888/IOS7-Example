//
//  FKViewController.m
//  AutoRotate
//
//  Created by yeeku on 13-7-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

# define CELL_SIZE 120
# define MARGIN 20
# define STATUS_SIZE 20
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
}
// 该方法将返回YES，设置该视图控制器支持自动旋转
- (BOOL) shouldAutorotate
{
	return YES;
}
// 该方法返回UIInterfaceOrientationMaskAll表明该视图控制器支持所有显示方向
- (NSUInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskAll;
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
	CGSize screenSize = [UIScreen mainScreen].bounds.size;
	// 如果当前处于横屏显示状态
	if(UIInterfaceOrientationIsLandscape(interfaceOrientation))
	{
		// 前3个控件的Y坐标相同，表明它们处于同一行
		// 前3个控件的X坐标逐个增加，表明它们依次排列
		self.ajax.frame = CGRectMake(MARGIN
			, MARGIN , CELL_SIZE , CELL_SIZE);
		self.android.frame = CGRectMake((screenSize.height - CELL_SIZE) / 2
			, MARGIN , CELL_SIZE , CELL_SIZE);
		self.html.frame = CGRectMake(screenSize.height - MARGIN - CELL_SIZE
			, MARGIN , CELL_SIZE , CELL_SIZE);
		// 后3个控件的Y坐标相同，表明它们处于同一行
		// 后3个控件的X坐标与前面3个控件X坐标对应相同，表明它们处于3列
		self.java.frame = CGRectMake(MARGIN
			, screenSize.width - CELL_SIZE - MARGIN - STATUS_SIZE
			, CELL_SIZE , CELL_SIZE);
		self.java2.frame = CGRectMake((screenSize.height - CELL_SIZE) / 2
			, screenSize.width - CELL_SIZE - MARGIN - STATUS_SIZE
			, CELL_SIZE , CELL_SIZE);
		self.javaee.frame = CGRectMake(screenSize.height - MARGIN - CELL_SIZE
			, screenSize.width - CELL_SIZE - MARGIN - STATUS_SIZE
			, CELL_SIZE , CELL_SIZE);
	}
	// 如果当前处于纵屏显示状态	
	else
	{
		// 前2个控件的Y坐标相同，表明它们处于同一行
		self.ajax.frame = CGRectMake(MARGIN , MARGIN
			, CELL_SIZE , CELL_SIZE);
		self.android.frame = CGRectMake(screenSize.width - MARGIN - CELL_SIZE
			, MARGIN , CELL_SIZE , CELL_SIZE);
		// 中间2个控件的Y坐标相同，表明它们处于同一行		
		self.html.frame = CGRectMake(MARGIN
			, (screenSize.height  - STATUS_SIZE - CELL_SIZE) / 2
			, CELL_SIZE , CELL_SIZE);
		self.java.frame = CGRectMake(screenSize.width - MARGIN - CELL_SIZE
			, (screenSize.height - STATUS_SIZE - CELL_SIZE) / 2
			, CELL_SIZE , CELL_SIZE);
		// 中间2个控件的Y坐标相同，表明它们处于同一行		
		self.java2.frame = CGRectMake(MARGIN
			, screenSize.height - CELL_SIZE - MARGIN - STATUS_SIZE
			, CELL_SIZE , CELL_SIZE);
		self.javaee.frame = CGRectMake(screenSize.width - MARGIN - CELL_SIZE
			, screenSize.height - CELL_SIZE - MARGIN - STATUS_SIZE
			, CELL_SIZE , CELL_SIZE);
	}
}
@end
