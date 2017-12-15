//
//  XYWCustomAnimator.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWCustomAnimator.h"

@implementation XYWCustomAnimator
-(CGFloat)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView  = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containView = transitionContext.containerView;
    
    CGRect fromViewFinalFrame = [transitionContext finalFrameForViewController:fromVC];
    CGRect toViewInitFrame = [transitionContext initialFrameForViewController:toVC];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
    
    
    BOOL isPresenting = toVC.presentingViewController==fromVC;
    if (isPresenting) {
        toView.frame = CGRectOffset(fromView.frame, 0, fromView.frame.size.height);
        
    }else{
        fromViewFinalFrame = CGRectOffset(fromView.frame, 0, fromView.frame.size.height);
    }
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (isPresenting) {
            toView.frame = toViewFinalFrame;
        }else{
            fromView.frame = fromViewFinalFrame;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}
@end
