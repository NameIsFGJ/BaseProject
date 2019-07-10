//
//  AppInfoConstant.h
//  BaseProject
//
//  Created by 冯高杰 on 2019/7/8.
//  Copyright © 2019 冯高杰. All rights reserved.
//

#ifndef AppInfoConstant_h
#define AppInfoConstant_h

#define kTabBar_Index_Home          0
#define kTabBar_Index_Investment    1
#define kTabBar_Index_Stock         2
#define kTabBar_Index_MySpace       3

// 宽 高
#define kWindowWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kWindowHeight CGRectGetHeight([UIScreen mainScreen].bounds)

// 缩写
#define kImageName(name)    [UIImage imageNamed:name]
#define kFontSize(size)     [UIFont systemFontOfSize:size]
#endif /* AppInfoConstant_h */
