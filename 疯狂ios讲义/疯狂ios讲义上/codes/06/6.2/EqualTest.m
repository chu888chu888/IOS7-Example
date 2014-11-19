//  Created by yeeku on 2013-4-15.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#import "FKPerson.h"

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int it = 65;
		float fl = 65.0f;
		// 将输出1代表真
		NSLog(@"65和65.0f是否相等？: %d" , (it == fl));
		char ch = 'A';
		// 将输出1代表真
		NSLog(@"65和'A'是否相等？%d" , (it == ch));
		NSString* str1 = [NSString stringWithFormat:@"hello"];
		NSString* str2 = [NSString stringWithFormat:@"hello"];
		// 将输出0代表假
		NSLog(@"str1和str2是否相等？%d"
			 , (str1 == str2));
		// 将输出1代表真
		NSLog(@"str1是否isEqual str2？%d"
			, [str1 isEqual:str2]);
		// 由于NSDate与NSString类没有继承关系，
		// 所以下面语句导致编译警告
		NSLog(@"%d" , [NSDate new] == [NSString new]);
	}
}
