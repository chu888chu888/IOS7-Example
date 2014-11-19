//  Created by yeeku on 2013-4-10.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import "FKItemView.h"

@implementation FKItemView
@synthesize item = _item;
- (void) showItemInfo
{
	NSLog(@"item物品名为%@,物品价格为：%d"
		, self.item.name , self.item.price);
}
// 自定义setItem:方法
- (void) setItem:(FKItem*) item
{
	self->_item = item;
	// 为item添加监听器，监听item的name属性的改变
	[self.item addObserver:self forKeyPath:@"name"
		options:NSKeyValueObservingOptionNew
		context:nil];
	// 为item添加监听器，监听item的price属性的改变
	[self.item addObserver:self forKeyPath:@"price"
		options:NSKeyValueObservingOptionNew
		context:nil];			
}
// 重写该方法，当被监听的数据模型发生改变时，就会回调监听器的该方法
- (void)observeValueForKeyPath:(NSString *)keyPath 
	ofObject:(id)object change:(NSDictionary *)change 
	context:(void *)context
{
	NSLog(@"--observeValueForKeyPath方法被调用--");
	// 获取修改时所设置的数据
	NSLog(@"被修改的keyPath为:%@", keyPath);
	NSLog(@"被修改的对象为:%@", object);
	NSLog(@"新被修改的属性值为:%@", [change objectForKey:@"new"]);
	NSLog(@"被修改的上下文为:%@", context);
}
- (void) dealloc
{
	// 删除监听器
	[self.item removeObserver:self forKeyPath:@"name"];
	[self.item removeObserver:self forKeyPath:@"price"];		
}
@end