//
//  FKWord.h
//  Dict
//
//  Created by yeeku on 13-8-27.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKWord : NSObject
@property (nonatomic, assign) NSInteger word_id;
@property (nonatomic, copy) NSString* word;
@property (nonatomic, copy) NSString* detail;
-(id) initWithId:(NSInteger)word_id word:(NSString*)word
	detail:(NSString*)detail;
@end
