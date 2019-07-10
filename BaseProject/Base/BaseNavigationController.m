//
//  BaseNavigationController.m
//  FGJ_project
//
//  Created by fgj on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation BaseNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak BaseNavigationController * weakSelf = self;
    [self.navigationBar setBarTintColor:kMainRedColor];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
    self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [UIView setAnimationsEnabled:YES];
    if ( animated && [self respondsToSelector:@selector(interactivePopGestureRecognizer)] )
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [UIView setAnimationsEnabled:YES];
    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [UIView setAnimationsEnabled:YES];
    if ( animated && [self respondsToSelector:@selector(interactivePopGestureRecognizer)] )
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    NSArray * array = [super popToRootViewControllerAnimated:animated];
    return array;
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [UIView setAnimationsEnabled:YES];
    if ( animated && [self respondsToSelector:@selector(interactivePopGestureRecognizer)] )
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return [super popToViewController:viewController animated:animated];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    [UIView setAnimationsEnabled:YES];
    if( animated && [self respondsToSelector:@selector(interactivePopGestureRecognizer)] )
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return [super setViewControllers:viewControllers animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ( gestureRecognizer == self.interactivePopGestureRecognizer )
    {
        if ( self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    
    return YES;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

@end
