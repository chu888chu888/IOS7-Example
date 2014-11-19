//
//  FKAuthor.h
//  Books
//
//  Created by yeeku on 13-8-30.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FKBook;

@interface FKAuthor : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * authorDesc;
@property (nonatomic, retain) NSSet *books;
@end

@interface FKAuthor (CoreDataGeneratedAccessors)

- (void)addBooksObject:(FKBook *)value;
- (void)removeBooksObject:(FKBook *)value;
- (void)addBooks:(NSSet *)values;
- (void)removeBooks:(NSSet *)values;

@end
