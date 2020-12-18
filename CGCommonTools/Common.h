//
//  Common.h
//  BusinessMall
//
//  Created by chenhd on 16/11/16.
//  Copyright © 2016年 幽灵鲨. All rights reserved.
//

#ifndef Common_h
#define Common_h


///////////////////////////////////////////////////////////////
#pragma mark - 设备相关（硬件或者软件）
//屏幕宽度
#define UIScreenWidth   [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define UIScreenHeight  [UIScreen mainScreen].bounds.size.height

//宏定义
#define IS_IPhoneX_All ([[UIScreen mainScreen] bounds].size.height == 812.0 || [[UIScreen mainScreen] bounds].size.height == 896 || [[UIScreen mainScreen] bounds].size.height == 844 || [[UIScreen mainScreen] bounds].size.height == 926 || [[UIScreen mainScreen] bounds].size.height == 780)


//状态栏高度

#define UIStatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航条栏高度
#define UINavHeight 44+CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])


/*TabBar高度*/
#define UITabBarHeight (CGFloat)(IS_IPhoneX_All?(49.0 + 34.0):(49.0))

//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)


#pragma mark

#pragma mark - 快捷键
#define kImageNamed(s)  [UIImage imageNamed:s]
#define kColor(color)  [UIColor color]
#define kFont(f)  [UIFont systemFontOfSize:f]
#define kBoldFont(f)  [UIFont boldSystemFontOfSize:f]


#define RGBACoLor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机颜色
#define KRandomColor [UIColor colorWithHue: arc4random() % 256 / 256.0 saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1]

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define RandomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


#pragma mark - Debug日志
#ifdef DEBUG
#define DLog(FORMAT, ...) fprintf(stderr,"\n %s:%d  %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#    define DLog(...) /* */
#endif

#pragma mark- 通知中心
#define NSNOTIF_CENTER   [NSNotificationCenter defaultCenter]


#define SET_USERDEFAULTS(s,k) [[NSUserDefaults standardUserDefaults] setObject:s forKey:k]
#define SYN_USERDEFAULTS [[NSUserDefaults standardUserDefaults] synchronize]
#define GET_USERDEFAULTS(s) [[NSUserDefaults standardUserDefaults] objectForKey:s]
#define DELETE_USERDEFAU(s) [[NSUserDefaults standardUserDefaults] removeObjectForKey:s]




#define WEAK_SELF typeof(self) __weak weakSelf = self;



#endif /* Common_h */
