//
//  BaseViewController.m
//  BaseProject
//
//  Created by RockyYe on 2017/8/8.
//  Copyright © 2017年 RockyYe. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "UIImage+Category.h"

@interface BaseViewController () <UIGestureRecognizerDelegate, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

@end

@implementation BaseViewController
- (void (^)(void))navigationBlock
{
    if (self.navigationController && [self.navigationController isKindOfClass:[BaseNavigationController class]]) {
        BaseNavigationController *baseNavigation = (BaseNavigationController *)self.navigationController;
        if (baseNavigation.commandBlock) {
            return baseNavigation.commandBlock;
        }else{
            return  nil;
        }
    }
    return nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self commonInit];
     self.extendedLayoutIncludesOpaqueBars = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hideProgress];
    [self resetNavigationBar];
    self.tabBarController.tabBar.hidden = [self setupTarbarHidden];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self hideProgress];
}

- (void)dealloc
{
   // DDLogVerbose(@"\n【%@】has dealloc\n", [self class]);
}

- (BOOL)setupTarbarHidden
{
    return NO;
}

- (void)commonInit
{
    /// 初始化背景颜色
    [self initializeBackgroundColor];
    /// 初始化title
    [self initializeTitle];
    /// 初始化navigationBar外观
    [self initializeNavigationBarAppearance];
    /// 初始化navigationBarLeftItems
    [self initializeNavigationBarLeftItems];
    /// 初始化statusBar
    [self initializeStatusBarAppearance];
    /// 初始化loadingView
   // [self initializeLoadingView];
    /// 初始化ScrollView
    [self initializeScrollView];
}

- (void)resetNavigationBar
{
    /// 初始化navigationBar外观
    [self initializeNavigationBarAppearance];
    /// 初始化navigationBarLeftItems
    [self initializeNavigationBarLeftItems];
    /// 初始化statusBar
    [self initializeStatusBarAppearance];
}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
    return NO;
}

- (void)initializeScrollView
{
    if ([self respondsToSelector:@selector(tableView)])
    {
        if (@available(iOS 11.0, *))
        {
            [[self performSelector:@selector(tableView)] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }
        else
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
}


- (void)initializeBackgroundColor
{
    self.view.backgroundColor = kBackgroundColor;
}

- (void)initializeTitle
{
    self.navigationItem.title = self.title;
}

- (void)initializeNavigationBarAppearance
{
    if ([self navigationBarColor] != nil)
    {
        [self.navigationController.navigationBar setBarTintColor:[self navigationBarColor]];
    }
    [self.navigationController.navigationBar setTitleTextAttributes:[self navigationBarTitleAttribute]];
}

- (void)initializeStatusBarAppearance
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (UIColor *)navigationBarColor
{
    UINavigationBar * navigationBar = self.navigationController.navigationBar;
    navigationBar.translucent = NO;
    UIImage * image = [UIImage imageFromColor:kMainRedColor];
    [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    return nil;
}

- (NSDictionary *)navigationBarTitleAttribute
{
    return @{
             NSForegroundColorAttributeName:kWhiteColor,
             };
}

- (void)initializeNavigationBarLeftItems
{
    if (self.navigationItem.leftBarButtonItems == nil)
    {
        if ( self.navigationController.viewControllers.count > 1)
        {
            self.navigationItem.leftBarButtonItems = @[[self backButtonItem]];
        }
    }
}

- (UIBarButtonItem *)backButtonItem
{
    UIImage *img = kImageName(@"common_white_back");
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:img
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(actionBack:)];
    item.tintColor = kWhiteColor;
    return item;
}

- (void)actionBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

