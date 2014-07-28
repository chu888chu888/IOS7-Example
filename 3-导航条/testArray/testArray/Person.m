//
//  Person.m
//  testArray
//
//  Created by chuguangming on 14-7-16.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "Person.h"
@interface Person()
-(void)startFindApartment:(NSTimer *)timer;
@end
@implementation Person
@synthesize strName,idDelegate;
-(id)initWithName:(NSString *)name withDelegate:(id<FindApartment>)delegate
{
    self=[super init];
    if(self)
    {
        self.strName=name;
        self.idDelegate=delegate;
    }
    return self;
}
-(void)wantToFindApartment
{
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(startFindApartment:) userInfo:@"hehe" repeats:YES];
}
-(void)startFindApartment:(NSTimer *)timer
{
    [self.idDelegate findApartment];
}
-(void) dealloc
{
    
}
@end
