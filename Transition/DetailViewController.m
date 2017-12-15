//
//  DetailViewController.m
//  Transition
//
//  Created by 西方 on 2017/12/15.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "DetailViewController.h"
#import "XYWInterActionranstionDelegate.h"

#import "XYWInterActionranstionDelegate.h"


@interface DetailViewController ()

@end

@implementation DetailViewController
{
    UIScreenEdgePanGestureRecognizer *_screenEdgeGestureRecognizer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self custom];
    // Do any additional setup after loading the view.
}
-(void)custom{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(40, 40, 100, 44);
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt setTitle:@"dismiss/pop" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(alert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    if (self.transitioningDelegate) {
        [self addScreenEdgeGestureRecognizer];
    }
}
-(void)addScreenEdgeGestureRecognizer{
    UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdge:)];
    recognizer.edges = UIRectEdgeLeft;
    _screenEdgeGestureRecognizer = recognizer;
    [self.view addGestureRecognizer:recognizer];
}
-(void)screenEdge:(UIScreenEdgePanGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self alert];
    }
}
-(void)alert{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        if (self.transitioningDelegate) {
            XYWInterActionranstionDelegate* delegate = self.transitioningDelegate;
            if ([delegate isKindOfClass:[XYWInterActionranstionDelegate class]]) {
                delegate.gestureRecognizer = _screenEdgeGestureRecognizer;
                delegate.targetEdge = UIRectEdgeLeft;
            }
            
        }
//        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
