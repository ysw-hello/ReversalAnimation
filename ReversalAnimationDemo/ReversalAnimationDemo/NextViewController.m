//
//  NextViewController.m
//  ReversalAnimationDemo
//
//  Created by Timmy on 2016/11/25.
//  Copyright © 2016年 ysw.com. All rights reserved.
//

#import "NextViewController.h"
#import "VCReversalAnimation.h"

@interface NextViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonClicked:(id)sender {
    self.transitioningDelegate = self;
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    VCReversalAnimation *animation = [VCReversalAnimation sharedAnimation];
//    animation.animationDuration = 4.f;
//    animation.animationDiraction = kDiraction_x;
    return animation;
}


@end
