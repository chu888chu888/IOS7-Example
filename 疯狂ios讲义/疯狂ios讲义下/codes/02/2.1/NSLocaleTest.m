//  Created by yeeku on 2013-3-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char* argv[]) 
{
	@autoreleasepool {
		// 返回系统所支持的全部国家和语言的集合
		NSArray* locales = [NSLocale availableLocaleIdentifiers];
		// 遍历数组的每个元素，依次获取所支持的所有NSLocale
		for (int i = 0; i < locales.count ; i++ )
		{
			NSString* localeId = [locales objectAtIndex:i];
			NSLog(@"%@" , localeId);
		}
		// 获取系统的当前Locale
		NSLocale* curLocale = [NSLocale currentLocale];
		NSLog(@"当前Locale：%@" , curLocale.localeIdentifier);
//		NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
//		// 在默认值中找到 AppleLanguages, 返回值是一个NSArray集合 
//		NSArray* languages = [defs objectForKey:@"AppleLanguages"];
//		NSLog(@"所有语言包括 %@", languages);
//		//在languages中的第一个项就是用户的首选语言了
//		NSLog(@"首选语言 is %@",[languages objectAtIndex:0]); 		
	}
}
