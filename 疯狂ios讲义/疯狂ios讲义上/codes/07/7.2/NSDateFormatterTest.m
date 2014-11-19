//  Created by yeeku on 2013-4-20.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 需要被格式化的时间
		// 获取从1970年1月1日开始，20年之后的日期	
		NSDate* dt = [NSDate dateWithTimeIntervalSince1970:
			3600 * 24 * 366 * 20];
		// 创建两个NSLocale，分别代表中国、美国
		NSLocale* locales[] = {
			[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]
			, [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]};
		NSDateFormatter* df[8];
		//为上面2个NSLocale创建8个DateFormat对象
		for (int i = 0 ; i < 2 ; i++)
		{
			df[i * 4] = [[NSDateFormatter alloc] init];
			// 设置NSDateFormatter的日期、时间风格
			[df[i * 4] setDateStyle:NSDateFormatterShortStyle];
			[df[i * 4] setTimeStyle:NSDateFormatterShortStyle];
			// 设置NSDateFormatter的NSLocale
			[df[i * 4] setLocale: locales[i]];
			df[i * 4 + 1] = [[NSDateFormatter alloc] init];	
			// 设置NSDateFormatter的日期、时间风格			
			[df[i * 4 + 1] setDateStyle:NSDateFormatterMediumStyle];
			[df[i * 4 + 1] setDateStyle:NSDateFormatterMediumStyle];
			// 设置NSDateFormatter的NSLocale
			[df[i * 4 + 1] setLocale: locales[i]];
			df[i * 4 + 2] = [[NSDateFormatter alloc] init];	
			// 设置NSDateFormatter的日期、时间风格			
			[df[i * 4 + 2] setDateStyle:NSDateFormatterLongStyle];
			[df[i * 4 + 2] setTimeStyle:NSDateFormatterLongStyle];
			// 设置NSDateFormatter的NSLocale
			[df[i * 4 + 2] setLocale: locales[i]];
			df[i * 4 + 3] = [[NSDateFormatter alloc] init];	
			// 设置NSDateFormatter的日期、时间风格			
			[df[i * 4 + 3] setDateStyle:NSDateFormatterFullStyle];
			[df[i * 4 + 3] setTimeStyle:NSDateFormatterFullStyle];
			// 设置NSDateFormatter的NSLocale
			[df[i * 4 + 3] setLocale: locales[i]];
		}
		for (int i = 0 ; i < 2 ; i++)
		{
			switch (i)
			{
				case 0:
					NSLog(@"-------中国日期格式--------");
					break;
				case 1:
					NSLog(@"-------美国日期格式--------");
					break;
			}
			NSLog(@"SHORT格式的日期格式：%@"
				, [df[i * 4] stringFromDate: dt]);
			NSLog(@"MEDIUM格式的日期格式：%@"
				, [df[i * 4 + 1] stringFromDate: dt]);
			NSLog(@"LONG格式的日期格式：%@"
				, [df[i * 4 + 2] stringFromDate: dt]);
			NSLog(@"FULL格式的日期格式：%@"
				, [df[i * 4 + 3] stringFromDate: dt]);
		}
		NSDateFormatter* df2 = [[NSDateFormatter alloc] init];
		// 设置自定义的格式器模板
		[df2 setDateFormat:@"公元yyyy年MM月DD日 HH时mm分"];
		// 执行格式化
		NSLog(@"%@" , [df2 stringFromDate:dt]);
		NSString* dateStr = @"2013-03-02";
		NSDateFormatter* df3 = [[NSDateFormatter alloc] init];
		// 根据日期字符串的格式设置格式模板	
		[df3 setDateFormat:@"yyyy-MM-dd"];
		// 将字符串转换为NSDate对象
		NSDate* date2 = [df3 dateFromString: dateStr];
		NSLog(@"%@" , date2);	
	}
}