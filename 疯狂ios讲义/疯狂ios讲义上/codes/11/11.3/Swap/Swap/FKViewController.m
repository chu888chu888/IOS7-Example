//
//  FKViewController.m
//  Swap
//
//  Created by yeeku on 13-7-22.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSMutableArray* imageNames;
NSUInteger imageIndex;
- (void)viewDidLoad
{
	[super viewDidLoad];
	imageNames = [[NSMutableArray alloc] init];
	NSArray* paths = [[NSBundle mainBundle]
			pathsForResourcesOfType:@"png" inDirectory:nil];
	for(NSString* path in paths)
	{
		// 如果文件名以p_开头，表明是我们将要显示的图片
		if([path.lastPathComponent hasPrefix:@"p_"])
		{
			// 将以p_开头的图片添加到imageNames数组中
			[imageNames addObject:path.lastPathComponent];
		}
	}
	imageIndex = 0;
	for(UIImageView* iv in self.imageViews)
	{
		iv.image = [UIImage imageNamed:[imageNames objectAtIndex:imageIndex]];
	}
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
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
	interfaceOrientation duration:(NSTimeInterval)duration
{
	CGSize screenSize = [[UIScreen mainScreen] bounds].size;
	// 如果当前处于横屏显示状态
	switch(interfaceOrientation)
	{
		case UIInterfaceOrientationPortrait:
			self.view = self.vertical;
			// 使用CGAffineTransformIdentity单位矩阵让该view恢复原始状态
			self.view.transform = CGAffineTransformIdentity;
			self.view.bounds = CGRectMake(0 ,0
				, screenSize.width , screenSize.height);
			break;
		case UIInterfaceOrientationPortraitUpsideDown:
			self.view = self.vertical;
			// 使用CGAffineTransformIdentity单位矩阵让该view旋转180度
			self.view.transform =  CGAffineTransformMakeRotation(M_PI);
			self.view.bounds = CGRectMake(0 ,0
				, screenSize.width , screenSize.height);
			break;
		case UIInterfaceOrientationLandscapeLeft:
			self.view = self.horizontal;
			// 使用CGAffineTransformIdentity单位矩阵让该view旋转-90度
			self.view.transform = CGAffineTransformMakeRotation(M_PI * -90 / 180);
			self.view.bounds = CGRectMake(0 ,0
				, screenSize.height , screenSize.width);
			break;
		case UIInterfaceOrientationLandscapeRight:
			self.view = self.horizontal;
			// 使用CGAffineTransformIdentity单位矩阵让该view旋转90度
			self.view.transform = CGAffineTransformMakeRotation(M_PI * 90 / 180);
			self.view.bounds = CGRectMake(0 ,0
				, screenSize.height , screenSize.width);
			break;
	};
}
- (IBAction)first:(id)sender
{
	// 控制显示第一张的图片
	imageIndex = 0;
	// 同时修改横屏显示、纵屏显示的两个UIImageView内的图片
	for(UIImageView* iv in self.imageViews)
	{
		iv.image = [UIImage imageNamed:[imageNames objectAtIndex:imageIndex]];
	}
}
- (IBAction)prev:(id)sender
{
	imageIndex --;
	// 同时修改横屏显示、纵屏显示的两个UIImageView内的图片
	for(UIImageView* iv in self.imageViews)
	{
		iv.image = [UIImage imageNamed:[imageNames objectAtIndex:
			(imageIndex % imageNames.count)]];
	}
}
- (IBAction)next:(id)sender
{
	imageIndex ++;
	// 同时修改横屏显示、纵屏显示的两个UIImageView内的图片	
	for(UIImageView* iv in self.imageViews)
	{
		iv.image = [UIImage imageNamed:[imageNames objectAtIndex:
			(imageIndex % imageNames.count)]];
	}
}

- (IBAction)last:(id)sender
{
	// 控制显示最后一张的图片
	imageIndex = imageNames.count - 1;
	// 同时修改横屏显示、纵屏显示的两个UIImageView内的图片
	for(UIImageView* iv in self.imageViews)
	{
		iv.image = [UIImage imageNamed:[imageNames objectAtIndex:imageIndex]];
	}
}
@end
