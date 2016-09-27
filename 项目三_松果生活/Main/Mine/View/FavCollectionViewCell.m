//
//  FavCollectionViewCell.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/20.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "FavCollectionViewCell.h"

@implementation FavCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setPmodel:(PersonModel *)pmodel{
    _pmodel = pmodel;
    _icon.layer.cornerRadius = 40;
    _icon.layer.masksToBounds = YES;
    [_icon sd_setImageWithURL:[NSURL URLWithString:pmodel.icon]];
    _nick.text = _pmodel.nick;
    _sig.text =_pmodel.signature;
    
}
@end
