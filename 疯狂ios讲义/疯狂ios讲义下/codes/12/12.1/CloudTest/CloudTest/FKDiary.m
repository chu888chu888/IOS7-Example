//
//  BIDDiary.m
//  PushTest
//
//  Created by yeeku on 13-11-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDiary.h"
@implementation FKDiary
// 保存该对象时自动调用该方法
- (id)contentsForType:(NSString *)typeName error:
	(NSError *__autoreleasing *)outError
{
	NSLog(@"保存文件到URL %@！", self.fileURL);
	if (self.diaryData == nil)
	{
		return [[NSData alloc] init];
	}
	// 将diaryData作为返回值，程序将会把该返回值保存到云端
	return [self.diaryData copy];
}
// 读取该对象时自动调用该方法
- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName
	error:(NSError *__autoreleasing *)outError
{
	NSLog(@"从云端下载的数据为：%@" , contents);
	// 将从云端下载得到的数据赋给diaryData数据
	self.diaryData = [contents mutableCopy];
	return true;
}
@end
