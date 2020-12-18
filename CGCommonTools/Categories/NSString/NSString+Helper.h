//
//  NSString+Helper.h
//  LuckDriver
//
//  Created by pg on 15/9/22.
//  Copyright © 2015年 HCW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

/**
 *  判断传入的字符串是不是空
 *
 *  @param string 判断的字符串
 *
 *  @return 结果
 */
+ (BOOL)isNullOrEmpty:(NSString *)string;

/**
 *  清除空格
 */
- (NSString *)cleanSpace;

/**
 *  汉字的拼音
 *
 *  @return 拼音
 */
- (NSString *)pinyin;

/**
 Unicode encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *)stringByUnicodeEncode;

/**
 Unicode decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *)stringUnicodeDecode;

@end
