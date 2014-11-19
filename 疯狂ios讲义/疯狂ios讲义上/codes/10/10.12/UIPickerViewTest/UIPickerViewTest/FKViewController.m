//
//  FKViewController.m
//  UIPickerViewTest
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSArray* books;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建、并初始化NSArray对象。
	books = [NSArray arrayWithObjects:@"疯狂Android讲义",
		@"疯狂iOS讲义", @"疯狂Ajax讲义" , @"疯狂XML讲义", nil];
	// 为UIPickerView控件设置dataSource和delegate
	self.picker.dataSource = self;
	self.picker.delegate = self;
}
// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
	// 返回1表明该控件只包含1列
	return 1;
}
// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView
	numberOfRowsInComponent:(NSInteger)component
{
	// 由于该控件只包含一列，因此无需理会列序号参数component
	// 该方法返回books.count，表明books包含多少个元素，该控件就包含多少行
	return books.count;
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
// 中指定列、指定列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView
	titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	// 由于该控件只包含一列，因此无需理会列序号参数component
	// 该方法根据row参数来返回books中的元素，row参数代表列表项的编号，
	// 因此该方法表示第几个列表项，就使用books中的第几个元素
	return [books objectAtIndex:row];
}
// 当用户选中UIPickerViewDataSource中指定列、指定列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
	(NSInteger)row inComponent:(NSInteger)component
{
	// 使用一个UIAlertView来显示用户选中的列表项
	UIAlertView* alert = [[UIAlertView alloc]
		initWithTitle:@"提示"
		message:[NSString stringWithFormat:@"你选中的图书是：%@"
			, [books objectAtIndex:row]]
		delegate:nil
		cancelButtonTitle:@"确定"
		otherButtonTitles:nil];
	[alert show];
}
@end
