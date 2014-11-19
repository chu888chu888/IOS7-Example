//
//  FKViewController.m
//  AddressBookTest
//
//  Created by yeeku on 13-10-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "FKViewController.h"

@interface FKViewController ()

@end

@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)deletePerson:(id)sender
{
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
				// 从地址薄中获取ID为3的记录
				ABRecordRef rec = ABAddressBookGetPersonWithRecordID(ab , 3);
				BOOL result = ABAddressBookRemoveRecord(ab, rec , NULL);
				if(result)
				{
					// 将程序所做的修改保存到地址薄中，如果保存成功
					if(ABAddressBookSave(ab, NULL))
					{
						[self showAlert:@"成功删除ID为3的联系人"];
					}
					else
					{
						[self showAlert:@"保存修改时出现错误"];
					}
				}
				else
				{
					[self showAlert:@"删除失败"];
				}
			}
		});
	}
}
- (void) showAlert:(NSString*) msg
{
	// 使用UIAlertView显示msg信息
	[[[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil
		cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}
@end
