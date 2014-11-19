//
//  FKAppDelegate.h
//  CoreDataTest
//
//  Created by yeeku on 13-8-31.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface FKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
// 定义Core Data的3个核心API的属性
@property (readonly, strong, nonatomic) NSManagedObjectContext*
	managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator*
	persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
