//
//  Book.h
//  NSXMLParserDemo
//
//  Created by 肖 文吉 on 13-3-25.
//  Copyright (c) 2013年 com.fkjava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKBook : NSObject
@property (nonatomic , assign) NSInteger bookID;
@property (nonatomic , copy) NSString *title;
@property (nonatomic , copy) NSString *author;
@property (nonatomic , copy) NSString *remark;
@end
