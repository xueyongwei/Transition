//
//  AViewController.m
//  Transition
//
//  Created by 西方 on 2017/12/14.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "AViewController.h"
#import "XYWInterActionranstionDelegate.h"
#import "DetailViewController.h"

@interface AViewController ()
{
    XYWInterActionranstionDelegate *_detailTranstionDelegate;
}
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self custom];
    // Do any additional setup after loading the view.
}

-(void)custom{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(40, 40, 100, 44);
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt setTitle:@"click" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIScreenEdgePanGestureRecognizer *swip = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(viewSwap:)];
    swip.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:swip];
    [self.view addSubview:bt];
}
-(void)clickButton:(UIButton *)sender{
    
    [self onPresnetClick:sender];
}
-(void)viewSwap:(UIScreenEdgePanGestureRecognizer *)recognizer{
    NSLog(@"swap %ld",(long)recognizer.state);
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self onPresnetClick:recognizer];
    }
}
-(void)onPresnetClick:(id)sender{
    XYWInterActionranstionDelegate *delegate = [[XYWInterActionranstionDelegate alloc]init];
    if ([sender isKindOfClass:[UIButton class]]) {
        delegate.gestureRecognizer = nil;
    }else if ([sender isKindOfClass:[UIGestureRecognizer class]]){
        delegate.gestureRecognizer = sender;
    }
    delegate.targetEdge = UIRectEdgeRight;
    
    _detailTranstionDelegate = delegate;
    
    DetailViewController *dvc = [[DetailViewController alloc]init];
    dvc.modalPresentationStyle = UIModalPresentationFullScreen;
    dvc.transitioningDelegate = delegate;
    [self presentViewController:dvc animated:YES completion:nil];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"A->viewDidDisappear");
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
