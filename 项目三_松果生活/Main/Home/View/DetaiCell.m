//
//  DetaiCell.m
//  项目三_松果生活
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "DetaiCell.h"
//#define TextWeightadaption @"TextWeightadaption"
//#define TextHeightadaption @"TextHeightadaption"
#define kImgeWith  (kScreenWidth-10)
#define kImageX   20
#define kImageY   20

@implementation DetaiCell{
    
       
        
    
    
}
-(void)utrstring:(NSString *)string
        withrate:(float )rate{
        _urlstring=string;
    if (_urlstring!=NULL) {
       [ _imagev sd_setImageWithURL:[NSURL URLWithString:_urlstring]];
        _rate=rate;
        _imagev.frame=CGRectMake(kImageX, kImageY, kImgeWith, kImgeWith*rate);
       
    }
}
- (void)awakeFromNib {
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark labelframe

@end
