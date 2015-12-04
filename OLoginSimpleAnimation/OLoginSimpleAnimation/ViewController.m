//
//  ViewController.m
//  OLoginSimpleAnimation
//
//  Created by WangZhipeng on 15/12/4.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageLogo;

@property (weak, nonatomic) IBOutlet UIView *viewAccount;
@property (weak, nonatomic) IBOutlet UIView *viewPassword;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonWidth;

@property (weak, nonatomic) IBOutlet UIView *viewLink;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self configureAnimation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Override View Method
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - Private
- (void)configureView {
    _imageLogo.transform = CGAffineTransformMakeTranslation(0, -200);
    _viewAccount.transform = CGAffineTransformMakeTranslation(-300, 0);
    _viewPassword.transform = CGAffineTransformMakeTranslation(300, 0);
    _buttonWidth.constant = 0;
}

- (void)configureAnimation {
    {
        __weak ViewController *weakSelf = self;
        [UIView animateWithDuration:2 animations:^{
            weakSelf.imageLogo.transform = CGAffineTransformIdentity;
        }];
    }
    
    {
        __weak ViewController *weakSelf = self;
        [UIView animateWithDuration:2 animations:^{
            weakSelf.viewAccount.transform = CGAffineTransformIdentity;
        }];
    }
    
    {
        __weak ViewController *weakSelf = self;
        [UIView animateWithDuration:2 animations:^{
            weakSelf.viewPassword.transform = CGAffineTransformIdentity;
        }];
    }
    
    {
        _buttonWidth.constant = 340;
        __weak ViewController *weakSelf = self;
        [UIView animateWithDuration:2 animations:^{
            [weakSelf.view layoutIfNeeded];
        }];
    }
    
    {
        CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,
                                                                          0,
                                                                          0,
                                                                          CGRectGetHeight(_viewLink.bounds))].CGPath;
        CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,
                                                                        0,
                                                                        CGRectGetWidth(_viewLink.bounds),
                                                                        CGRectGetHeight(_viewLink.bounds))].CGPath;
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.fillColor = [UIColor whiteColor].CGColor;
        layer.path = beginPath;
        _viewLink.layer.mask = layer;
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.duration = 2;
        animation.beginTime = CACurrentMediaTime() + 0;
        animation.fromValue = (id)layer.path;
        animation.toValue = (__bridge id)endPath;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [layer addAnimation:animation forKey:@"shapeLayerPath"];
    }
}

@end
