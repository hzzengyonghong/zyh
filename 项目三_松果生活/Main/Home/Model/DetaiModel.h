//
//  DetaiModel.h
//  项目三_松果生活
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetaiModel : NSObject
//招募图片需要
//@property(nonatomic,strong)NSString *et;
//@property(nonatomic,strong)NSString *st;
//@property(nonatomic,strong)NSString *address;
//@property(nonatomic,assign)NSInteger *maxAttendees;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *text;
@property(nonatomic,assign)NSInteger width;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,assign)NSInteger tp;
@property(nonatomic,assign)BOOL  needblank;
@property(nonatomic,assign)NSString *namestr;

//user
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *nick;
@property(nonatomic,strong)NSString *signature;
@property(nonatomic,strong)NSString *userid;
///

@property(nonatomic,strong)NSString *headurl;

//
//公共
@property(nonatomic,assign)NSInteger favorite;
@property(nonatomic,strong)NSString *isSubTitle;


@end
