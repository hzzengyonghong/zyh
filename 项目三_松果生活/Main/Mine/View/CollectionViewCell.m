//
//  CollectionViewCell.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/20.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(TextModel *)model{
    _model = model;
    
    
    _title.text = model.title;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.imageURL]];
   
}

@end
