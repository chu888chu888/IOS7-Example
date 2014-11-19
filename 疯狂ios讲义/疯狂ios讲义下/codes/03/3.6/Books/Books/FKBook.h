//
//  FKBook.h
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FKAuthor;

@interface FKBook : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * publishHouse;
@property (nonatomic, retain) FKAuthor *author;

@end
