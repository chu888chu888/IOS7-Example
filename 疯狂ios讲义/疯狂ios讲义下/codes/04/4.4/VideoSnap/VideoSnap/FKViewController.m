//
//  FKViewController.m
//  VideoSnap
//
//  Created by yeeku on 13-8-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "UIImage+Video.h"

@interface FKViewController ()

@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	NSURL* videoUrl = [[NSBundle mainBundle]
		URLForResource:@"movie" withExtension:@"mp4"];
	// 生成视频的缩略图
	UIImage* image = [UIImage imageWithVideo:videoUrl];
	self.iv.image = image;
}
@end
