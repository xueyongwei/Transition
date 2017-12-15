//
//  ViewController.m
//  Transition
//
//  Created by 西方 on 2017/12/14.
//  Copyright © 2017年 xueyongwei. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "BViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *placeView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation ViewController
{
    UIViewController *_currentVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    AViewController *avc = [AViewController new];
    [self addChildViewController:avc];
    
    BViewController *bvc  = [BViewController new];
    [self addChildViewController:bvc];
    
    [self.view insertSubview:avc.view belowSubview:self.segmentedControl];
    
    [self.placeView addSubview:avc.view];
    _currentVC = avc;
    
    [UIView animateWithDuration:2.0 animations:^{
        NSLog(@"animateWithDuration");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)segmentedControlChanged:(UISegmentedControl *)sender {
    UIViewController *toVC = self.childViewControllers[sender.selectedSegmentIndex];
    if (toVC != _currentVC) {
        [self repleaceVC:_currentVC toNewVC:toVC];
    }
    
}

- (IBAction)onclick:(id)sender {
   
   
}

-(void)repleaceVC:(UIViewController *)oldVc toNewVC:(UIViewController *)newVC{
    [self transitionFromViewController:oldVc toViewController:newVC duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
    } completion:^(BOOL finished) {
        _currentVC = newVC;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
