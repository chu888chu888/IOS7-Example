//
//  FKAppDelegate.m
//  CoreDataTest
//
//  Created by yeeku on 13-8-31.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKAppDelegate.h"

@implementation FKAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application
	didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	return YES;
}
- (void)applicationWillTerminate:(UIApplication *)application
{
	// 当应用被中断时候，将所有托管上下文中数据保存起来
	[self saveContext];
}

- (void)saveContext
{
	NSError *error = nil;
	// 获取应用的托管对象上下文
	NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
	if (managedObjectContext != nil)
	{
		// 如果托管对象上下文中包含了未保存的修改，执行保存，如果保存失败记录错误信息
		if ([managedObjectContext hasChanges] &&
			![managedObjectContext save:&error])
		{
			NSLog(@"保存出现错误：%@, %@", error, [error userInfo]);
			abort();
		}
	}
}
// 初始化应用的托管对象上下文。
- (NSManagedObjectContext *)managedObjectContext
{
	// 如果_managedObjectContext已经被初始化过，直接返回该对象	
	if (_managedObjectContext != nil) {
		return _managedObjectContext;
	}
	// 获取持久化存储协调器
	NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	// 如果持久化存储协调器不为nil
	if (coordinator != nil)
	{
		// 创建NSManagedObjectContext对象
		_managedObjectContext = [[NSManagedObjectContext alloc] init];
		// 为NSManagedObjectContext对象设置持久化存储协调器
		[_managedObjectContext setPersistentStoreCoordinator:coordinator];
	}
	return _managedObjectContext;
}
- (NSManagedObjectModel *)managedObjectModel
{
	// 如果_managedObjectModel已经被初始化过，直接返回该对象
	if (_managedObjectModel != nil) {
		return _managedObjectModel;
	}
	// 获取实体模型文件对应的NSURL
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FKModel"
		withExtension:@"momd"];
	// 加载应用的实体模型文件，并初始化NSManagedObjectModel对象
	_managedObjectModel = [[NSManagedObjectModel alloc]
		initWithContentsOfURL:modelURL];
	return _managedObjectModel;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
	// 如果_persistentStoreCoordinator已经被初始化过，直接返回该对象
	if (_persistentStoreCoordinator != nil) {
		return _persistentStoreCoordinator;
	}
	// 获取SQLite数据库文件的存储目录
	NSURL *storeURL = [[self applicationDocumentsDirectory]
		URLByAppendingPathComponent:@"Books.sqlite"];
	NSError *error = nil;
	// 以持久化对象模型为基础，创建NSPersistentStoreCoordinator对象
	_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
		initWithManagedObjectModel:[self managedObjectModel]];
	// 设置持久化存储协调器底层采用SQLite存储机制，如果设置失败记录错误信息
	if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
		configuration:nil URL:storeURL options:nil error:&error])
	{
		NSLog(@"设置持久化存储失败：%@, %@", error, [error userInfo]);
		abort();
	}
	return _persistentStoreCoordinator;
}
// 获取应用的Documents目录
- (NSURL *)applicationDocumentsDirectory
{
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
		inDomains:NSUserDomainMask] lastObject];
}
@end
