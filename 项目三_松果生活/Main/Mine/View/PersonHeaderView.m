//
//  PersonHeaderView.m
//  项目三_松果生活
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "PersonHeaderView.h"

@implementation PersonHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    self = [super init];
    if (self) {
        self.image = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-50, 50, 100, 100)];
        //-------------------------------------------------------------------
        _image.layer.cornerRadius = 50;
        _image.layer.masksToBounds=YES;
//        self.image.backgroundColor = [UIColor greenColor];
        
        [self addSubview:_image];
        
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-100, 180, 200, 30)];
        
//        _name.text = @"昵称";
        _name.textAlignment = NSTextAlignmentCenter ;
        _name.textColor = [UIColor orangeColor];
        [self addSubview:_name];
        self.text = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-100, 220, 200, 30)];
//        _text.text = @"签名";
        _text.textAlignment = NSTextAlignmentCenter ;
        [self addSubview:_text];
    }
    return self;
}
-(void)setModel:(PersonModel *)model{
    _model = model;
    
    _name.text = _model.nick;
    
    _text.text = _model.signature;
    
    [_image sd_setImageWithURL:[NSURL URLWithString:_model.icon]];
    
    
    
    
    
    
    
    
}

@end
