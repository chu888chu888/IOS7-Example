//
//  FKViewController.m
//  UISliderTest
//
//  Created by yeeku on 13-6-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建可拉伸图片，指定对heart.gif图片整体进行平铺
	UIImage* minImage = [[UIImage imageNamed:@"heart.gif"]
		resizableImageWithCapInsets:UIEdgeInsetsZero
		resizingMode:UIImageResizingModeTile];
	// 创建可拉伸图片，指定对grow.gif图片整体进行平铺
	UIImage* maxImage = [[UIImage imageNamed:@"grow.gif"]
		resizableImageWithCapInsets:UIEdgeInsetsZero
		resizingMode:UIImageResizingModeTile];
	// 设置拖动条已完成部分的轨道的图片。
	[self.slider setMinimumTrackImage:minImage
		forState: UIControlStateNormal];
	// 设置拖动条未完成部分的轨道的图片。	
	[self.slider setMaximumTrackImage:maxImage
		forState: UIControlStateNormal];
	// 设置拖动条上滑块的图片。
	[self.slider setThumbImage:[UIImage imageNamed:@"ic_launcher.png"]
		forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (IBAction)changed:(UISlider*)sender {
	// 根据拖动条的值改变iv控件的透明度
	[self.iv setAlpha:sender.value];
}
@end
