//
//  FKXMLPraser.m
//  NSXMLParserDemo
//
//  Created by 肖 文吉 on 13-3-25.
//  Copyright (c) 2013年 com.fkjava. All rights reserved.
//

#import "FKXMLPraserDelegate.h"
#import "FKBook.h"

@implementation FKXMLPraserDelegate
// 定义一个FKBook对象，用于保存正在解析的<book>元素中的数据
FKBook* book;
NSString* currentElementValue;
// 当开始处理某个元素时触发该方法
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
	namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{
	
	NSLog(@"开始处理元素 %@" , elementName);
	if([elementName isEqualToString:@"books"])
	{
		// 如果正在处理根元素，在此处初始化存储解析结果的NSMutableArray集合
		self.books = [[NSMutableArray alloc] init];
	}
	// 如果正在处理<book.../>元素
	else if([elementName isEqualToString:@"book"])
	{
		// 初始化FKBook对象
		book = [[FKBook alloc] init];
		// 从attributeDict中读取<book.../>元素的属性id的值
		book.bookID = [[attributeDict objectForKey:@"id"] integerValue];
	}
}
// 当开始处理字符串内容时触发该方法
-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	NSLog(@"处理字符串内容：%@",string);
	// 如果当前的字符串值不为nil，保存当前正在处理的元素的值
	if(string)
	{
		currentElementValue = string;
	}

}
// 当处理某个元素结束时触发该方法
-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
	namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	// 如果处理根元素结束，表明XML文档处理完成。
	if([elementName isEqualToString:@"books"])
	{
		return;
	}
	// 如果处理<book.../>元素结束，则将封装的FKBook对象添加到NSMutableArray集合中
	else if([elementName isEqualToString:@"book"])
	{
		[self.books addObject: book];
		book = nil;
	}
	else
	{
		// 如果既不是处理<books.../>元素，也不是处理<book.../>元素的时候,
		// 则使用KVC方式为当前FKBook对象的属性赋值
		[book setValue:currentElementValue forKey:elementName];
		currentElementValue = nil;
	}
}
@end
