//
//  main.m
//  testArray
//
//  Created by chuguangming on 14-7-8.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Agent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Agent *agent=[[Agent alloc] init];
        Person *jack=[[Person alloc]initWithName:@"楚广明" withDelegate:agent];
        [jack wantToFindApartment];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
