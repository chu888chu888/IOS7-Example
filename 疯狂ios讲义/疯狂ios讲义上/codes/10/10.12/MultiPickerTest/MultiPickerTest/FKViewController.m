//
//  FKViewController.m
//  MultiPickerTest
//
//  Created by yeeku on 13-6-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSArray* books;
NSArray* authors;
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建、并初始化2个NSArray对象，分别作为2列的数据
	authors = [NSArray arrayWithObjects:@"泰戈尔",
			   @"冯梦龙", @"李刚" , nil];
	books = [NSArray arrayWithObjects:@"飞鸟集" , @"吉檀迦利"
			 , @"醒世恒言",@"喻世明言", @"警世通言", @"疯狂Android讲义",
			 @"疯狂iOS讲义", @"疯狂Ajax讲义" , @"疯狂XML讲义", nil];
	self.picker.dataSource = self;
	self.picker.delegate = self;
}
// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
	// 返回2表明该控件只包含2列
	return 2;
}
// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView
	numberOfRowsInComponent:(NSInteger)component
{
	// 如果是第一列，返回authors中元素的个数
	// 即authors包含多少个元素，第一列就包含多少个列表项
	if (component == 0) {
		return authors.count;
	}
	// 如果是其他列，返回books中元素的个数。
	// 即books包含多少个元素，其他列（只有第二列）包含多少个列表项
	return books.count;
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为
// UIPickerView中指定列、指定列表项上显示的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
	(NSInteger)row forComponent:(NSInteger)component
{
	// 如果是第一列，返回authors中row索引处的元素
	// 即第一列的列表项标题由authors集合元素决定。
	if (component == 0) {
		return [authors objectAtIndex:row];
	}
	// 如果是其他列（只有第二列），返回books中row索引处的元素
	// 即第二列的列表项标题由books集合元素决定。
	return [books objectAtIndex:row];
}
// 当用户选中UIPickerViewDataSource中指定列、指定列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
	(NSInteger)row inComponent:(NSInteger)component
{
	NSArray* tmp  = component == 0 ? authors: books;
	NSString* tip = component == 0 ? @"作者": @"图书";
	// 使用一个UIAlertView来显示用户选中的列表项
	UIAlertView* alert = [[UIAlertView alloc]
		initWithTitle:@"提示"
		message:[NSString stringWithFormat:@"你选中的%@是：%@，"
			  , tip , [tmp objectAtIndex:row]]
		delegate:nil
		cancelButtonTitle:@"确定"
		otherButtonTitles:nil];
	[alert show];
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为
// UIPickerView中指定列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView
	widthForComponent:(NSInteger)component
{
	// 如果是第一列，宽度为90
	if (component == 0) {
		return 90;
	}
	// 如果是其他列（只有第二列），宽度为210
	return 210;
}
@end
