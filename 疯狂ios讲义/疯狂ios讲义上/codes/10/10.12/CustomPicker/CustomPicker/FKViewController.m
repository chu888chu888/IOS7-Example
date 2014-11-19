//
//  FKViewController.m
//  CustomPicker
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface FKViewController ()

@end

@implementation FKViewController
UIImage* loseImage;
UIImage* winImage;
// 保存系统中所有图片的集合
NSArray* images;
- (void)viewDidLoad
{
	[super viewDidLoad];
	loseImage = [UIImage imageNamed:@"lose.jpg"];
	winImage = [UIImage imageNamed:@"win.gif"];
	// 依次加载6张图片，生成对应的UIImage对象
	UIImage* dog = [UIImage imageNamed:@"dog.png"];
	UIImage* duck = [UIImage imageNamed:@"duck.png"];
	UIImage* elephant = [UIImage imageNamed:@"elephant.png"];
	UIImage* frog = [UIImage imageNamed:@"frog.png"];
	UIImage* mouse = [UIImage imageNamed:@"mouse.png"];
	UIImage* rabbit = [UIImage imageNamed:@"rabbit.png"];
	// 初始化images集合，将前面的6张图片封装成images集合
	images = [NSArray arrayWithObjects: dog, duck, elephant,
		frog, mouse, rabbit,nil];
	self.picker.dataSource = self;
	self.picker.delegate = self;
}
// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
	// 返回5表明该控件只包含5列
	return 5;
}
// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView
	numberOfRowsInComponent:(NSInteger)component
{
	// images集合包含多少个元素，该控件的各列就包含多少个列表项
	return images.count;
}
#define kImageTag 1
// UIPickerViewDelegate中定义的方法，该方法返回的UIView将作为
// UIPickerView中指定列、指定列表项的UI控件
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:
	(NSInteger)row forComponent:(NSInteger)component
	reusingView:(UIView *)view
{
	// 如果可重用的view的tag不等于kImageTag，表明该view已经不存在，需要重新创建
	if(view.tag != kImageTag)
	{
		view = [[UIImageView alloc] initWithImage:[images objectAtIndex:row]];
		// 为该UIView设置tag属性
		view.tag = kImageTag;
		// 设置不允许用户交互
		view.userInteractionEnabled = NO;
	}
	return view;
}
// UIPickerViewDelegate中定义的方法，该方法的返回值决定列表项的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView
	rowHeightForComponent:(NSInteger)component
{
	return 40;
}
// UIPickerViewDelegate中定义的方法，该方法的返回值决定列表项的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView
	widthForComponent:(NSInteger)component
{
	return 40;
}
- (IBAction)clicked:(id)sender {
	// 禁用该按钮
	self.startBn.enabled = NO;
	// 清空界面上image控件中的图片
	self.image.image = nil;
	// 定义一个NSMutableDictionary来记录每个随机数的出现次数
	NSMutableDictionary* result = [[NSMutableDictionary alloc]
		initWithCapacity:6];
	NSURL *winSoundUrl = [[NSBundle mainBundle]
		URLForResource:@"crunch" withExtension:@"wav"];
	SystemSoundID soundId;
	// 装载声音文件
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)
		(winSoundUrl), &soundId);
	// 播放声音
	AudioServicesPlaySystemSound(soundId);
	for(int i = 0 ; i < 5 ; i++)
	{
		// 生成一个0~images.count之间的随机数
		NSUInteger selectedVal = arc4random() % images.count;
		[self.picker selectRow:selectedVal inComponent:i animated:YES];		
		// 已经result中已经为该随机数记录了出现次数
		if([result objectForKey:[NSNumber numberWithInt:selectedVal]])
		{
			// 获取result中该随机数的出现次数
			NSUInteger newCount = [[result objectForKey:
				[NSNumber numberWithInt:selectedVal]] integerValue];
			// 将result中该随机数的出现次数+1
			[result setObject:[NSNumber numberWithInt:(newCount + 1)]
				forKey:[NSNumber numberWithInt:selectedVal]];
		}
		else
		{
			// 使用result记录该随机数的出现次数为1
			[result setObject:[NSNumber numberWithInt:1]
				forKey:[NSNumber numberWithInt:selectedVal]];
		}
		// 使用该变量记录随机数的最大出现次数
		NSUInteger maxOccurs = 1;
		for (NSNumber* num in [result allKeys])
		{
			// 只要任何随机数的出现次数大于maxOccurs
			if ([[result objectForKey:num] integerValue] > maxOccurs)
			{
				// 使用maxOccurs保存该随机数的出现次数
				maxOccurs = [[result objectForKey:num] integerValue];
			}
		}
		// 如果某个随机数的出现次数大于等于3（即使界面出现了3个相同的图案）
		if(maxOccurs >= 3)
		{
			// 如果赢了，延迟0.5秒执行showWin方法，显示结果
			[self performSelector:@selector(showWin)
				withObject:nil afterDelay:0.5];
		}
		else
		{
			// 如果输了，延迟0.5秒执行showLose方法，显示结果
			[self performSelector:@selector(showLose)
				withObject:nil afterDelay:0.5];
		}
	}
}
- (void) showWin
{
	NSURL *winSoundUrl = [[NSBundle mainBundle]
		URLForResource:@"win" withExtension:@"wav"];
	SystemSoundID soundId;
	// 装载声音文件
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)
		(winSoundUrl), &soundId);
	// 播放声音
	AudioServicesPlaySystemSound(soundId);
	self.image.image = winImage;
	self.startBn.enabled = YES;
}
- (void) showLose
{
	self.image.image = loseImage ;
	self.startBn.enabled = YES;
}
@end