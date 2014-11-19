//
//  CCParallaxNode-Extras.m
//  Test1
//
//  Created by Jason on 13-9-20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CCParallaxNode-Extras.h"


@implementation CCParallaxNode(Extras)
@class CGPointObject;

//1. 遍历parallaxArray指针所指结构体的arr成员（这是一个数组）
//2. 如果arr[i]的child 等于被搜索点node
//3. 将point的offset设置为 point原有的offset加上传入的offset参数。
-(void) incrementOffset:(CGPoint)offset forChild:(CCNode*)node
{
	for( unsigned int i=0;i < self.parallaxArray->num;i++) {
		CGPointObject *point = self.parallaxArray->arr[i];
		if( [[point performSelector:@selector(child)] isEqual:node] ) {
			[point setOffset:ccpAdd([point offset], offset)];
			break;
		}
	}
    
    
}

-(void) incrementOffset:(CGPoint)offset atIndex:(int)index{
    CGPointObject *point = self.parallaxArray->arr[index];
    [point setOffset:ccpAdd([point offset], offset)];
}

-(void) setParallaxNode:(CCNode *)node atPos:(CGPoint)pt{
    for( unsigned int i=0;i < self.parallaxArray->num;i++) {
		CGPointObject *point = self.parallaxArray->arr[i];
		if( [[point performSelector:@selector(child)] isEqual:node] ) {
			[point setOffset:pt];
			break;
		}
	}
}


@end

