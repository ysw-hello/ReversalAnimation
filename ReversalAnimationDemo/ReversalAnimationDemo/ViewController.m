//
//  ViewController.m
//  ReversalAnimationDemo
//
//  Created by Timmy on 2016/11/25.
//  Copyright © 2016年 ysw.com. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "VCReversalAnimation.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)buttonClicked:(id)sender {
    
    NextViewController *nextVC = [[NextViewController alloc] init];
    
    nextVC.transitioningDelegate = self;
    
    [self presentViewController:nextVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate_Method
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    VCReversalAnimation *animation = [VCReversalAnimation sharedAnimation];
//    animation.animationDuration = 0.8;
//    animation.animationDiraction = kDiraction_y;
    return animation;

}



@end
