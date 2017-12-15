//
//  XYWInterActionTranstion.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "XYWInterActionTranstion.h"

@implementation XYWInterActionTranstion
{
    id<UIViewControllerContextTransitioning> _context;
}
-(id)initWithGustureRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer andTargetEdge:(UIRectEdge)edge
{
    if (self = [super init]) {
        self.gestureRecognizer = recognizer;
        [recognizer addTarget:self action:@selector(gestureRecognizerDidUpdate:)];
        
        self.targetEdge = edge;
    }
    return self;
}
-(void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    [super startInteractiveTransition:transitionContext];
    _context = transitionContext;
}
-(void)gestureRecognizerDidUpdate:(UIGestureRecognizer *)recognizer{
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            {
                
            }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:[self percentComplete]];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if ([self percentComplete]>0.5) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            [self cancelInteractiveTransition];
            break;
    }
}
-(CGFloat)percentComplete
{
    UIView *containView = _context.containerView;
    CGPoint location = [self.gestureRecognizer locationInView:containView];
    CGFloat width = containView.bounds.size.width;
    CGFloat heiht = containView.bounds.size.height;
    
    switch (self.targetEdge) {
        case UIRectEdgeRight:
        {
            return (width-location.x)/width;
        }break;
        case UIRectEdgeLeft:
        {
            return location.x/width;
        }break;
        case UIRectEdgeBottom:
        {
            return (heiht-location.y)/heiht;
        }break;
        case UIRectEdgeTop:
        {
            return location.y/heiht;
        }break;
            
        default:
            return 0;
            break;
    }
}

@end
