//
//  FKViewController.m
//  UICollectionViewTest
//
//  Created by yeeku on 13-6-22.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"
#import "FKDetailViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
NSDictionary* books;  // 定义保存所有图书信息的NSDictionary对象
NSArray* authors;  // 定义保存所有作者的NSArray对象
NSDictionary* covers;  // 定义所有图书封面的NSDictionary对象
NSDictionary* headers;  // 定义所有作者头像的NSDictionary对象
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 设置导航条的标题
	self.navigationItem.title = @"图书列表";
	// 创建、并初始化NSArray对象。
	books = [NSDictionary dictionaryWithObjectsAndKeys:
		[NSArray arrayWithObjects:@"疯狂Ajax讲义",
		@"疯狂Android讲义",
		@"疯狂HTML5/CSS3/JavaScript讲义" ,
		@"疯狂Java讲义",
		@"疯狂Java程序员基本修养",
		@"轻量级Java EE企业应用实战",
		@"经典Java EE企业应用实战",
		@"疯狂XML讲义",  nil] , @"李刚",
		[NSArray arrayWithObjects: @"醒世恒言",
		@"喻世明言", @"警世通言" , nil] ,
		@"冯梦龙", nil];
	// authors保存books的所有key
	authors = [[books allKeys]
		sortedArrayUsingSelector:@selector(compare:)];
	// 为所有作者保存头像
	headers = [NSDictionary dictionaryWithObjectsAndKeys:
		@"lee.jpg" , @"李刚",
		@"feng.png" , @"冯梦龙" ,nil];
	// 创建、并初始化NSArray对象。
	covers = [NSDictionary dictionaryWithObjectsAndKeys:
		@"ajax.png", @"疯狂Ajax讲义",
		@"android.png", @"疯狂Android讲义",
		@"html.png" ,@"疯狂HTML5/CSS3/JavaScript讲义" ,
		@"java.png", @"疯狂Java讲义",
		@"java2.png", @"疯狂Java程序员基本修养",
		@"javaee.png", @"轻量级Java EE企业应用实战",
		@"javaee2.png", @"经典Java EE企业应用实战",
		@"xml.png",@"疯狂XML讲义",
		@"hengyan.jpg", @"醒世恒言" ,
		@"mingyan.jpeg",@"喻世明言",
		@"tongyan.jpeg",@"警世通言", nil];
	// 为UICollectionView设置dataSource和delegate对象
	self.grid.dataSource = self;
	self.grid.delegate = self;
	// 创建UICollectionViewFlowLayout布局对象
	UICollectionViewFlowLayout *flowLayout =
		[[UICollectionViewFlowLayout alloc] init];
	// 设置单元格控件的大小
	flowLayout.itemSize = CGSizeMake(160, 200);
	// 设置UICollectionView的滚动方向
	flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	flowLayout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 0);
	flowLayout.headerReferenceSize = CGSizeMake(80, 80);
	flowLayout.footerReferenceSize = CGSizeMake(50, 240);
	// 为UICollectionView设置布局管理器具
	self.grid.collectionViewLayout = flowLayout;
}
// 该方法的返回值控制该UICollectionView包含多少个分区。
- (NSInteger) numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
	return authors.count;
}
// 该方法的返回值控制该UICollectionView指定分区包含多少个单元格
- (NSInteger)collectionView:(UICollectionView *)collectionView
	 numberOfItemsInSection:(NSInteger)section
{
	// 获取该分区对应的作者
	NSString* author = [authors objectAtIndex:section];
	// 返回该作者对应的图书的数量
	return [[books objectForKey:author] count];
}
// 该方法的返回值将作为指定分区的页眉控件和页脚控件
- (UICollectionReusableView *)collectionView:(UICollectionView *)
collectionView viewForSupplementaryElementOfKind:(NSString *)
kind atIndexPath:(NSIndexPath *)indexPath
{
	// 为表格行定义一个静态字符串作为标示符
	static NSString* headerId = @"headerId";  // ①
	static NSString* supplyId = @"supplyId";  // ②
	NSInteger sectionNo = indexPath.section;
	NSString* author = [authors objectAtIndex:sectionNo];
	UICollectionReusableView* view;
	// 如果正在处理页眉控件
	if (kind == UICollectionElementKindSectionHeader)
	{
		// 从可重用队列中取出一个UICollectionReusableView
		view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
			withReuseIdentifier:headerId forIndexPath:indexPath];
		// 取出页眉控件中Tag为1的UIImageView控件
		UIImageView* iv = (UIImageView*)[view viewWithTag:1];
		// 为页眉控件中的图片控件设置图片
		iv.image = [UIImage imageNamed:[headers objectForKey:author]];
	}
	// 如果正在处理页脚控件
	if (kind == UICollectionElementKindSectionFooter)
	{
		// 从可重用队列中取出一个UICollectionReusableView
		view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
			withReuseIdentifier:supplyId forIndexPath:indexPath];
		// 取出页脚控件中Tag为1的UILabel控件
		UILabel* label = (UILabel*)[view viewWithTag:1];
		// 为页脚控件中的UILabel设置文本
		label.text = [NSString stringWithFormat:@"%@一共有[%d]本图书" , author ,
			[[books objectForKey:author] count]];
	}
	return view;
}

// 该方法返回值决定各单元格的控件。
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
	cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// 为表格行定义一个静态字符串作为标示符
	static NSString* cellId = @"bookCell";
	// 从可重用单元格队列中取出一个单元格
	UICollectionViewCell* cell = [collectionView
		dequeueReusableCellWithReuseIdentifier:cellId
		forIndexPath:indexPath];
	// 设置圆角
	cell.layer.cornerRadius = 8;
	cell.layer.masksToBounds = YES;
	// 获取正在处理的单元格所在分区号、行号
	NSInteger rowNo = indexPath.row;
	NSInteger sectionNo = indexPath.section;
	// 获取该分区对应的作者
	NSString* author = [authors objectAtIndex:sectionNo];
	// 获取指定作者对应的、指定行号的图书
	NSString* book = [[books objectForKey:author]
					  objectAtIndex:rowNo];
	// 通过tag属性获取单元格内的UIImageView控件
	UIImageView* iv = (UIImageView*)[cell viewWithTag:1];
	// 为单元格内的图片控件设置图片
	iv.image = [UIImage imageNamed:
		[covers objectForKey:book]];
	// 通过tag属性获取单元格内的UILabel控件
	UILabel* label = (UILabel*)[cell viewWithTag:2];
	// 为单元格内的UILabel控件设置文本
	label.text = book;
	return cell;
}
// 当用户单击单元格跳转到下一个视图控制器时激发该方法。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 获取激发该跳转的单元格
	UICollectionViewCell* cell = (UICollectionViewCell*)sender;
	// 获取该单元格所在的NSIndexPath
	NSIndexPath* indexPath = [self.grid indexPathForCell:cell];
	// 获取正在处理的单元格所在分区号、行号
	NSInteger rowNo = indexPath.row;
	NSInteger sectionNo = indexPath.section;
	// 获取跳转的目标视图控制器：FKDetailViewController控制器
	FKDetailViewController *detailController = segue.destinationViewController;
	// 获取该分区对应的作者
	NSString* author = [authors objectAtIndex:sectionNo];
	// 获取指定作者对应的、指定行号的图书
	NSString* book = [[books objectForKey:author]
		objectAtIndex:rowNo];
	// 将选中单元格内的数据传给FKDetailViewController控制器对象
	detailController.imageName = [covers objectForKey:book];
	detailController.bookName = book;
}
@end