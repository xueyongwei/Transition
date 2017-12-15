//
//  XYWPresentioController.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWPresentioController.h"

@implementation XYWPresentioController
{
    UIView *_presentationWrappingView;
    UIView *_dimmingView;
}
-(id)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]){
        presentingViewController.modalPresentationStyle = UIModalPresentationCustom;
        
    }
    return self;
}
-(UIView *)presentedView
{
    return _presentationWrappingView;
}

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return self;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return nil;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return nil;
}
@end
