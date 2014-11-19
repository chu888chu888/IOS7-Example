//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKUser.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		FKUser* p1 = [[FKUser alloc] initWithName:@"孙悟空" 
			idStr: @"12343433433"];
		FKUser* p2 = [[FKUser alloc] initWithName:@"孙行者" 
			idStr: @"12343433433"];
		FKUser* p3 = [[FKUser alloc] initWithName:@"孙悟饭" 
			idStr: @"99933433"];
		//p1和p2的idStr相等，所以输出代表真的1
		NSLog(@"p1和p2是否相等？%d" 
			, [p1 isEqual: p2]);	
		//p2和p3的idStr不相等，所以输出代表假的0
		NSLog(@"p2和p3是否相等？%d"
			, [p2 isEqual: p3]);
	}
}
