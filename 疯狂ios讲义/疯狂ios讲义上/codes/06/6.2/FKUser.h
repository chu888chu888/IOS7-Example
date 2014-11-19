//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKUser : NSObject
@property (nonatomic , copy) NSString* name;
@property (nonatomic , copy) NSString* idStr;
- (id) initWithName: (NSString*) name 
	idStr: (NSString*) idStr;
@end
