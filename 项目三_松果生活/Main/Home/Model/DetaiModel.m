//
//  DetaiModel.m
//  项目三_松果生活
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "DetaiModel.h"

@implementation DetaiModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             //key Model类中属性的名字
             //value 字典中，属性对应的Key
             @"userid;" : @"id"
             };
    
}

@end
