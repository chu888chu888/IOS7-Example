//
//  FKCitysViewController.m
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKCitiesViewController.h"
#import "FKRootViewController.h"

@interface FKCitiesViewController ()

@end

@implementation FKCitiesViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"选择城市";
}
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	return [self.citys count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 定义动态单元格原型的Identifier
	static NSString *cellId = @"cityCell";
	// 获取可重用的单元格
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
	// 根据行号来获取city
	NSString *rowString = [self.citys objectAtIndex:indexPath.row];
	// 为每个单元格设置城市
	cell.textLabel.text = rowString;
	return cell;
}
// 当用户选择某个城市时激发该方法
- (void)tableView:(UITableView *)tableView
	didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 获取用户选择的城市
	NSString *city = [self.citys objectAtIndex:indexPath.row];
	// 判断delegate是否可以调用addCityToRootView方法
	if([self.delegate respondsToSelector:@selector(addCityToRootView:)])
	{
		// 调用delegate对象的方法，从而将用户选择的城市传给delegate对象
		[self.delegate addCityToRootView:city];
	}
	// 返回根视图控制器
	[self.navigationController popToRootViewControllerAnimated:YES];
}
@end
