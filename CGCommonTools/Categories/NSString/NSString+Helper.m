//
//  NSString+Helper.m
//  LuckDriver
//
//  Created by pg on 15/9/22.
//  Copyright © 2015年 HCW. All rights reserved.
//





#import "NSString+Helper.h"



@implementation NSString (Helper)



- (NSString *)cleanSpace
{
    //过滤字符串前后的空格
    NSString *reslut = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    reslut = [reslut stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return reslut;
}
//汉字的拼音
- (NSString *)pinyin
{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform(( CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

-(NSString *)stringByUnicodeEncode{
    
    NSUInteger length = [self length];
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        NSMutableString *s = [NSMutableString stringWithCapacity:0];
        unichar _char = [self characterAtIndex:i];
        // 判断是否为英文和数字
        if (_char <= '9' && _char >='0'){
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='a' && _char <= 'z'){
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i,1)]];
        }else{
            // 中文和字符
            [s appendFormat:@"\\u%x",[self characterAtIndex:i]];
            // 不足位数补0 否则解码不成功
            if(s.length == 4) {
                [s insertString:@"00" atIndex:2];
            } else if (s.length == 5) {
                [s insertString:@"0" atIndex:2];
            }
        }
        [str appendFormat:@"%@", s];
    }
    return str;
    
}

-(NSString *)stringUnicodeDecode {
    
    
//    NSMutableString *convertedString = [self mutableCopy];
//    [convertedString replaceOccurrencesOfString:@"\\U"
//                                     withString:@"\\u"
//                                        options:0
//                                          range:NSMakeRange(0, convertedString.length)];
//    CFStringRef transform = CFSTR("Any-Hex/Java");
//    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
//    return convertedString;
    
    
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
//    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
//    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2]stringByAppendingString:@"\""];
    NSData *tempData = [tempStr1 dataUsingEncoding:NSUTF8StringEncoding];
//    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
//                                                          mutabilityOption:NSPropertyListImmutable
//                                                                    format:NULL
//                                                          errorDescription:NULL];
    
     NSError *error = nil;
    NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:0 format:NULL error:&error];
    
    
    
    return returnStr;
    
    
}



@end
