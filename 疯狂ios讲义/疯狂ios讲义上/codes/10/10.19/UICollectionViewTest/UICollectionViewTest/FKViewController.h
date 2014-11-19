//
//  FKViewController.h
//  UICollectionViewTest
//
//  Created by yeeku on 13-6-22.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController<UICollectionViewDataSource,
UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *grid;

@end
