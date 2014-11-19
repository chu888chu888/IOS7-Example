//
//  FKViewController.m
//  PlistTest
//
//  Created by yeeku on 13-8-19.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()
// 定义一个NSMutableArray记录所有动态添加的UILabel控件
@property (nonatomic, strong) NSMutableArray* labelArray;
// 定义一个NSMutableArray记录所有动态添加的UITextField控件
@property (nonatomic, strong) NSMutableArray* fieldArray;
@end
@implementation FKViewController
// 定义一个变量来记录下一个将要添加的UILabel的Y坐标
int nextY = 80;
// 定义一个变量，记录当前正在添加第几项
int i = 1;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 初始化labelArray和fieldArray
	self.labelArray = [NSMutableArray array];
	self.fieldArray = [NSMutableArray array];
	// 创建一个导航条，并将它添加到程序界面上。
	UINavigationBar* bar = [[UINavigationBar alloc] initWithFrame:
		CGRectMake(0, 20 , 320, 44)];
	[self.view addSubview:bar];
	// 创建一个UINavigationItem导航项，并添加到导航条上。
	UINavigationItem* item = [[UINavigationItem alloc]
		initWithTitle:@"属性列表"];
	bar.items = [NSArray arrayWithObject:item];
	// 创建导航条上的添加按钮
	UIBarButtonItem* addBn = [[UIBarButtonItem alloc]
		initWithTitle:@"添加" style:UIBarButtonItemStyleBordered
		target:self action:@selector(addItem:)];
	// 创建导航条上的删除按钮
	UIBarButtonItem* removeBn = [[UIBarButtonItem alloc]
		initWithTitle:@"删除" style:UIBarButtonItemStyleBordered
		target:self action:@selector(removeItem:)];
	// 将添加按钮、删除按钮添加到导航条的左边
	item.leftBarButtonItems = [NSArray
		arrayWithObjects:addBn , removeBn , nil];
	// 创建导航条上的保存按钮
	UIBarButtonItem* saveBn = [[UIBarButtonItem alloc]
		initWithTitle:@"保存" style:UIBarButtonItemStyleBordered
		target:self action:@selector(save:)];
	// 将保存按钮添加到导航条的右边
	item.rightBarButtonItem = saveBn;
	// 使用NSArray加载属性文件
	NSArray* contentArray = [NSArray arrayWithContentsOfFile:[self filePath]];
	// 遍历属性文件中包含的数据项，并调用addItem:content:方法将数据项显示出来
	for (NSString* content in contentArray)
	{
		[self addItem:nil content:content];
	}
}
- (void)addItem:(id)sender{
	// 调用addItem:content:方法添加数据项
	[self addItem:sender content:nil];
}
- (void)addItem:(id)sender content:(NSString*)content{
	// 创建一个UILabel控件
	UILabel* label = [[UILabel alloc] initWithFrame:
		CGRectMake(10 , nextY  , 80 , 30)];
	// 设置该UILabel显示的文本
	label.text = [NSString stringWithFormat:@"第%d项" , i];
	// 将该UILabel添加到labelArray数组中
	[self.labelArray addObject: label];
	// 将UILabel控件添加到view父控件内
	[self.view addSubview:label];
	// 创建一个UITextField控件
	UITextField* textField = [[UITextField alloc] initWithFrame:
		CGRectMake(100 , nextY  , 210 , 30)];
	// 设置TextField的边框风格
	textField.borderStyle = UITextBorderStyleRoundedRect;
	// 如果content不为nil，且有数据，设置textField显示content数据
	if (content != nil && content.length > 0)
	{
		textField.text = content;
	}
	// 为textField的EditingDidEndOnExit事件绑定监听器，
	// 保证用户在该文本框内输入完成后，让该文本框放弃焦点。
	[textField addTarget:self action:@selector(resign:)
		forControlEvents:UIControlEventEditingDidEndOnExit];
	// 将该UILabel添加到fieldArray数组中
	[self.fieldArray addObject: textField];
	// 将UITextField控件添加到view父控件内
	[self.view addSubview:textField];
	// 控制nextY的值加40
	nextY += 40;
	i++;
}
- (void)removeItem:(id)sender
{
	// 获取labelArray、fieldArray的最后一个元素
	UILabel* lastLabel = [self.labelArray lastObject];
	UITextField* lastField = [self.fieldArray lastObject];
	// 从用户界面上删除lastLabel、lastField控件
	[lastLabel removeFromSuperview];
	[lastField removeFromSuperview];
	// 从labelArray、fieldArray集合中删除lastLabel、lastField
	[self.labelArray removeObject:lastLabel];
	[self.fieldArray removeObject:lastField];
	nextY -= 40;
	i--;
}
- (void) save:(id)sender
{
	// 创建一个NSMutableArray集合
	NSMutableArray* array = [[NSMutableArray alloc] init];
	// 遍历程序中fieldArray集合中UITextField控件
	// 将UITextField控件中文本内容添加到array集合中
	for (UITextField* tf in self.fieldArray)
	{
		[array addObject:tf.text];
	}
	// 调用NSMutableArray的方法将集合数据写入属性列表。
	[array writeToFile:[self filePath] atomically:YES];
	// 使用UIActionSheet提示用户保存成功
	UIActionSheet * sheet = [[UIActionSheet alloc]
		initWithTitle:@"保存成功" delegate:nil cancelButtonTitle:nil
		destructiveButtonTitle:@"确定" otherButtonTitles:nil];
	[sheet showInView:self.view];
}
- (void) resign:(id)sender
{
	// sender放弃作为第一响应者
	[sender resignFirstResponder];	
}
// 定义一个方法，获取属性列表文件的保存路径。
- (NSString*) filePath
{
	// 获取应用的Documents路径
	NSArray *paths = NSSearchPathForDirectoriesInDomains(
		NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [NSString stringWithFormat:@"%@/myList.plist"
		, documentsDirectory];

}
@end
