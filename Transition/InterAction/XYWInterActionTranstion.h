//
//  XYWInterActionTranstion.h
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYWInterActionTranstion : UIPercentDrivenInteractiveTransition
@property (nonatomic,strong) UIScreenEdgePanGestureRecognizer *gestureRecognizer;
@property (nonatomic,assign) UIRectEdge targetEdge;
-(id)initWithGustureRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer andTargetEdge:(UIRectEdge)edge;
@end
