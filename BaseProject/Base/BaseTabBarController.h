//
//  BaseTabBarController.h
//  FGJ_project
//
//  Created by fgj on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationController.h"
@interface BaseTabBarController : UITabBarController
@property (strong, nonatomic) BaseNavigationController *firstNav;
@property (strong, nonatomic) BaseNavigationController *secndNav;
@property (strong, nonatomic) BaseNavigationController *thirdNav;
@property (strong, nonatomic) BaseNavigationController *fourthNav;
@property (strong, nonatomic) BaseNavigationController *fifthNav;

@end
