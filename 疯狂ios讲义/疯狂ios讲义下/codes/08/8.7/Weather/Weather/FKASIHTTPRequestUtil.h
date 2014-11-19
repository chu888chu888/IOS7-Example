//
//  FKASIHTTPRequestUtil.h
//  Weather
//
//  Created by yeeku on 13-10-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKASIHTTPRequestUtil : NSObject
// 发送带参数webService请求,参数: webServiceURL,参数名,参数值
- (NSString*) synchronousRequest:(NSString*) webServiceURL
	paramName:(NSString *) cityName paramValue:(NSString *) cityValue;
// 发送webService请求,无参数
- (NSString*) synchronousRequest:(NSString*) webServiceURL;
@end
