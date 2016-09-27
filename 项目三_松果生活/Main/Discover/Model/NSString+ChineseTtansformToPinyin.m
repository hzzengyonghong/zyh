//
//  NSString+ChineseTtansformToPinyin.m
//  项目三_松果生活
//
//  Created by mac55 on 16/9/27.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "NSString+ChineseTtansformToPinyin.h"

@implementation NSString (ChineseTtansformToPinyin)
+ (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    return [pinyin stringByReplacingOccurrencesOfString:@" " withString:@"" ];
}
@end
