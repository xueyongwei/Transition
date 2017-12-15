//
//  XYWCrossDissolveDisMissAniator.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWCrossDissolveDisMissAniator.h"

@implementation XYWCrossDissolveDisMissAniator
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *cotainView = transitionContext.containerView;
    
    toView.alpha = 0;
    toView.frame = [transitionContext finalFrameForViewController:toVC];
    
    fromView.alpha = 1;
    fromView.frame = [transitionContext finalFrameForViewController:fromVC];
    
    CGRect rect = fromView.frame;
    rect.origin.y = rect.size.height;
    
    [cotainView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toView.alpha = 1;
        fromView.alpha = 0;
        fromView.frame = rect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
