//
//  XYWInterActionranstionDelegate.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWInterActionranstionDelegate.h"
#import "XYWInterActionTranstionAnimator.h"
#import "XYWInterActionTranstion.h"

@implementation XYWInterActionranstionDelegate

//无交互动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[XYWInterActionTranstionAnimator alloc]initWithTargetEdge:self.targetEdge];
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[XYWInterActionTranstionAnimator alloc]initWithTargetEdge:self.targetEdge];
}

//带交互动画
-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    return [[XYWInterActionTranstion alloc]initWithGustureRecognizer:self.gestureRecognizer andTargetEdge:self.targetEdge];
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return [[XYWInterActionTranstion alloc]initWithGustureRecognizer:self.gestureRecognizer andTargetEdge:self.targetEdge];
}

@end
