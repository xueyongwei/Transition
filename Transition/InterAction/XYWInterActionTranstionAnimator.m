//
//  XYWInterActionTranstionAnimator.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWInterActionTranstionAnimator.h"

@implementation XYWInterActionTranstionAnimator
-(id)initWithTargetEdge:(UIRectEdge)targetEdge{
    if (self = [super init]) {
        self.targetEdge = targetEdge;
    }
    return self;
}
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containView = transitionContext.containerView;
    
    BOOL isPresentng = toVC.presentingViewController == fromVC;
    
    CGRect fromRect = fromView.frame;
    
    CGRect toRect = [transitionContext finalFrameForViewController:toVC];
    
    CGVector offset = [self offSet];
    
    if (isPresentng) {
        fromRect = CGRectOffset(fromView.frame, fromView.frame.size.width*0.5*-1, 0);
        toView.frame = CGRectOffset(toRect, toRect.size.width*offset.dx*-1, toRect.size.height*offset.dy*-1);
        [containView addSubview:toView];
    }else{
        toView.frame = CGRectOffset(toRect, toRect.size.width*-0.5, 0);
        [containView insertSubview:toView belowSubview:fromView];
    }
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (isPresentng) {
            toView.frame = toRect;
            fromView.frame = fromRect;
        }else{
            toView.frame = toRect;
            fromView.frame = CGRectOffset(fromRect, fromRect.size.width*offset.dx, fromRect.size.height*offset.dy);
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

-(CGVector)offSet{
    CGVector vector = CGVectorMake(0, 0);
    switch (self.targetEdge) {
        case UIRectEdgeTop:
        {
            vector = CGVectorMake(0, 1);
        }
            break;
        case UIRectEdgeLeft:
        {
            vector = CGVectorMake(1, 0);
        }
            break;
        case UIRectEdgeBottom:
        {
            vector = CGVectorMake(0, -1);
        }
            break;
        case UIRectEdgeRight:
        {
            vector = CGVectorMake(-1, 0);
        }
            break;
            
        default:
            break;
    }
    return vector;
}
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
