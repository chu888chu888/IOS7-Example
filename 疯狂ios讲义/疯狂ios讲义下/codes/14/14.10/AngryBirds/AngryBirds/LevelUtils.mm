//
//  GameUtils.m
//  AngryBirds
//
//

#import "LevelUtils.h"

@implementation LevelUtils

+ (NSString *) getLevelFilePath {
	// 获取存放通关关卡的文件路径，该文件存在沙盒 Documents/SuccessLevel
	return [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
		stringByAppendingPathComponent:@"SuccessLevel"];
}
// 读取关卡文件
+ (int) readLevelFromFile {
	 // 获取存放数据文件路径
	NSString *file = [[self class] getLevelFilePath];
	// 读取文件
	NSString *level = [NSString stringWithContentsOfFile:file
		encoding:NSUTF8StringEncoding error:nil];
	if (level) {
		return [level intValue];
	}
	// 缺省为第1关
	return 1;
}

// 记录过关文件
+ (void) writeLevelToFile:(int)level {
	// 把level转化成一个字符串
	NSString *levelString = [NSString stringWithFormat:@"%d", level];
	// 取得要存放的文件
	NSString *file = [[self class] getLevelFilePath];
	// 重新写入关卡
	[levelString writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
