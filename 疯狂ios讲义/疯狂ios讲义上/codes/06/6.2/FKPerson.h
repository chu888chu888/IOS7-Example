//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

@interface FKPerson : NSObject
@property (nonatomic , copy) NSString* name;
- (id) initWithName: (NSString*) name;
- (void) info;
@end
