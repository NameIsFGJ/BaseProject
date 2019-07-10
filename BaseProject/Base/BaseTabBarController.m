//
//  BaseTabBarController.m
//  FGJ_project
//
//  Created by fgj on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "ShoppingViewController.h"
#import "MessageViewController.h"
#import "AddGoodViewController.h"
#import "MyselfViewController.h"

@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self initializeTabBar];
    [self setupTabbarItems];
    [self changeBackgroundColor];
}

- (void)initializeTabBar
{
    // 设置title的属性
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:20.0]}            forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithHex:@"#6E6E6E"],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:20.0]}            forState:UIControlStateNormal];
    
    //设置title的位置
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0,-10)];

    self.tabBar.translucent = NO;
}

- (void)changeBackgroundColor
{
    // 设置一个自定义 View,大小等于 tabBar 的大小
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    // 给自定义 View 设置颜色
    bgView.backgroundColor = [UIColor blackColor];
    // 将自定义 View 添加到 tabBar 上
    [self.tabBar insertSubview:bgView atIndex:0];
}

- (void)setupTabbarItems
{
    HomeViewController *vc1 = [[HomeViewController alloc]init];
    self.firstNav = [[BaseNavigationController alloc]initWithRootViewController:vc1];

    ShoppingViewController *vc2 = [[ShoppingViewController alloc]init];
    self.secndNav = [[BaseNavigationController alloc]initWithRootViewController:vc2];

    AddGoodViewController *vc3 = [[AddGoodViewController alloc]init];
    self.thirdNav = [[BaseNavigationController alloc]initWithRootViewController:vc3];

    MessageViewController *vc4 = [[MessageViewController alloc]init];
    self.fourthNav = [[BaseNavigationController alloc]initWithRootViewController:vc4];

    MyselfViewController *vc5 = [[MyselfViewController alloc]init];
    self.fifthNav = [[BaseNavigationController alloc]initWithRootViewController:vc5];

    self.firstNav.tabBarItem = [self setupTabbarItemTitle:@"首页" image:nil selectedImage:nil];
    self.secndNav.tabBarItem = [self setupTabbarItemTitle:@"商场" image:nil selectedImage:nil];
    self.thirdNav.tabBarItem = [self setupTabbarItemTitle:@"" image:@"addGood_seletc" selectedImage:@"addGood"];
    self.fourthNav.tabBarItem = [self setupTabbarItemTitle:@"消息" image:nil selectedImage:nil];
    self.fifthNav.tabBarItem = [self setupTabbarItemTitle:@"我的" image:nil selectedImage:nil];
    
    // 调整图片
    self.thirdNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6,0);
    
    self.viewControllers = @[ self.firstNav,self.secndNav, self.thirdNav, self.fourthNav,self.fifthNav];
    
}

- (UITabBarItem *)setupTabbarItemTitle:(NSString *)title
                                 image:(NSString *)image
                         selectedImage:(NSString *)imageSel
{
    UIImage *caseImage = [UIImage imageNamed:image];
   UIImage *caseImageSel = [UIImage imageNamed:imageSel];
    
    caseImage = [caseImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    caseImageSel = [caseImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:caseImage selectedImage:caseImageSel];
    return item;
}

@end
