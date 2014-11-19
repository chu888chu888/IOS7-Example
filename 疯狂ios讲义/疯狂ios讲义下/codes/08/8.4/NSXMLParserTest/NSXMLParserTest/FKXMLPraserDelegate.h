//
//  FKXMLPraser.h
//  NSXMLParserDemo
//
//  Created by 肖 文吉 on 13-3-25.
//  Copyright (c) 2013年 com.fkjava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKXMLPraserDelegate : NSObject <NSXMLParserDelegate>
// 定义一个NSMutableArray集合来保存解析XML文档得到的数据
@property (nonatomic, strong) NSMutableArray *books;
@end
