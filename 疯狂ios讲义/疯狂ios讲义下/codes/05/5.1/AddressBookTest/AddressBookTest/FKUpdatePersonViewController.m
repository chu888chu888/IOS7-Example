//
//  FKUpdatePersonViewController.m
//  AddressBookTest
//
//  Created by yeeku on 13-10-25.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "FKUpdatePersonViewController.h"
#define PHONE_PROPERTY_KEY @"phone"
#define MAIL_PROPERTY_KEY @"mail"
@interface FKUpdatePersonViewController ()
{
	ABAddressBookRef ab;
	// 定义ABRecordRef类型的变量保存当前正在更新的记录
	ABRecordRef rec;
	// 使用该变量定义当前动态添加的行的Y坐标
	NSInteger curLineY;
	// 定义一个NSMutableDictionary来保存所有动态添加的文本框
	NSMutableDictionary* textFields;
	// 定义ABMutableMultiValueRef变量记录正在修改修改的电话号码属性值。
	ABMutableMultiValueRef phoneValue;
	// 定义ABMutableMultiValueRef变量记录正在修改修改的电子邮件属性值。
	ABMutableMultiValueRef mailValue;
}
@end
@implementation FKUpdatePersonViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	textFields = [NSMutableDictionary dictionary];
	curLineY = 120;
	CFErrorRef error = nil;
	// 创建ABAddressBook，该函数第一个参数暂时并为使用，直接传入NULL即可。
	ab = ABAddressBookCreateWithOptions(NULL, &error);
	if (!error)
	{
		// 请求访问用户地址薄
		ABAddressBookRequestAccessWithCompletion(ab,
		^(bool granted,CFErrorRef error)
		{
			// 如果用户允许访问地址簿
			if (granted)
			{
				// 获取ID为1的ABRecordRef记录
				rec = ABAddressBookGetPersonWithRecordID(ab , 1);
				// 获取rec记录中kABPersonFirstNameProperty（名字）属性的值
				NSString* firstName = (__bridge NSString*)ABRecordCopyValue(rec,
					kABPersonFirstNameProperty);
				// 获取rec记录中kABPersonLastNameProperty（姓氏）属性的值
				NSString* lastName = (__bridge NSString*)ABRecordCopyValue(rec,
					kABPersonLastNameProperty);
				// 控制界面上文本框显示rec记录中姓氏、名字的属性值
				self.firstnameField.text = firstName;
				self.lastnameField.text = lastName;
				// 获取rec记录中kABPersonPhoneProperty（电话号码）属性的值
				phoneValue = ABRecordCopyValue(rec, kABPersonPhoneProperty);
				// 调用addLabelAndTextField:propertyKey:方法显示电话号码
				[self addLabelAndTextField:phoneValue propertyKey:PHONE_PROPERTY_KEY];
				// 获取rec记录中kABPersonPhoneProperty（电子邮件）属性的值
				mailValue = ABRecordCopyValue(rec, kABPersonEmailProperty);
				// 调用addLabelAndTextField:propertyKey:方法显示电子邮件
				[self addLabelAndTextField:mailValue propertyKey:MAIL_PROPERTY_KEY];
			}
		});
	}
}
- (void) addLabelAndTextField:(ABMutableMultiValueRef) multiValue
	propertyKey:(NSString*)property
{
	// 获取multiValue包含的数据条数
	NSInteger num = ABMultiValueGetCount(multiValue);
	NSMutableArray* textFieldArray = [NSMutableArray array];
	// 依次遍历multiValue所包含的每条数据
	for (int i = 0 ; i < num ; i++)
	{
		curLineY += 38;
		// 创建UILabel，显示本条数据的Label
		UILabel* label = [[UILabel alloc] initWithFrame:
			CGRectMake(20 , curLineY , 70, 30)];
		NSString* labelStr = (__bridge NSString*)ABAddressBookCopyLocalizedLabel
			(ABMultiValueCopyLabelAtIndex(multiValue , i));
		label.text = labelStr;
		// 将该UILabel添加到程序界面上
		[self.view performSelectorOnMainThread:@selector(addSubview:)
			withObject:label waitUntilDone:YES];
		// 创建UITextField，显示本条数据的Value
		UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake
			(98 , curLineY , 202, 30)];
		textField.borderStyle = UITextBorderStyleRoundedRect;
		NSString* valueStr = (__bridge NSString*)ABMultiValueCopyValueAtIndex
			(multiValue , i);
		textField.text = valueStr;
		[textField addTarget:self action:@selector(finishEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
		// 使用NSArray集合来保存动态创建的UITextField控件
		[textFieldArray addObject:textField];
		// 将UITextField添加到程序界面上
		[self.view performSelectorOnMainThread:@selector(addSubview:)
			withObject:textField waitUntilDone:YES];
	}
	// 将程序动态生成的所有textField保存到NSMutableDictionary中
	[textFields setValue:textFieldArray forKey:property];
}
- (void) updateMultiValue:(ABMutableMultiValueRef)multiValue
	properyKey:(NSString*) properyKey property:(ABPropertyID) property
{
	// 取出该属性对应的所有UITextView组成的NSArray
	NSArray* textFieldArray = textFields[properyKey];
	NSInteger num = textFieldArray.count;
	// 创建一个新的ABMutableMultiValueRef
	ABMutableMultiValueRef newMutli = ABMultiValueCreateMutable(property);
	// 遍历UITextView组成的NSArray集合中每个UITextField控件
	for (int i = 0 ; i < num ; i ++)
	{
		// 获取第i个UITextField控件中的字符串，该字符串将作为新的值。
		NSString* value = ((UITextField*)textFieldArray[i]).text;
		// 获取第i条数据原有的Label
		CFStringRef label = ABMultiValueCopyLabelAtIndex(multiValue, 0);
		// 添加新的值和原有的Label（Label不需要修改）
		ABMultiValueAddValueAndLabel(newMutli,
			(__bridge CFStringRef)value, label, NULL);
	}
	ABRecordSetValue(rec, property, newMutli, NULL);
}
- (IBAction)update:(id)sender
{
	NSString* firstName = self.firstnameField.text;
	NSString* lastName = self.lastnameField.text;
	// 修改rec记录中kABPersonFirstNameProperty、kABPersonLastNameProperty属性
	ABRecordSetValue(rec, kABPersonFirstNameProperty
		, (__bridge CFStringRef)firstName, NULL);
	ABRecordSetValue(rec, kABPersonLastNameProperty
		, (__bridge CFStringRef)lastName, NULL);
	// 调用updateMultiValue:properyKey:property:方法修改ABRecordRef的
	// kABPersonPhoneProperty属性
	[self updateMultiValue:phoneValue properyKey:PHONE_PROPERTY_KEY
		property:kABPersonPhoneProperty];
	// 调用updateMultiValue:properyKey:property:方法修改ABRecordRef的
	// kABPersonEmailProperty属性
	[self updateMultiValue:mailValue properyKey:MAIL_PROPERTY_KEY
		property:kABPersonEmailProperty];
	if(ABAddressBookSave(ab, NULL))
	{
		[self showAlert:@"修改成功"];
	}
	else
	{
		[self showAlert:@"修改出现错误"];
	}
}
- (IBAction)finishEdit:(id)sender
{
	[sender resignFirstResponder];
}
- (void) showAlert:(NSString*) msg
{
	// 使用UIAlertView显示msg信息
	[[[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}
@end
