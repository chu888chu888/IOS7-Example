//
//  FKViewController.m
//  DashLineTest
//
//  Created by yeeku on 13-7-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKDashLineView.h"

@interface FKViewController ()

@end

@implementation FKViewController
typedef struct {
	CGFloat pattern[5];
	size_t count;
} Pattern;
// 初始化多个点线模式
static Pattern patterns[] = {
	{{10.0, 10.0}, 2},
	{{10.0, 20.0, 10.0}, 3},
	{{10.0, 20.0, 30.0}, 3},
	{{10.0, 20.0, 10.0, 30.0}, 4},
	{{10.0, 10.0, 20.0, 20.0}, 4},
	{{10.0, 10.0, 20.0, 30.0, 50.0}, 5},
};
static NSInteger patternCount = sizeof(patterns)
	/ sizeof(patterns[0]);
FKDashLineView* dashView;
-(void)viewDidLoad
{
	[super viewDidLoad];
	// 创建FKDashLineView自定义控件
	dashView = [[FKDashLineView alloc] initWithFrame:
				self.scrollView.bounds];
	// 将FKDashLineView控件添加到scrollView中
	[self.scrollView addSubview: dashView];
	[dashView setDashPattern:patterns[0].pattern
		count:patterns[0].count];
	// 为UIPickerView设置dataSource、delegate属性
	self.picker.dataSource = self;
	self.picker.delegate = self;
	// 选中UIPickerView的第一行
	[self.picker selectRow:0 inComponent:0 animated:NO];
	// 为UIPickerView的Value Changed事件绑定事件监听器
	[self.phase addTarget:self action:@selector(dashPhase)
		 forControlEvents:UIControlEventValueChanged];
}
-(void)dashPhase
{
	// 将dashView的dahsPhase设置与UIPickerView的值相同
	dashView.dashPhase = self.phase.value;
}
-(IBAction)reset
{
	// 将dashView的dahsPhase设为0
	dashView.dashPhase = 0.0;
	// 将界面上UIPickerView控件的值也设为0
	self.phase.value = 0.0;
}
// 该方法的返回值控制UIPickerView只包含一列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
// 该方法的返回值控制UIPickerView包含多少个列表项。
-(NSInteger)pickerView:(UIPickerView *)pickerView
	numberOfRowsInComponent:(NSInteger)component
{
	return patternCount;
}
// 该方法的返回值决定每个列表项所显示的文本。
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
	(NSInteger)row forComponent:(NSInteger)component;
{
	// 获取patterns数组的第row个元素
	Pattern p = patterns[row];
	// 将第row个patterns数组元素的pattern成员所包含的count个值拼接起来
	// 作为第row个列表项所显示的文本
	NSMutableString *title = [NSMutableString
		stringWithFormat:@"%.0f", p.pattern[0]];
	for(size_t i = 1; i < p.count; ++i)
	{
		[title appendFormat:@"-%.0f", p.pattern[i]];
	}
	return title;
}
// 当用户选择UIPickView的指定列表项时，程序设置dashView的点线模式
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
	(NSInteger)row inComponent:(NSInteger)component
{
	[dashView setDashPattern:patterns[row].pattern
		count:patterns[row].count];
}
@end
