//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKFruit.h"

@implementation FKFruit
@synthesize weight;
- (void) info
{
	NSLog(@"我是一个水果！重%gg！" , weight);	
}
@end