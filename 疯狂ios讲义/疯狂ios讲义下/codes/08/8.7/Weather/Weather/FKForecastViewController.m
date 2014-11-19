//
//  FKForecastViewController.m
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKForecastViewController.h"
#import "GDataXMLNode.h"
@interface FKForecastViewController ()

@end

@implementation FKForecastViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 根据responseString获取一个XML Document
	GDataXMLDocument *doc = [[GDataXMLDocument alloc]
		initWithXMLString:self.weatherString options:1 error:nil];
	// 获取根节点对象
	GDataXMLElement *rootElement = [doc rootElement];
	// 获取<string.../>子元素，返回NSArray对象
	NSArray *dataElements = [rootElement elementsForName:@"string"];
	self.title = [NSString stringWithFormat:@"%@天气" ,
		[[dataElements objectAtIndex:1] stringValue]];
	// ------下面代码就是根据不同的<string.../>元素的值来设置界面上UILabel的值------
	// 将索引为6的<string.../>元素的字符串内容按空格分成2个部分
	NSArray* tomorrows = [[[dataElements objectAtIndex:6] stringValue] componentsSeparatedByString:@" "];
	((UILabel*)self.labels[0]).text = [NSString stringWithFormat:@"日期：%@",
		tomorrows[0]];
	((UILabel*)self.labels[1]).text = [NSString stringWithFormat:@"天气：%@",
		tomorrows[1]];
	((UILabel*)self.labels[2]).text = [NSString stringWithFormat:@"气温：%@",
		[[dataElements objectAtIndex:5] stringValue]];
	((UILabel*)self.labels[3]).text = [NSString stringWithFormat:@"风力：%@",
		[[dataElements objectAtIndex:7] stringValue]];
	// 将索引为13的<string.../>元素的字符串内容按空格分成2个部分
	NSArray* twoDays = [[[dataElements objectAtIndex:13] stringValue] componentsSeparatedByString:@" "];
	((UILabel*)self.labels[4]).text = [NSString stringWithFormat:@"日期：%@",
		twoDays[0]];
	((UILabel*)self.labels[5]).text = [NSString stringWithFormat:@"天气：%@",
		twoDays[1]];
	((UILabel*)self.labels[6]).text = [NSString stringWithFormat:@"气温：%@",
		[[dataElements objectAtIndex:12] stringValue]];
	((UILabel*)self.labels[7]).text = [NSString stringWithFormat:@"风力：%@",
		[[dataElements objectAtIndex:14] stringValue]];
	// 将索引为18的<string.../>元素的字符串内容按空格分成2个部分
	NSArray* threeDays = [[[dataElements objectAtIndex:18] stringValue] componentsSeparatedByString:@" "];
	((UILabel*)self.labels[8]).text = [NSString stringWithFormat:@"日期：%@",
		threeDays[0]];
	((UILabel*)self.labels[9]).text = [NSString stringWithFormat:@"天气：%@",
		threeDays[1]];
	((UILabel*)self.labels[10]).text = [NSString stringWithFormat:@"气温：%@",
		[[dataElements objectAtIndex:17] stringValue]];
	((UILabel*)self.labels[11]).text = [NSString stringWithFormat:@"风力：%@",
		[[dataElements objectAtIndex:19] stringValue]];
	((UILabel*)self.labels[12]).text = [[dataElements objectAtIndex:10] stringValue];
	// ----下面代码就是根据不同的<string.../>元素的值来设置界面上UIImageView的图片----
	((UIImageView*)self.icons[0]).image = [UIImage imageNamed:
		[NSString stringWithFormat:@"a_%@" ,
		[[dataElements objectAtIndex:8] stringValue]]];
	((UIImageView*)self.icons[1]).image = [UIImage imageNamed:
		[NSString stringWithFormat:@"a_%@" ,
		[[dataElements objectAtIndex:9] stringValue]]];
	((UIImageView*)self.icons[2]).image = [UIImage imageNamed:
		[NSString stringWithFormat:@"a_%@" ,
		[[dataElements objectAtIndex:15] stringValue]]];
	((UIImageView*)self.icons[3]).image = [UIImage imageNamed:
		[NSString stringWithFormat:@"a_%@" ,
		[[dataElements objectAtIndex:16] stringValue]]];
	((UIImageView*)self.icons[4]).image = [UIImage imageNamed:
		[NSString stringWithFormat:@"a_%@" ,
		[[dataElements objectAtIndex:20] stringValue]]];
	((UIImageView*)self.icons[5]).image = [UIImage imageNamed:
		[NSString stringWithFormat:@"a_%@" ,
		[[dataElements objectAtIndex:21] stringValue]]];
}
@end
