//
//  XYWPresentioController.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWPresentioController.h"
#import "XYWCustomAnimator.h"

@implementation XYWPresentioController
{
    UIView *_presentationWrappingView;
    UIView *_dimmingView;
}
-(id)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]){
        
        presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
        
    }
    return self;
}
-(UIView *)presentedView
{
    return _presentationWrappingView;
}




// MARK: - 实现协议UIViewControllerTransitioningDelegate
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [XYWCustomAnimator new];
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [XYWCustomAnimator new];
}

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return self;
}


// MARK: - 两组对应的方法，实现自定义presentation
-(void)presentationTransitionWillBegin{
    _presentationWrappingView = [[UIView alloc]initWithFrame:self.frameOfPresentedViewInContainerView];
    _presentationWrappingView.layer.shadowOpacity = 0.44;
    _presentationWrappingView.layer.shadowRadius = 13;
    _presentationWrappingView.layer.shadowOffset = CGSizeMake(0, -6);
    
    UIView *presentationRoundedCornerView = [[UIView alloc]initWithFrame:UIEdgeInsetsInsetRect(_presentationWrappingView.bounds, UIEdgeInsetsMake(0, 0, -16, 0))];
    presentationRoundedCornerView.layer.cornerRadius = 16;
    presentationRoundedCornerView.layer.masksToBounds = true;
    
    UIView *presentedViewControllerWapperView = [[UIView alloc]initWithFrame:UIEdgeInsetsInsetRect(presentationRoundedCornerView.bounds, UIEdgeInsetsMake(0, 0, 16, 0))];
    
    UIView *presentedViewControllerView = [super presentedView];
    presentedViewControllerView.frame = presentedViewControllerWapperView.bounds;
    
    [presentedViewControllerWapperView addSubview:presentedViewControllerView];
    [presentationRoundedCornerView addSubview:presentedViewControllerWapperView];
    [_presentationWrappingView addSubview:presentationRoundedCornerView];
    
    _dimmingView = [[UIView alloc]initWithFrame:self.containerView.bounds];
    _dimmingView.backgroundColor = [UIColor blackColor];
    [self.containerView addSubview:_dimmingView];
    _dimmingView.alpha = 0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDimming:)];
    [_dimmingView addGestureRecognizer:tap];
    
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        _dimmingView.alpha = 0.5;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}
-(void)tapDimming:(UITapGestureRecognizer *)recognizer{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)presentationTransitionDidEnd:(BOOL)completed
{
    if (!completed) {
        _dimmingView = nil;
        _presentationWrappingView = nil;
    }
}

-(void)dismissalTransitionWillBegin
{
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        _dimmingView.alpha = 0;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

-(void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed) {
        _dimmingView = nil;
        _presentationWrappingView = nil;
    }
}

@end
