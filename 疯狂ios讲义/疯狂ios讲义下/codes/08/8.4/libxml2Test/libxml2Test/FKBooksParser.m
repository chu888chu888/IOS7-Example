//
//  FKBooksParser.m
//  libxml2Test
//
//  Created by yeeku on 13-10-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#include <libxml/xmlreader.h>
#import "FKBooksParser.h"
#import "FKBook.h"

@implementation FKBooksParser
// 定义一个FKBook对象，用于保存正在解析的<book>元素中的数据
FKBook* book;
-(void)readXml:(NSString*) xmlName;
{
	NSString* xmlPath = [[NSBundle mainBundle]
		pathForResource:xmlName ofType:@"xml"];
	// 通过XML文件创建xmlTextReaderPtr
    xmlTextReaderPtr reader = xmlNewTextReaderFilename([xmlPath UTF8String]);
	// 如果需要通过内存中的XML文档创建reader，则可按调用xmlReaderForMemory()函数
//	xmlTextReaderPtr reader = xmlReaderForMemory(memory, size, NULL, "UTF-8", 0);
	if(!reader)
	{
		NSLog(@"加载XML文档出现错误！");
	}
	else
	{
		char *temp;
		NSString *elementName = nil;
		NSString *currentElementValue = nil;
		// 采用循环，不断读取文档内容
		while(YES)
		{
			// 如果读取结束，结束循环
			if(!xmlTextReaderRead(reader))
				break;
			// 调用xmlTextReaderNodeType函数获取正在读取的内容的类型, 如果正在读取元素
			if (xmlTextReaderNodeType(reader) == XML_READER_TYPE_ELEMENT)  // ①
			{
				// 调用xmlTextReaderConstName()函数获取元素名
				temp = (char *)xmlTextReaderConstName(reader);
				// 将C风格的字符串转换为Objective-C字符串
				elementName = [NSString stringWithCString:temp
					encoding:NSUTF8StringEncoding];
				if ([elementName isEqualToString:@"books"])
				{
					self.books = [NSMutableArray array];
				}
				else if([elementName isEqualToString:@"book"])
				{
					// 创建FKBook对象
					book = [[FKBook alloc] init];
					// 将book对象添加的books集合中
					[self.books addObject: book];
					// 读取book元素的id属性
					temp = (char *)xmlTextReaderGetAttribute(reader
						, (xmlChar*)"id");
					// 将C风格的字符串转换为Objective-C字符串
					NSString* idValue = [NSString stringWithCString:temp
						encoding:NSUTF8StringEncoding];
					book.bookID = [idValue intValue] ;
				}
				else if([elementName isEqualToString:@"title"]
					|| [elementName isEqualToString:@"author"]
					|| [elementName isEqualToString:@"remark"])
				{
					// 调用xmlTextReaderReadString()函数获取元素中的文本内容
					temp = (char *)xmlTextReaderReadString(reader);
					// 将C风格的字符串转换为Objective-C字符串
					currentElementValue = [NSString stringWithCString:temp
						encoding:NSUTF8StringEncoding];
					// 则使用KVC方式为当前FKBook对象的属性赋值
					[book setValue:currentElementValue forKey:elementName];
					currentElementValue = nil;
				}
			}
		}
	}
	// 关闭资源
	xmlTextReaderClose(reader);
	xmlFreeTextReader(reader);
}
@end
