//
//  VCReversalAnimation.h
//  NeteaseTransition
//
//  Created by Timmy on 11/6/16.
//  Copyright © 2016 Timmy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ReversalDiraction) {
    kDiraction_x = 1, //以x轴为中心轴翻转
    kDiraction_y, //以y轴为中心轴翻转 （默认）
    KDiraction_z, //以z轴为中心轴翻转
};

@interface VCReversalAnimation : NSObject <UIViewControllerAnimatedTransitioning>

/// 生成动画单例对象
+(instancetype)sharedAnimation;

/// 设置动画时间
@property (nonatomic, assign) float animationDuration;

/// 设置翻转反向
@property (nonatomic, assign) ReversalDiraction animationDiraction;


@end
