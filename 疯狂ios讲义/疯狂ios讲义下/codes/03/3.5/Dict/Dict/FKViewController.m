//
//  FKViewController.m
//  Dict
//
//  Created by yeeku on 13-8-27.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <sqlite3.h>
#import "FKViewController.h"
#import "FKResultViewController.h"
#import "FKWord.h"

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)finishEdit:(id)sender {
	// 让该文本框放弃作为第一响应者
	[sender resignFirstResponder];
}
- (IBAction)addWord:(id)sender
{
	NSString* word = self.wordField.text;
	NSString* detail = self.detailField.text;
	// 只有当self.wordField、self.detailField两个控件内有内容时才执行插入
	if(word != nil && word.length > 0
		&& detail != nil && detail.length > 0)
	{
		sqlite3* database;
		// 新建和打开数据库，database变量保存了打开的数据库的指针
		sqlite3_open([[self dbPath] UTF8String], &database);
		// 定义错误字符串
		char * errMsg;
		// 定义执行建表的SQL语句
		const char * createSQL = "create table if not exists word_inf \
			(_id integer primary key autoincrement,\
			word,\
			detail)";
		// 执行建表语句
		int result = sqlite3_exec(database, createSQL, NULL, NULL, &errMsg);
		if (result == SQLITE_OK)
		{
			const char * insertSQL = "insert into word_inf values(null, ? , ?)";
			sqlite3_stmt * stmt;
			// 预编译SQL语句，stmt变量保存了预编译结果的指针
			int insertResult = sqlite3_prepare_v2(database
				, insertSQL, -1, &stmt, nil);
			// 如果预编译成功
			if (insertResult == SQLITE_OK)
			{
				// 为第一个?占位符绑定参数
				sqlite3_bind_text(stmt, 1,
					[word UTF8String], -1, NULL);
				// 为第二个?占位符绑定参数
				sqlite3_bind_text(stmt, 2,
					[detail UTF8String], -1, NULL);
				// 执行SQL语句
				sqlite3_step(stmt);
				// 将wordField、detailField控件的内容清空
				self.wordField.text = @"";
				self.detailField.text = @"";
			}
			sqlite3_finalize(stmt);
		}
		// 关闭数据库
		sqlite3_close(database);
	}
}
// 定义一个方法，获取数据库文件的保存路径。
- (NSString*) dbPath
{
	// 获取应用的Documents路径
	NSArray *paths = NSSearchPathForDirectoriesInDomains(
		NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [NSString stringWithFormat:@"%@/myWords.db"
		, documentsDirectory];
}
// 当应用从该视图控制器过渡到下一个视图控制器时自动执行该方法
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	NSString* key = self.keyField.text;
	// 只有当self.keyField控件内有内容时才执行查询
	if(key != nil && key.length > 0)
	{
		sqlite3* database;
		// 新建或打开数据库，database变量保存了打开的数据库的指针
		sqlite3_open([[self dbPath] UTF8String], &database);
		const char * selectSQL = "select * from word_inf where word like ?";
		sqlite3_stmt * stmt;
		// 预编译SQL语句，stmt变量保存了预编译结果的指针
		int queryResult = sqlite3_prepare_v2(database
			, selectSQL, -1, &stmt, nil);
		NSMutableArray* result = [[NSMutableArray alloc] init];
		// 如果预编译成功
		if(queryResult == SQLITE_OK)
		{
			// 为第一个?占位符绑定参数
			sqlite3_bind_text(stmt, 1, [[NSString stringWithFormat:@"%%%@%%"
				, key] UTF8String], -1, NULL);
			// 采用循环多次执行sqlite3_step()函数，并从中取出查询结果
			while (sqlite3_step(stmt) == SQLITE_ROW)
			{
				// 分别获取当前行的不同列的查询数据
				int word_id = sqlite3_column_int(stmt , 0);
				char* word = (char*)sqlite3_column_text(stmt , 1);
				char* detail = (char*)sqlite3_column_text(stmt , 2);
				// 将当前行的数据封装成FKWord对象
				FKWord * wordObj = [[FKWord alloc] initWithId:word_id
					word:[NSString stringWithUTF8String:word]
					detail:[NSString stringWithUTF8String:detail]];
				[result addObject:wordObj];
			}
		}
		// 关闭数据库
		sqlite3_close(database);
		FKResultViewController* resultViewController =
			(FKResultViewController*)segue.destinationViewController;
		// 将查询结果传给FKResultViewController对象显示
		resultViewController.wordArray = result;
	}
}
@end
