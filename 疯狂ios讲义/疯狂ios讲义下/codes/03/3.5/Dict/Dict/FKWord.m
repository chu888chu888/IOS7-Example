//
//  FKWord.m
//  Dict
//
//  Created by yeeku on 13-8-27.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKWord.h"

@implementation FKWord
-(id) initWithId:(NSInteger)word_id word:(NSString*)word
	detail:(NSString*)detail
{
    self = [super init];
    if (self) {
        _word_id = word_id;
		_word = word;
		_detail = detail;
    }
    return self;
}
@end
