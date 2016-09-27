//
//  AdressCell.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/14.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "AdressCell.h"

@implementation AdressCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(AdressModel *)model{
    _model = model;
    
    
    
    _name.text = model.name;
    _mobile.text = model.mobile;
    _address.text = model.address;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
