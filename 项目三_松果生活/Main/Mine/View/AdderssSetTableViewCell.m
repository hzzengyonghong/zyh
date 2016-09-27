//
//  AdderssSetTableViewCell.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/18.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "AdderssSetTableViewCell.h"

@implementation AdderssSetTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    
}
-(void)setModel:(AdressModel *)model{
    
    _model = model;
    _name.text = _model.name;
    _mobile.text = _model.mobile;
    _address.text = _model.address;
    _addressID = _model.addressID;
    
}
- (IBAction)buttonAction:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
