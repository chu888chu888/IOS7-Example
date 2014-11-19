//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		char* str = "I love iOS";
		NSLog(@"%s" , str);
		// 让str指向第7个元素
		str += 7;
		NSLog(@"%s" , str);
	}
}
