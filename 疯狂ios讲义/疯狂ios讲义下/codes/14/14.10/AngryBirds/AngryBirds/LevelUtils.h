//
//  GameUtils.h
//  AngryBirds
//
//

#import <Foundation/Foundation.h>

@interface LevelUtils : NSObject

// 读取关卡文件
+ (int) readLevelFromFile;
// 记录过关文件
+ (void) writeLevelToFile:(int)level;

@end
