//
//  FKBooksParser.m
//  GDataXMLTest
//
//  Created by yeeku on 13-10-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBooksParser.h"
#import "FKBook.h"
#import "GDataXMLNode.h"

@implementation FKBooksParser

- (NSArray*) parseXML:(NSString*) xmlName
{
	// 使用NSBundle对象获取到需要解析的XML文档的路径
	NSString *path = [[NSBundle mainBundle] pathForResource:xmlName
		ofType:@"xml"];
	// 使用NSFileHandle对象根据文件路径获取到文件
	NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:path];
	// 读取文件内容返回NSData对象
	NSData *data = [file readDataToEndOfFile];
	// 根据NSData对象初始化GDataXMLDocument对象
	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
		options:0 error:nil];
	// 如果需要根据XML字符串来初始化GDataXMLDocument对象，则调用如下代码
//	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xmlStr
//		options:0 error:nil];
	// 获取根元素，也就是获取<books.../>元素
	GDataXMLElement *rootElement = [doc rootElement];
	// 获取rootElement下所有<book.../>元素，返回所有<book.../>元素组成的集合
	NSArray *bookElements = [rootElement elementsForName:@"book"];
	// 初始化一个可变数组,用于存储将要获取的所有<book.../>元素的内容
	NSMutableArray *books = [[NSMutableArray alloc] init];
	// 循环遍历每一个<book.../>元素
	for(GDataXMLElement *bookElement in bookElements)
	{
		// 初始化FKBook对象
		FKBook *book = [[FKBook alloc] init];
		// 获取id属性值,并且转成整形
		NSInteger bookID = [[[bookElement attributeForName:@"id"]
			stringValue] integerValue];
		// 获取title,author,remark元素内容
		NSString *title = [[[bookElement elementsForName:@"title"]
			objectAtIndex:0] stringValue];
		NSString *author = [[[bookElement elementsForName:@"author"]
			objectAtIndex:0] stringValue];
		NSString *remark = [[[bookElement elementsForName:@"remark"]
			objectAtIndex:0] stringValue];
		// 将获取的属性值和元素内容存储到FKBook对象的属性中
		book.bookID = bookID;
		book.title = title;
		book.author = author;
		book.remark = remark;
		//将每一个Book对象添加到可变数组
		[books addObject:book];
	}
	//返回books集合的副本
	return [books copy];
}
@end
