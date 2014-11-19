//
//  FKViewController.m
//  BlendTest
//
//  Created by yeeku on 13-7-13.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKViewController.h"
#import "FKBlendView.h"

@implementation FKViewController
FKBlendView* blendView;
// 定义一个数组，该数组包含的叠加模式恰好与CGBlendMode枚举类型中各枚举值一一对应
static NSString *blendModes[] = {
	@"Normal",
	@"Multiply",
	@"Screen",
	@"Overlay",
	@"Darken",
	@"Lighten",
	@"ColorDodge",
	@"ColorBurn",
	@"SoftLight",
	@"HardLight",
	@"Difference",
	@"Exclusion",
	@"Hue",
	@"Saturation",
	@"Color",
	@"Luminosity",
	@"Clear",
	@"Copy",
	@"SourceIn",
	@"SourceOut",
	@"SourceAtop",
	@"DestinationOver",
	@"DestinationIn",
	@"DestinationOut",
	@"DestinationAtop",
	@"XOR",
	@"PlusDarker",
	@"PlusLighter",
};
// 计算blendModes数组的长度
static NSInteger blendModeCount = sizeof(blendModes) / sizeof(blendModes[0]);
-(void)viewDidLoad
{
	[super viewDidLoad];
	// 为picker控件设置delegate、datasource
	self.picker.delegate = self;
	self.picker.dataSource = self;
	// 初始化、创建FKBlendView控件
	blendView = [[FKBlendView alloc] initWithFrame:self.scrollView.bounds];
	// 将blendView添加到scrollView中
	[self.scrollView addSubview:blendView];
	// 设置picker控件的3列初始化时选中的位置
	[self.picker selectRow:[self.colors indexOfObject:
		blendView.destinationColor] inComponent:0 animated:NO];
	[self.picker selectRow:[self.colors indexOfObject:
		blendView.sourceColor] inComponent:1 animated:NO];
	[self.picker selectRow:blendView.blendMode inComponent:2 animated:NO];
}

