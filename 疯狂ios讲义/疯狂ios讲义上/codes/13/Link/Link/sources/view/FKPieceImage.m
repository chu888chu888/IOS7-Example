//
//  FK.m
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKPieceImage.h"

@implementation FKPieceImage
- (id)initWithImage:(UIImage*)image imageId:(NSString*)imageId
{
	self = [super init];
	if (self) {
		_image = image;
		_imageId = [imageId copy];
	}
	return self;
}
@end
