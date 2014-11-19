//  Created by yeeku on 2013-4-6.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKUser.h"

static NSString* nation = nil;
@implementation FKUser
+ (NSString*) nation
{
	// 返回nation全局变量
	return nation;
}
+ (void) setNation: (NSString*) newNation
{
	// 对nation全局变量赋值
	if(![nation isEqualToString: newNation])
	{
		nation = newNation;
	}
}
@end

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		// 为FKUser的类变量赋值
		[FKUser setNation:@"中国"];
		// 访问FKUser的类变量
		NSLog(@"FKUser的nation类变量为：%@"
		 	, [FKUser nation]); 	
	}
}
