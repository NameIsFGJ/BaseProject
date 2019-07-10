//
//  BaseNavigationController.h
//  FGJ_project
//
//  Created by fgj on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController
@property (nonatomic, copy) void (^commandBlock)(void);
@end
