//
//  NSMutableURLRequest+tag.m
//  项目三_松果生活
//
//  Created by mac55 on 16/9/22.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "NSMutableURLRequest+tag.h"
#import <objc/runtime.h>
static const char kRequesttag;
@implementation NSMutableURLRequest (tag)


-(void)setRequesttag:(NSString *)Requesttag{

  objc_setAssociatedObject(self,&kRequesttag ,Requesttag,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)Requesttag{
    return objc_getAssociatedObject(self, &kRequesttag);

}
@end
