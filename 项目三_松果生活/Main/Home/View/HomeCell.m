//
//  HomeCell.m
//  项目三_松果生活
//
//  Created by mac on 16/8/20.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "HomeCell.h"

#define KSongGuoNameFont 30
#define KSongGuoTimeFont 12
#define KSongGuoaddressFont 12
#define TextWeightadaption @"TextWeightadaption"
#define TextHeightadaption @"TextHeightadaption"
#define TextColor ([UIColor colorWithWhite:0.8 alpha:1])


@implementation HomeCell{
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)hModel:(HomeModel *)hmodel{
    if (_hmodel.tpye==1) {
        [self tpye1];
      
       // _ImageV.contentMode= UIViewContentModeScaleAspectFill;
    }else{
    
        [self tpye0];
    }
    
   
}
-(void)tpye1{
    _address.text=_hmodel.address;
    _name.text=_hmodel.name;
    //--------时间处理-------------//
    NSString *StartTime= [self getDate:_hmodel.st];
    NSString *endTime=[self getDate:_hmodel.et];
    _time.text=[NSString stringWithFormat:@"%@-%@",StartTime,endTime];
    [self TextWithLabel:_name WithText:_name.text WithTextLayoutType:TextHeightadaption];
    [self TextWithLabel:_time WithText:_time.text WithTextLayoutType:TextWeightadaption];
    [self TextWithLabel:_address WithText:_address.text WithTextLayoutType:TextWeightadaption];
    [_ImageV sd_setImageWithURL:[NSURL URLWithString:_hmodel.ulr]];
  
   // [_address setTextColor:TextColor];
    



}
-(void)tpye0{

    _name.text=_hmodel.title;
    _time.text=@"by 松果";
    [self TextWithLabel:_name WithText:_name.text WithTextLayoutType:TextHeightadaption];
  //  NSLog(@"%@",_hmodel.ulr);
    [_ImageV sd_setImageWithURL:[NSURL URLWithString:_hmodel.ulr]];
}




//-------时间转化格式------//
- (NSString *)getDate:(NSString *)date{
    long long time=[date longLongValue];
    
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM-dd"];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    //地区
    NSString * timeStr =[df stringFromDate:d];
    return timeStr;
}
//-------------label自适应--------------------//
-(void)TextWithLabel:(UILabel *)label
            WithText:(NSString *)text
  WithTextLayoutType:(NSString *)tpyeStr{
    label.text=text;
    
    [label setTextColor:TextColor];
    NSDictionary *attribute=@{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:20]};

    
    label.numberOfLines = 0;
    if ([tpyeStr isEqualToString:TextHeightadaption]) {
        label.lineBreakMode = NSLineBreakByWordWrapping;
        CGRect rect=[text boundingRectWithSize:CGSizeMake(kScreenWidth-20,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
        label.frame=CGRectMake(0, 0,rect.size.width, rect.size.height+10);
    }else {
        CGRect rect=[text boundingRectWithSize:CGSizeMake(MAXFLOAT,label.frame.size.height-20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
        label.frame=CGRectMake(0, 0,rect.size.width+10, rect.size.height);}
    



}







@end
