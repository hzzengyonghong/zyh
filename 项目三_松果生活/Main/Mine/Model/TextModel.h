//
//  TextModel.h
//  项目三_松果生活
//
//  Created by mac56 on 16/9/20.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextModel : NSObject
@property (nonatomic,strong) NSString *textID;

@property (nonatomic,strong) NSString *imageURL;

@property (nonatomic,strong) NSString *title;

@property (copy, nonatomic)  NSString *type;
@end
