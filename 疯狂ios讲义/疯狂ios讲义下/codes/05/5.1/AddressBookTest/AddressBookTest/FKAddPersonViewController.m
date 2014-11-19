//
//  FKAddPersonViewController.m
//  AddressBookTest
//
//  Created by yeeku on 13-10-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "FKAddPersonViewController.h"

@interface FKAddPersonViewController ()

@end

@implementation FKAddPersonViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)add:(id)sender
{
	NSString* firstName = self.firstnameField.text;
	NSString* lastName = self.lastnameField.text;
	NSString* homePhone = self.homePhoneField.text;
	NSString* mobilePhone = self.mobilePhoneField.text;
	NSString* workMail = self.workMailField.text;
	NSString* privateMail = self.privateMailField.text;
	NSString* country = self.countryField.text;
	NSString* state = self.stateField.text;
	CFErrorRef error = nil;
	// 创建ABAddressBook，该函数第一个参数暂时并为使用，直接传入NULL即可。
	ABAddressBookRef ab = ABAddressBookCreateWithOptions(NULL, &error);
	if (!error)
	{
		// 请求访问用户地址薄
		ABAddressBookRequestAccessWithCompletion(ab,
		^(bool granted,CFErrorRef error)
		{
			// 如果用户允许访问地址簿
			if (granted)
			{
				// 创建一条新的记录
				ABRecordRef rec = ABPersonCreate();
				// 为rec的kABPersonFirstNameProperty（名字）属性设置值
				ABRecordSetValue(rec, kABPersonFirstNameProperty
					, (__bridge CFStringRef)firstName, NULL);
				// 为rec的kABPersonFirstNameProperty（姓氏）属性设置值
				ABRecordSetValue(rec, kABPersonLastNameProperty
					, (__bridge CFStringRef)lastName, NULL);
				// 创建ABMutableMultiValueRef用来管理多个电话号码
				ABMutableMultiValueRef phoneValue = ABMultiValueCreateMutable
					(kABPersonPhoneProperty);
				// 添加label为家庭的电话号码
				ABMultiValueAddValueAndLabel(phoneValue
					, (__bridge CFTypeRef)homePhone
					, kABHomeLabel , NULL);
				// 添加label为移动的电话号码
				ABMultiValueAddValueAndLabel(phoneValue
					, (__bridge CFTypeRef)mobilePhone
					, kABPersonPhoneMobileLabel , NULL);
				// 为rec的kABPersonPhoneProperty（电话）属性设置值
				ABRecordSetValue(rec, kABPersonPhoneProperty
					, phoneValue , NULL);
				// 创建ABMutableMultiValueRef用来管理多个电子邮件
				ABMutableMultiValueRef mailValue = ABMultiValueCreateMutable
					(kABPersonEmailProperty);
				// 添加label为工作的电子邮件
				ABMultiValueAddValueAndLabel(mailValue
					, (__bridge CFStringRef)workMail
					, (__bridge CFStringRef)@"工作"  , NULL);
				// 添加label为私人的电子邮件
				ABMultiValueAddValueAndLabel(mailValue
					, (__bridge CFStringRef)privateMail
					, (__bridge CFStringRef)@"私人" , NULL);
				// 为rec的kABPersonEmailProperty（电子邮件）属性设置值
				ABRecordSetValue(rec, kABPersonEmailProperty
					, mailValue , NULL);
				// 创建ABMutableMultiValueRef用来管理多个地址
				ABMutableMultiValueRef addrValue = ABMultiValueCreateMutable
					(kABPersonAddressProperty);
				NSDictionary* addrDict = [NSDictionary dictionaryWithObjectsAndKeys:
					country, kABPersonAddressCountryKey,
					state, kABPersonAddressStateKey, nil];  // ①
				// 添加label为住址的地址
				ABMultiValueAddValueAndLabel(addrValue
					, (__bridge CFTypeRef)addrDict
					, (__bridge CFStringRef)@"住址" , NULL);
				// 为rec的kABPersonAddressProperty（地址）属性设置值
				ABRecordSetValue(rec, kABPersonAddressProperty, addrValue , NULL);
				BOOL result = ABAddressBookAddRecord(ab, rec , NULL);
				if(result)
				{
					// 将程序所做的修改保存到地址薄中，如果保存成功
					if(ABAddressBookSave(ab, NULL))
					{
						[self showAlert:@"成功添加新的联系人"];
					}
					else
					{
						[self showAlert:@"保存添加操作出现错误"];
					}
				}
				else
				{
					[self showAlert:@"添加失败"];
				}
			}
		});
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
