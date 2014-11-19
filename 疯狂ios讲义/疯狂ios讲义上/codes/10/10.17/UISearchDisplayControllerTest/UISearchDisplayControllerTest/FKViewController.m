//
//  FKViewController.m
//  UISearchDisplayControllerTest
//
//  Created by yeeku on 13-6-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
// 定义一个NSArray保存表格显示的原始数据
NSArray* tableData;
// 定义一个NSArray保存查询结果数据
NSArray* searchData;
bool isSearch;
- (void)viewDidLoad
{
    [super viewDidLoad];
	isSearch = NO;
	// 初始化表格原始显示的数据
	tableData = [NSArray arrayWithObjects:@"疯狂Java讲义",
		@"轻量级Java EE企业应用实战",
		@"疯狂Android讲义",
		@"疯狂Ajax讲义",
		@"疯狂HTML5/CSS3/JavaScript讲义",
		@"疯狂iOS讲义",
		@"疯狂XML讲义",
		@"经典Java EE企业应用实战"
		@"Java入门与精通",
		@"Java基础教程",
		@"学习Java",
		@"Objective-C基础" ,
		@"Ruby入门与精通",
		@"iOS开发教程" , nil];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	// 如果处于搜索状态
	if(isSearch)
	{
		// 使用searchData作为表格显示的数据
		return searchData.count;
	}
	else
	{
		// 否则使用原始的tableData座位表格显示的数据
		return tableData.count;
	}
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString* cellId = @"cellId";
	// 从可重用的表格行队列中获取表格行
	UITableViewCell* cell = [tableView
		dequeueReusableCellWithIdentifier:cellId];
	// 如果表格行为nil
	if(!cell)
	{
		// 创建表格行
		cell = [[UITableViewCell alloc] initWithStyle:
				UITableViewCellStyleDefault
									  reuseIdentifier:cellId];
	}
	// 将单元格的边框设置为圆角
	cell.layer.cornerRadius = 12;
	cell.layer.masksToBounds = YES;
	// 获取当前正在处理的表格行的行号
	NSInteger rowNo = indexPath.row;
	// 如果处于搜索状态
	if(isSearch)
	{
		// 使用searchData作为表格显示的数据
		cell.textLabel.text = [searchData objectAtIndex:rowNo];
	}
	else{
		// 否则使用原始的tableData座位表格显示的数据
		cell.textLabel.text = [tableData objectAtIndex:rowNo];
	}
	return cell;
}
// UISearchBarDelegate定义的方法，用户单击取消按钮时激发该方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	// 取消搜索状态
	isSearch = NO;
}
// UISearchBarDelegate定义的方法，当搜索文本框内文本改变时激发该方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	// 调用filterBySubstring:方法执行搜索
	[self filterBySubstring:searchText];
}
// UISearchBarDelegate定义的方法，用户单击虚拟键盘上Search按键时激发该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	// 调用filterBySubstring:方法执行搜索
	[self filterBySubstring:searchBar.text];
	// 放弃作为第一个响应者，关闭键盘
	[searchBar resignFirstResponder];
}
- (void) filterBySubstring:(NSString*) subStr
{
	// 设置为开始搜索
	isSearch = YES;
	// 定义搜索谓词
	NSPredicate* pred = [NSPredicate predicateWithFormat:
		@"SELF CONTAINS[c] %@" , subStr];
	// 使用谓词过滤NSArray
	searchData = [tableData filteredArrayUsingPredicate:pred];
}
@end