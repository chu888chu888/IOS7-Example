//
//  FKBooksParser.h
//  libxml2Test
//
//  Created by yeeku on 13-10-1.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKBooksParser : NSObject
// 定义一个NSMutableArray集合来保存解析XML文档得到的数据
@property (nonatomic, strong) NSMutableArray *books;
-(void)readXml:(NSString*) xmlName;
@end
