//
//  FKViewController.m
//  GDataXMLWrite
//
//  Created by yeeku on 13-10-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "GDataXMLNode.h"

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)finishEdit:(id)sender
{
	// 放弃作为第一个响应者，即关闭虚拟键盘
	[sender resignFirstResponder];
}
- (IBAction)add:(id)sender
{
	// 获取应用界面上4个文本框内的值
	NSString* bookId = self.idField.text;
	NSString* bookName = self.nameField.text;
	NSString* author = self.authorField.text;
	NSString* remark = self.remarkField.text;
	if(bookId.length > 0 && bookName.length > 0
	   && author.length > 0 && remark.length > 0)
	{
		// 使用NSFileHandle对象根据文件路径获取到文件
		NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:self.xmlPath];
		// 读取文件内容返回NSData对象
		NSData *data = [file readDataToEndOfFile];
		// 定义变量保存将要处理的XML文档对象
		GDataXMLDocument* doc;
		// 定义变量保存XML文档的根元素
		GDataXMLElement* rootEle;
		// 如果data存在，表明该XML文档已经存在
		if(data)
		{
			// 根据NSData对象初始化GDataXMLDocument对象
			doc = [[GDataXMLDocument alloc] initWithData:data
				options:0 error:nil];
			// 获取XML文档的根元素
			rootEle = doc.rootElement;  // ①
		}
		// 如果XML文档还不存在，需要新建XML文档
		else
		{
			// 创建<books.../>元素
			rootEle = [GDataXMLNode elementWithName:@"books"];  // ②
		}
		// 创建<book.../>元素
		GDataXMLElement* bookEle = [GDataXMLNode elementWithName:@"book"];
		// 创建id属性，属性值为bookId
		GDataXMLNode* attr = [GDataXMLNode attributeWithName:@"id"
			stringValue:bookId];
		// 为<book.../>元素添加id属性
		[bookEle addAttribute:attr];
		// 依次创建<title.../>、<author.../>、<remark.../>3个子元素
		GDataXMLElement* titleEle = [GDataXMLNode elementWithName:@"title"
			stringValue:bookName];
		GDataXMLElement* authorEle = [GDataXMLNode elementWithName:@"author"
			stringValue:author];
		GDataXMLElement* remarkEle = [GDataXMLNode elementWithName:@"remark"
			stringValue:remark];
		// 将<title.../>、<author.../>、<remark.../>3个子元素添加到bookEle元素中
		[bookEle addChild:titleEle];
		[bookEle addChild:authorEle];
		[bookEle addChild:remarkEle];
		// 将<book.../>元素添加为XML文档根元素的子元素。
		[rootEle addChild:bookEle];
		// 如果data不存在、即XML文档还不存在，表明需要重新生成GDataXMLDocument对象
		if (!data) {
			// 以指定的根元素创建GDataXMLDocument对象
			doc = [[GDataXMLDocument alloc] initWithRootElement:rootEle];
		}
		// 将GDataXMLDocument转换为NSData后输出到指定文件中
		[doc.XMLData writeToFile:self.xmlPath atomically:YES];  // ③
		self.idField.text = nil;
		self.nameField.text = nil;
		self.authorField.text = nil;
		self.remarkField.text = nil;
		// 创建、并显示提示框
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
			message:@"添加成功！" delegate:nil
			cancelButtonTitle:@"确定" otherButtonTitles:nil];
		[alert show];
	}
	else
	{
		// 创建、并显示提示框
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
			message:@"您必须为所有信息都输入有效的值" delegate:nil
			cancelButtonTitle:@"确定" otherButtonTitles:nil];
		[alert show];
	}
}
// 定义获取XML文档存储路径的方法
- (NSString*) xmlPath
{
	// 获取应用程序沙盒的Documents路径
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
		NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	// 返回XML文档的存储路径
	return [NSString stringWithFormat:@"%@/books.xml" ,documentsDirectory];
}
@end
