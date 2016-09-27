//
//  TitleCell.m
//  项目三_松果生活
//
//  Created by mac on 16/9/9.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)Dmodel:(DetaiModel *)dmoel{
    _dmoel=dmoel;
 
    if (![_dmoel.icon isKindOfClass:[NSNull class]]) {
        [_IconImage sd_setImageWithURL:[NSURL URLWithString:_dmoel.icon]];
      
        }
    _IconImage.layer.cornerRadius=_IconImage.frame.size.width/2;
    _IconImage.layer.masksToBounds=YES;
    if (![_dmoel.signature isKindOfClass:[NSNull class]]) {
        _signatureLabel.numberOfLines=0;
        _nickLabel.numberOfLines=0;
        _signatureLabel.text=_dmoel.signature;
        _nickLabel.text=_dmoel.nick;
    }
    
  
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
