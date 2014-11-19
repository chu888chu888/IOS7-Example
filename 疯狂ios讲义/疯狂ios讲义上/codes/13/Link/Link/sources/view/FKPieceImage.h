//
//  FKPieceImage.h
//  Link
//
//  Created by yeeku on 13-7-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKPieceImage : NSObject
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, copy) NSString* imageId;
- (id)initWithImage:(UIImage*)image imageId:(NSString*)imageId;
@end
