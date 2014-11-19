//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[]) 
{
	@autoreleasepool {
		
		// 将输出1
		NSLog(@"%d" , 5 & 9);
		// 将输出13
		NSLog(@"%d" , 5 | 9);
			
		// 将输出4
		NSLog(@"%d" , ~-5);
		// 将输出12
		NSLog(@"%d" , 5 ^ 9);
		
		// 输出20
		NSLog(@"%d" ,5 << 2);
		// 输出-20
		NSLog(@"%d" ,-5 << 2);
		
		// 输出-2
		NSLog(@"%d" ,-5 >> 2);
	}
}