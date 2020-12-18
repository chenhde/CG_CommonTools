//
//  UIButton+Tools.h
//  RGBasic
//
//  Created by robin on 2017/9/21.
//  Copyright © 2017年 robin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Tools)
@property (nonatomic ,assign) dispatch_source_t timer;
- (void)addTimerWithCountTime:(NSTimeInterval)time;
@end
