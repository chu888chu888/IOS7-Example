//
//  Person.h
//  testArray
//
//  Created by chuguangming on 14-7-16.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindApartment.h"
@interface Person : NSObject
{
    @private
    NSString * strName;
    id <FindApartment>idDelegate;
}
@property(nonatomic,copy) NSString *strName;
@property(nonatomic) id<FindApartment>idDelegate;

-(id)initWithName:(NSString *)name withDelegate:(id<FindApartment>)delegate;
-(void)wantToFindApartment;
@end
