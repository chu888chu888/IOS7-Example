//
//  JsonParser.mm
//  AngryBirds
//
//

#import "JsonParser.h"

@implementation SpriteData

@synthesize tag=_tag, x=_x, y=_y, angle=_angle;

@end

@implementation JsonParser

+ (id) getAllSpriteWithFile:(NSString *)file {
	// 将JSON文件内容读取到字符串
	NSString *path = [NSString stringWithContentsOfFile:file 
		encoding:NSUTF8StringEncoding error:nil];
	// 将字符串写到缓冲区。
	NSData* jsonData = [path dataUsingEncoding:NSUTF8StringEncoding];
	// 使用苹果官方提供的JSON库：NSJSONSerialization解析JSON数据，返回NSDictionary对象。
	NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData 
		options:NSJSONReadingMutableLeaves error:nil];
	// 读取NSDictionary，通过key获取value，
	NSDictionary* spritesResult =[dic objectForKey:@"sprites"];
	// 获取sprites下面的sprite数组
	NSArray* array = [spritesResult objectForKey:@"sprite"];
	// 定义一个NSMutableArray用于装在获得的SpriteData数据对象
	NSMutableArray *spriteArray = [NSMutableArray array];
	// 循环遍历sprite的内容，将其中的数据存储到SpriteData数据对象返回
	for (NSDictionary *dict in array) {
		// 创建SpriteData对象存储JSON信息
		SpriteData *sd = [[SpriteData alloc] init];
		sd.tag = [[dict objectForKey:@"tag"] intValue];
		sd.x = [[dict objectForKey:@"x"] floatValue];
		sd.y = [[dict objectForKey:@"y"] floatValue];
		sd.angle = [[dict objectForKey:@"angle"] floatValue];
		// 将SpriteData添加到NSMutableArray数组
		[spriteArray addObject:sd];
	}
	return spriteArray;
}

@end
