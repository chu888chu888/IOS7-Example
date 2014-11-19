//  Created by yeeku on 2013-4-21.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKUser : NSObject
@property (nonatomic , copy) NSString* name;
@property (nonatomic , copy) NSString* pass;
- (id) initWithName:(NSString*) aName
	pass:(NSString*) aPass;
- (void) say:(NSString*) content;
@end
