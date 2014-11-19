//  Created by yeeku on 2013-4-20.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>

int main(int argc , char * argv[])
{
	@autoreleasepool{
		// 获取代表公历的Calendar对象
		NSCalendar *gregorian = [[NSCalendar alloc]
    		initWithCalendarIdentifier:NSGregorianCalendar];
		// 获取当前日期 
		NSDate* dt = [NSDate date];
		// 定义一个时间字段的旗标，指定将会获取指定年、月、日、时、分、秒的信息
		unsigned unitFlags = NSYearCalendarUnit | 
			NSMonthCalendarUnit |  NSDayCalendarUnit |
			NSHourCalendarUnit |  NSMinuteCalendarUnit |
			NSSecondCalendarUnit | NSWeekdayCalendarUnit;
		// 获取不同时间字段的信息
		NSDateComponents* comp = [gregorian components: unitFlags 
			fromDate:dt];
		// 获取各时间字段的数值
		NSLog(@"现在是%ld年" , comp.year);
		NSLog(@"现在是%ld月 " , comp.month);
		NSLog(@"现在是%ld日" , comp.day);
		NSLog(@"现在是%ld时" , comp.hour);
		NSLog(@"现在是%ld分" , comp.minute);
		NSLog(@"现在是%ld秒" , comp.second);
		NSLog(@"现在是星期%ld" , comp.weekday);
		// 再次创建一个NSDateComponents对象
		NSDateComponents* comp2 = [[NSDateComponents alloc] 
			init];
		// 设置各时间字段的数值
		comp2.year = 2013;
		comp2.month = 4;
		comp2.day = 5;
		comp2.hour = 18;
		comp2.minute = 34;
		// 通过NSDateComponents所包含的时间字段的数值来恢复NSDate对象
		NSDate *date = [gregorian dateFromComponents:comp2];
		NSLog(@"获取的日期为：%@" , date);
	}
}