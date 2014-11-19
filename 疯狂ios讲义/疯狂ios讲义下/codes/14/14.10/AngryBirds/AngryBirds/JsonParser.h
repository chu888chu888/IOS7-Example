//
//  JsonParser.h
//  AngryBirds
//
//

#import <Foundation/Foundation.h>
// SpriteData用来装载读取JSON获取的数据
@interface SpriteData : NSObject {
	int _tag;
	float _x;
	float _y;
	float _angle;
}
@property (nonatomic, assign) int tag;
@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) float angle;
@end
@interface JsonParser : NSObject
// 解析JSON文件获取所需的精灵数据
+ (id) getAllSpriteWithFile:(NSString *)file;
@end
