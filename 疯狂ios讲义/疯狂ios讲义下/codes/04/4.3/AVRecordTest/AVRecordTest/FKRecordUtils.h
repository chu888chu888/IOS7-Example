//
//  FKUitils.h
//  AVRecordTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface FKRecordUtils : NSObject
// 工具方法，根据给定媒体类型获取对应的AVCaptureConnection
+ (AVCaptureConnection *)connectionWithMediaType:(NSString *)mediaType
	fromConnections:(NSArray *)connections;
@end
