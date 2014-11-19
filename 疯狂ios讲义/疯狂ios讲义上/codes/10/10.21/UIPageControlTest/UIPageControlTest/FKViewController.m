//
//  FKViewController.m
//  UIPageControlTest
//
//  Created by yeeku on 13-6-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKPageController.h"

@interface FKViewController ()
@end

@implementation FKViewController
UIScrollView* scrollView;
NSMutableArray *viewControllers;
UIPageControl* pageControl;
NSArray* contentList;
NSArray* coverList;
- (void)viewDidLoad
{
	[super viewDidLoad];
	contentList = [NSArray arrayWithObjects:@"疯狂Android讲义",
		@"疯狂Ajax讲义",
		@"疯狂XML讲义",
		@"疯狂HTML5/CSS3/JavaScript讲义" , nil];
	coverList = [NSArray arrayWithObjects:@"android.png",
		@"ajax.png",
		@"xml.png",
		@"html.png" , nil];
	NSUInteger numberPages = contentList.count;
	// 程序将会采用延迟加载的方式来创建FKPageController控制器
	// 因此此处只向数组中添加一些null作为占位符，
	// 等到程序需要时才真正创建FKPageController
	viewControllers = [[NSMutableArray alloc] init];
	for (NSUInteger i = 0; i < numberPages; i++)
	{
		[viewControllers addObject:[NSNull null]];
	}
	// 创建UIScrollPane对象
	scrollView = [[UIScrollView alloc]
		initWithFrame:[[UIScreen mainScreen] bounds]];
	// 设置背景色
	scrollView.backgroundColor = [UIColor grayColor];
	scrollView.pagingEnabled = YES;
	// 设置UIScrollPane的contentSize——就是它可滚动区域的大小
	scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame)
		* numberPages, CGRectGetHeight(scrollView.frame));
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.scrollsToTop = NO;
	// 设置该控制作为UIScrollView的委托对象
	scrollView.delegate = self;
	[self.view addSubview:scrollView];
	// 创建UIPageControl控件
	pageControl = [[UIPageControl alloc] init];
	// 设置UIPageControl的大小和位置
	pageControl.frame = CGRectMake(0
		, CGRectGetHeight(scrollView.frame) - 80
		, CGRectGetWidth(scrollView.frame), 80);
	// 设置UIPageControl的圆点的颜色
	pageControl.pageIndicatorTintColor = [UIColor grayColor];
	// 设置UIPageControl的高亮圆点的颜色
	pageControl.currentPageIndicatorTintColor = [UIColor redColor];
	// 设置UIPageControl控件当前显示第几页
	pageControl.currentPage = 0;
	// 设置UIPageControl控件总共包含多少页
	pageControl.numberOfPages = numberPages;
	pageControl.hidesForSinglePage = YES;
	// 为pageControl的Value Changed事件绑定事件处理方法
	[pageControl addTarget:self action:@selector(changePage:)
		forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:pageControl];
	// 初始化时默认只需加载、显示第一页的View。
	[self loadScrollViewWithPage:0];
	// 为了避免“翻页”时才加载下一页导致删除，同时把下一页的View也加载出来
	[self loadScrollViewWithPage:1];
}
// 自定义方法，用于加载UIScrollPage的指定页对应的控制器
- (void) loadScrollViewWithPage:(NSUInteger)page
{
	// 如果超出总页数，方法直接返回
	if (page >= contentList.count)
		return;
	// 获取page索引处的控制器
	FKPageController *controller = [viewControllers objectAtIndex:page];
	// 如果page索引处的控制器还没有初始化
	if ((NSNull *)controller == [NSNull null])
	{
		// 创建FKPageController对象
		controller = [[FKPageController alloc] initWithPageNumber:page];
		// 用FKPageController对象替换page索引处原来的对象
		[viewControllers replaceObjectAtIndex:page withObject:controller];
	}
	// 将controller控制器对应View添加到UIScrollView中
	if (controller.view.superview == nil)
	{
		CGRect frame = scrollView.frame;
		frame.origin.x = CGRectGetWidth(frame) * page;
		frame.origin.y = 0;
		// 设置该控制器对应的View的大小和位置
		controller.view.frame = frame;
		// 设置controller控制器的bookLabel控件的文本
		controller.bookLabel.text = [contentList objectAtIndex:page];
		controller.bookImage.image = [UIImage imageNamed:[coverList objectAtIndex:page]];
		// 将controller控制器添加为当前控制器的子控制器。
		[self addChildViewController:controller];
		// 将controller控制器对应的View添加到UIScrollView中
		[scrollView addSubview:controller.view];
	}
}
// 来自UIScrollViewDelegate的方法，当用户滚动UIScrollView后激发该方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	// 获取UIScrollView控件的宽度，也就是页面的宽度
	CGFloat pageWidth = CGRectGetWidth(scrollView.frame);
	// 用UIScrollView水平滚动的距离减去页面宽度的一半，除以页面宽度的结果再加1，
	// 即可得到当前处于第几页
	NSUInteger page = floor((scrollView.contentOffset.x
		- pageWidth / 2) / pageWidth) + 1;
	// 控制UIPageControl显示当前处于第page页
	pageControl.currentPage = page;
	// 为了避免“翻页”时才加载上一页、下一页导致闪烁，
	// 因此加载当前页的View时，也把上一页、下一页的View也加载出来
	[self loadScrollViewWithPage:page - 1];
	[self loadScrollViewWithPage:page];
	[self loadScrollViewWithPage:page + 1];
}
// 事件监听方法，当用户更改UIPageControl的选中页时激发该方法
- (void) changePage:(id)sender
{
	NSInteger page = [sender currentPage];
	// 创建一个CGRect对象，该CGRect区域代表了该UIScrollView将要显示的页
	CGRect bounds = scrollView.bounds;
	bounds.origin.x = CGRectGetWidth(bounds) * page;
	bounds.origin.y = 0;
	// 控制UIScrollView滚动到指定区域
	[scrollView scrollRectToVisible:bounds animated:YES];
	// 为了避免“翻页”时才加载上一页、下一页导致闪烁，
	// 因此加载当前页的View时，也把上一页、下一页的View也加载出来
	[self loadScrollViewWithPage:page - 1];
	[self loadScrollViewWithPage:page];
	[self loadScrollViewWithPage:page + 1];
}
@end
