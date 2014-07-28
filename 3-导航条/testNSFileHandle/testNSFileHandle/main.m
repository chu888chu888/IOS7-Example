//
//  main.m
//  testNSFileHandle
//
//  Created by chuguangming on 14-7-24.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>

void testWriteData(void)
{
    NSString *homePath=@"/Users/chuguangming/Documents";
    NSLog(@"%@",homePath);
    NSString *sourcePath=[homePath stringByAppendingPathComponent:@"testFile.txt"];
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForUpdatingAtPath:sourcePath];
    //将节点跳转到文件末尾
    [fileHandle seekToEndOfFile];
    NSString *str=@"追加的数据";
    NSData *stringData=[str dataUsingEncoding:NSUTF8StringEncoding];
    //追加写入数据
    for (int i=0; i<100; i++) {
        [fileHandle writeData:stringData];
    }
    
    [fileHandle closeFile];
}

void testReadData(void)
{
    //testWriteData();
    
    NSFileHandle *inFile, *outFile;
    NSData *buffer;
    NSString *homePath=@"/Users/chuguangming/Documents";
    NSString *sourcePath=[homePath stringByAppendingPathComponent:@"testFile.txt"];
    //打开testfile.txt文件用于读取操作
    inFile = [NSFileHandle fileHandleForReadingAtPath:sourcePath];
    
    if(inFile == nil)
    {
        NSLog(@"Open of testfile.txt for reading failed!");
        exit(1);
    }
    
    //创建一个文件用于写数据（第一次是必要的）
    [[NSFileManager defaultManager] createFileAtPath:@"/Users/chuguangming/Documents/testout.txt" contents:nil attributes:nil] ;
    //NSLog(@"%@",[[NSFileManager defaultManager] currentDirectoryPath]);
    //打开testout.txt文件用于写入操作
    outFile = [NSFileHandle fileHandleForWritingAtPath:@"/Users/chuguangming/Documents/testout.txt"];
    
    if(outFile == nil)
    {
        NSLog(@"Open of testout.txt for writing failed!");
        exit(1);
    }
    
    //将文件的长度设定为offset
    [outFile truncateFileAtOffset:0];
    
    //从inFile中读取数据，并将其写入到outFile中
    buffer = [inFile readDataToEndOfFile];
    
    [outFile writeData:buffer];
    
    //关闭两个文件
    [inFile closeFile];
    [outFile closeFile];
    
    //验证文件的内容是否写入
    NSLog(@"%@",[NSString stringWithContentsOfFile:@"testout.txt" encoding:NSUTF8StringEncoding error:nil]);
}

void testNSFileManager(void)
{

    
    
    NSString *dirName = @"testdir";
    NSString *path;
    NSFileManager *fm=[NSFileManager defaultManager];
    
    //获取当前目录（directory）既 文件夹
    path = [fm currentDirectoryPath];
    NSLog(@"Current directory path is: %@",path);
    
    //创建一个新的目录
    if([fm createDirectoryAtPath:dirName attributes:nil] == NO)
    {
        NSLog(@"Couldn't create directory!");
        exit(1);
    }
    
    //重命名这个新创建的目录
    if([fm movePath:dirName toPath:@"newdir" handler:nil] == NO)
    {
        NSLog(@"Directory rename faild!");
        exit(1);
    }
    
    //改变目录到这个新的目录中
    if([fm changeCurrentDirectoryPath:@"newdir"] == NO)
    {
        NSLog(@"Change directory failed!");
        exit(1);
    }
    
    //重新获取当前的工作目录
    path = [fm currentDirectoryPath];
    NSLog(@"Current directory path is: %@", path);
    
    NSLog(@"All operations were successful!");
}

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        //testWriteData();
        //testReadData();
        //testNSFileManager();
        
    }
    return 0;
}