// 定义方法来结算颜色的亮度（即计算流明值）。
CGFloat luminanceForColor(UIColor *color)
{
	// 获取UIColor对应的CGColorRef
	CGColorRef cgColor = color.CGColor;
	// 获取各颜色组件值
	const CGFloat *components = CGColorGetComponents(cgColor);
	CGFloat luminance = 0.0;
	// 获取颜色模式，根据不同颜色模式采用不同方式来计算颜色的亮度
	switch(CGColorSpaceGetModel(CGColorGetColorSpace(cgColor)))
	{
		// 如果是单色模式的颜色
		case kCGColorSpaceModelMonochrome:
			// 该颜色值就可代表它的亮度
			luminance = components[0];
			break;
		// 如果是RGB模式的颜色
		case kCGColorSpaceModelRGB:
			// 用不同的颜色组件的值乘以特定的系数、再累加的和即可作为该颜色的亮度
			luminance = 0.2126 * components[0] + 0.7152 * components[1]
				+ 0.0722 * components[2];
			break;
		// 对于其他颜色，我们暂不实现，因此直接返回一个比正常亮度都大的亮度值。
		default:
			luminance = 2.0;
	}
	return luminance;
}
// 定义一个方法，根据颜色的亮度值进行排序
NSInteger colorSortByLuminance(id color1, id color2, void *context)
{
	CGFloat luminance1 = luminanceForColor(color1);
	CGFloat luminance2 = luminanceForColor(color2);
	if(luminance1 == luminance2)
	{
		return NSOrderedSame;
	}
	else if(luminance1 < luminance2)
	{
		return NSOrderedAscending;
	}
	else
	{
		return NSOrderedDescending;
	}
}
// 定义colors方法，该方法将作为self.colors属性的返回值
-(NSArray*)colors
{
	static NSArray *colorArray = nil;
	if(colorArray == nil)
	{
		// 初始化未排序的颜色
		NSArray* unsortedArray = [NSArray arrayWithObjects:
							  [UIColor redColor],
							  [UIColor greenColor],
							  [UIColor blueColor],
							  [UIColor yellowColor],
							  [UIColor magentaColor],
							  [UIColor cyanColor],
							  [UIColor orangeColor],
							  [UIColor purpleColor],
							  [UIColor brownColor],
							  [UIColor whiteColor],
							  [UIColor lightGrayColor],
							  [UIColor darkGrayColor],
							  [UIColor blackColor], nil];
		// 对颜色数组按亮度排序
		colorArray = [unsortedArray sortedArrayUsingFunction:
			colorSortByLuminance context:nil];
	}
	return colorArray;
}
// 该方法返回值决定该UIPickerView包含多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 3;
}
// 该方法返回值决定该UIPickerView的指定列包含多少个列表项
-(NSInteger)pickerView:(UIPickerView *)pickerView
	numberOfRowsInComponent:(NSInteger)component
{
	// 定义记录包含多少列表项的变量
	NSInteger numComps = 0;
	switch(component)
	{
		case 0:
		case 1:
			// 对于第1列、第2列，上面定义了多少种颜色，此处包含多少个列表项
			numComps = self.colors.count;
			break;
		case 2:
			// 对于第3列，上面定义了多少种叠加模式，此处包含多少个列表项
			numComps = blendModeCount;
			break;
	}
	return numComps;
}
// 该方法返回值决定该UIPickerView中各列的宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView
	widthForComponent:(NSInteger)component
{
	CGFloat width = 0.0;
	switch (component)
	{
		case 0:
		case 1:
			// 对于第1列、第2列，宽48
			width = 48.0;
			break;
		case 2:
			// 对于第1列、第3列，宽192
			width = 192.0;
			break;
	}
	return width;
}
#define kColorTag 1
#define kLabelTag 2
// 该方法的返回值决定UIPickerView中各列、各列表项的控件
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
	forComponent:(NSInteger)component reusingView:(UIView *)view
{
	switch (component)
	{
		case 0:
		case 1:
			// 对于第1、2两列，使用特定背景色的UIView作为列表项控件
			if(view.tag != kColorTag)
			{
				CGRect frame = CGRectZero;
				// 获取UIPickerView为该选项控件分配的大小
				frame.size = [pickerView rowSizeForComponent:component];
				frame = CGRectInset(frame, 4.0, 4.0);
				// 创建UIView
				view = [[UIView alloc] initWithFrame:frame];
				// 为该UIView设置tag属性
				view.tag = kColorTag;
				// 设置不允许用户交互
				view.userInteractionEnabled = NO;
			}
			// 设置该控件的背景色
			view.backgroundColor = [self.colors objectAtIndex:row];
			break;
		case 2:
			// 对于第3列
			if(view.tag != kLabelTag)
			{
				CGRect frame = CGRectZero;
				// 获取UIPickerView为该选项控件分配的大小
				frame.size = [pickerView rowSizeForComponent:component];
				frame = CGRectInset(frame, 4.0, 4.0);
				view = [[UILabel alloc] initWithFrame:frame];
				view.tag = kLabelTag;
				view.opaque = NO;
				// 设置该控件的背景颜色
				view.backgroundColor = [UIColor clearColor];
				view.userInteractionEnabled = NO;
			}
			// 修改该UIView（实际上是UILabel）的文本，显示叠加模式
			UILabel *label = (UILabel*)view;
			label.textColor = [UIColor blackColor];
			label.text = blendModes[row];
			label.font = [UIFont boldSystemFontOfSize:18.0];
			break;
	}
	return view;
}
// 当用户选中UIPickerView的某个列表项时触发该方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)
	row inComponent:(NSInteger)component
{
	// 根据用户在第1、2列选定的值来设置叠加颜色
	blendView.destinationColor = [self.colors objectAtIndex:
		[self.picker selectedRowInComponent:0]];
	blendView.sourceColor = [self.colors objectAtIndex:
		[self.picker selectedRowInComponent:1]];
	// 根据用户在第3列选定的值来设置叠加模式
	blendView.blendMode = [self.picker selectedRowInComponent:2];
}
@end