//
//  FKViewController.m
//  AddressBookUITest
//
//  Created by yeeku on 13-10-24.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <AddressBookUI/AddressBookUI.h>
#import "FKViewController.h"

@interface FKViewController () <ABNewPersonViewControllerDelegate , ABPersonViewControllerDelegate , ABPeoplePickerNavigationControllerDelegate ,
	ABUnknownPersonViewControllerDelegate>
@end
@implementation FKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)addContact:(id)sender
{
	// 创建ABNewPersonViewController视图控制器
	ABNewPersonViewController* controller =
		[[ABNewPersonViewController alloc] init];
	// 设置newPersonViewDelegate属性为当前视图控制器自身
	controller.newPersonViewDelegate = self;
	// 使用UINavigationController包装ABNewPersonViewController
	UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:controller];
	[self presentViewController: nav animated: YES completion: NULL];
}

- (IBAction)unknown:(id)sender {
	ABUnknownPersonViewController* controller =
		[[ABUnknownPersonViewController alloc] init];
	// 设置unknownPersonViewDelegate属性为当前视图控制器自身
	controller.unknownPersonViewDelegate = self;
	// 设置显示标准动作
	controller.allowsActions = YES;
	// 设置允许将该位置联系人添加到地址簿
	controller.allowsAddingToAddressBook = YES;
	// 创建一条新的记录
	ABRecordRef record = ABPersonCreate();
	// 为ABRecordRef记录设置kABPersonFirstNameProperty属性
	ABRecordSetValue(record, kABPersonFirstNameProperty
		, (__bridge CFTypeRef)@"疯狂软件", NULL);
	// 为ABRecordRef记录设置kABPersonLastNameProperty属性
	ABRecordSetValue(record, kABPersonLastNameProperty
		, (__bridge CFTypeRef)@"fkit.org", NULL);
	// 添加联系人电话号码以及该号码对应的标签名
	ABMutableMultiValueRef multi = ABMultiValueCreateMutable(kABPersonPhoneProperty);
	ABMultiValueAddValueAndLabel(multi, (__bridge CFTypeRef)@"02028309358", (__bridge CFTypeRef)@"工作", NULL);
	ABMultiValueAddValueAndLabel(multi, (__bridge CFTypeRef)@"13500008888", (__bridge CFTypeRef)@"手机", NULL);
	// 为ABRecordRef记录设置kABPersonPhoneProperty属性
	ABRecordSetValue(record, kABPersonPhoneProperty, multi, NULL);
	// 设置controller显示record记录
	controller.displayedPerson = record;
	// 使用UINavigationController包装ABUnknownPersonViewController
	UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:controller];
	[self presentViewController: nav animated: YES completion: NULL];
}

- (IBAction)pick:(id)sender
{
	ABPeoplePickerNavigationController* controller =
		[[ABPeoplePickerNavigationController alloc] init];
	// 设置peoplePickerDelegate属性为当前视图控制器自身
	controller.peoplePickerDelegate = self;
	[self presentViewController:controller animated:YES completion:NULL];
}

- (IBAction)view:(id)sender
{
	ABAddressBookRef ab = ABAddressBookCreateWithOptions(NULL, NULL);
	// 获取ID为1的联系人记录
	ABRecordRef rec  = ABAddressBookGetPersonWithRecordID(ab, 1);
	// 创建ABPersonViewController视图控制
	ABPersonViewController* controller = [[ABPersonViewController alloc] init];
	controller.allowsActions = YES;
	controller.allowsEditing = YES;
	controller.personViewDelegate = self;
	// 显示用户选中的联系人记录
	controller.displayedPerson = rec;
	// 使用UINavigationController包装ABPersonViewController
	UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:controller];
	[self presentViewController: nav animated: YES completion: NULL];
}

// ABNewPersonViewControllerDelegate协议中的方法，当用户点击保存或取消按钮时激发该方法
- (void)newPersonViewController:(ABNewPersonViewController *)
	newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person
{
	// 如果用户单击保存按钮，person代表刚保存的记录；
	// 如果用户单击取消按钮，person为NULL
	if(person)
	{
		// 取出person记录中kABPersonFirstNameProperty属性的值
		NSString* firstName = (__bridge NSString*)ABRecordCopyValue(person,
			kABPersonFirstNameProperty);
		[self showAlert:[NSString stringWithFormat:@"[%@]联系人被保存" , firstName]];
	}
	// 隐藏包装newPersonViewController的导航控制器
	[newPersonViewController.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

// ABUnknownPersonViewControllerDelegate协议中的方法，
// 当用户把这条未知联系人添加到某个信息人上，或添加到地址簿中时将会激发该方法
- (void)unknownPersonViewController:(ABUnknownPersonViewController *)
	unknownPersonView didResolveToPerson:(ABRecordRef)person
{
	// person代表用户刚刚保存的记录
	if(person)
	{
		// 取出person记录中kABPersonFirstNameProperty属性的值
		NSString* firstName = (__bridge NSString*)ABRecordCopyValue(person,
			kABPersonFirstNameProperty);
		[self showAlert:[NSString stringWithFormat:@"[%@]联系人被保存" , firstName]];
	}
	// 隐藏包装unknownPersonView的导航控制器
	[unknownPersonView.navigationController
		dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)
	peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{

	// 取消显示peoplePicker视图控制器，
	// 当peoplePicker视图控制器隐藏时执行后面的代码块
	[peoplePicker dismissViewControllerAnimated:YES completion:^{
		// 取出person记录中kABPersonFirstNameProperty属性的值
		NSString* firstName = (__bridge NSString*)ABRecordCopyValue(person,
			kABPersonFirstNameProperty);
		[self showAlert:[NSString stringWithFormat:@"您选中了[%@]联系人" ,
			firstName]];
	}];
	return NO;
}
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)
	peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:
	(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
	return NO;
}
- (void)peoplePickerNavigationControllerDidCancel:
	(ABPeoplePickerNavigationController *)peoplePicker;
{
	NSLog(@"用户取消了选择");
}
// 当用户选中某个属性时激发该方法
- (BOOL)personViewController:(ABPersonViewController *)personViewController
	shouldPerformDefaultActionForPerson:(ABRecordRef)person property:
	(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifierForValue
{
	[self showAlert: [NSString stringWithFormat:@"名字为：%@" ,
		(__bridge NSString*)ABRecordCopyCompositeName(person)]];
	[personViewController.navigationController
		dismissViewControllerAnimated:YES completion:NULL];
	return YES;
}
- (void) showAlert:(NSString*) msg
{
	// 使用UIAlertView显示msg信息
	[[[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil
		cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}
@end
