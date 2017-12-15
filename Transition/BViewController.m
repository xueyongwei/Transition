//
//  BViewController.m
//  Transition
//
//  Created by 西方 on 2017/12/14.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "BViewController.h"
#import "XYWCrossDissolveAnimator.h"
#import "XYWCrossDissolveDisMissAniator.h"
#import "DetailViewController.h"

@interface BViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self custom];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"view will appear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}
-(void)dealloc{
    NSLog(@"dealloc");
}
-(void)custom{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(40, 40, 100, 44);
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt setTitle:@"click" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(alert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    UIButton *halfbt = [UIButton buttonWithType:UIButtonTypeCustom];
    halfbt.frame = CGRectMake(40, 140, 100, 44);
    [halfbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [halfbt setTitle:@"half present" forState:UIControlStateNormal];
    [halfbt addTarget:self action:@selector(alert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:halfbt];
}
-(void)alert{
    UIViewController *bvc = [DetailViewController new];
//    bvc.view.backgroundColor = [UIColor whiteColor];
    bvc.modalPresentationStyle = UIModalPresentationFullScreen;
    bvc.transitioningDelegate = self;
    [self presentViewController:bvc animated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [XYWCrossDissolveAnimator new];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [XYWCrossDissolveAnimator new];
//    return nil;
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
