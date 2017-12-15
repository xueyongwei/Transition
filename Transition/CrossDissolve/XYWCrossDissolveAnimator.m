//
//  XYWCrossDissolveAnimator.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWCrossDissolveAnimator.h"

@implementation XYWCrossDissolveAnimator

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *cotainView = transitionContext.containerView;
    
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    
    
    
    
    BOOL isPresenting = toViewController.presentingViewController == fromViewController;
    if (isPresenting) {//准备把toView从1/2处往上
        toView.alpha = 0;
        toView.frame = CGRectMake(fromView.frame.origin.x, fromView.frame.size.height/2, fromView.frame.size.width, fromView.frame.size.height);
        [cotainView addSubview:toView];
    }else{//dismiss
        toView.alpha = 1;
        [cotainView insertSubview:toView belowSubview:fromView];
    }
    
    
    CGFloat transtionDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:transtionDuration delay:0.1 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        if (isPresenting) {
            toView.frame = [transitionContext finalFrameForViewController:toViewController];
            toView.alpha = 1;
        }else{
            fromView.frame = CGRectOffset(toView.frame,0 , toView.frame.size.height);
            fromView.alpha = 0;
        }
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

@end
