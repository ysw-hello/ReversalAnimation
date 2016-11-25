//
//  VCReversalAnimation.m
//  NeteaseTransition
//
//  Created by Timmy on 11/6/16.
//  Copyright © 2016 Timmy. All rights reserved.
//

#import "VCReversalAnimation.h"

static float const durationAnimation = 1.2f;

@implementation VCReversalAnimation

+(instancetype)sharedAnimation{
    static dispatch_once_t onceToken;
    static VCReversalAnimation *animation = nil;
    dispatch_once(&onceToken, ^{
        animation = [[VCReversalAnimation alloc] init];
    });
    return animation;
}
// reGetter_animationDuration
-(float)animationDuration{
    if (!_animationDuration || _animationDuration == 0.f) {
        _animationDuration = durationAnimation;
    }
    return _animationDuration;
}
// reGetter_animationDiraction
-(ReversalDiraction)animationDiraction{
    if (_animationDiraction == 0) {
        _animationDiraction = kDiraction_y;
    }
    return _animationDiraction;
}
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return self.animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
    UIView* containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    [containerView.layer setSublayerTransform:transform];
    
    toVC.view.frame = [transitionContext initialFrameForViewController:fromVC];
    toVC.view.layer.transform = [self rotate: M_PI_2];
    
    // animation
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime: 0.0
                                relativeDuration: 0.5
                                      animations:^{
                                          fromVC.view.layer.transform = [self rotate: - M_PI_2];
                                    }];
        [UIView addKeyframeWithRelativeStartTime: 0.5
                                relativeDuration: 0.5
                                      animations:^{
                                          toVC.view.layer.transform =  [self rotate: 0];

                                    }];
                              } completion:^(BOOL finished) {
                                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                  fromVC.view.layer.transform = [self rotate: 0];


    }];
}
//设置旋转角度及方向
- (CATransform3D) rotate:(CGFloat) angle {
    switch (_animationDiraction) {
        case kDiraction_x:
            return CATransform3DMakeRotation(angle, 1.0, 0.0, 0.0);
            break;
           
        case kDiraction_y:
            return CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
            break;
            
        case KDiraction_z:
            return CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
            break;

        default:
            break;
    }
    return  CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
}

@end
