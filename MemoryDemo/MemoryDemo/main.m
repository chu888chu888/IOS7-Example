//
//  main.m
//  MemoryDemo
//
//  Created by chuguangming on 14-7-24.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //归档
        NSString *homeDirectory=@"/Users/chuguangming/Documents";
        NSArray *array=@[@123,@456,@"999",@"000"];
        NSString *directoryA=[homeDirectory stringByAppendingPathComponent:@"testFile.txt"];
        if ([NSKeyedArchiver archiveRootObject:array toFile:directoryA]) {
            NSLog(@"序列化成功");
        }
        //反序列化
        NSArray *unArray=[NSKeyedUnarchiver unarchiveObjectWithFile:directoryA];
        NSLog(@"%@",unArray);
    }
    return 0;
}

