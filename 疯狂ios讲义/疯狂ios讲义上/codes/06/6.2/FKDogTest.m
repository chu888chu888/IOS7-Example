//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKDog.h"
#import "FKItem.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKDog* p = [[FKDog alloc] init];
		NSLog(@"FKUser对象是否isEqual FKItem对象？%d"
			, [p isEqual: [FKItem new]]);
		NSLog(@"FKUser对象是否isEqual NSString对象？%d" 
			, [p isEqual: [NSString stringWithFormat:@"Hello"]]);
	}
}
