//
//  XYWPresentioController.h
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYWPresentioController : UIPresentationController <UIViewControllerTransitioningDelegate>
-(id)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController;
@end
