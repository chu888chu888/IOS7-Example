//
//  MYCustomPanel.m
//  MYBlurIntroductionView-Example
//
//  Created by Matthew York on 10/17/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import "GuideFour.h"
#import "MYBlurIntroductionView.h"

@implementation GuideFour

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

#pragma mark - Interaction Methods
//Override them if you want them!

-(void)panelDidAppear{
//    [self.parentIntroductionView setEnabled:NO];
}

-(void)panelDidDisappear{
   
}

#pragma mark Outlets


- (IBAction)didSelectPanelChange:(UIButton *)sender {
    [self.parentIntroductionView setEnabled:YES];
    [self.parentIntroductionView changeToPanelAtIndex:sender.tag];
}

@end
