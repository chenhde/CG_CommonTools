//
//  UIButton+Tools.m
//  RGBasic
//
//  Created by robin on 2017/9/21.
//  Copyright © 2017年 robin. All rights reserved.
//

#import "UIButton+Tools.h"
#import <objc/runtime.h>


@implementation UIButton (Tools)
@dynamic timer;

- (dispatch_source_t)timer{
    
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setTimer:(dispatch_source_t)timer{
    
    return objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_ASSIGN);
}

- (void)addTimerWithCountTime:(NSTimeInterval)time{
    
    self.enabled = NO;
    __block NSTimeInterval maxTime = time;
    __block NSTimeInterval countTime = time;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        
        if (countTime <= 0) {
            countTime = maxTime;
            [self setTitle:@"获取验证码" forState:UIControlStateNormal];
            self.enabled = YES;
            dispatch_source_cancel(timer);
            return ;
        }
        [self setTitle:[NSString stringWithFormat:@"重新发送(%is)",(int)(countTime--)] forState:UIControlStateNormal];
        
    });
    
    dispatch_resume(timer);
    self.timer = timer;
}

@end
