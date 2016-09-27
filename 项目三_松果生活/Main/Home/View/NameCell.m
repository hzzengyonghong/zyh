//
//  NameCell.m
//  项目三_松果生活
//
//  Created by mac55 on 16/9/14.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "NameCell.h"

@implementation NameCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)Name:(DetaiModel *)dmodel{
    _dmoel=dmodel;
    
    _NameLabel.text=_dmoel.name;
    [self TextWithLabel:_NameLabel WithText:_NameLabel.text];

}
-(void)TextWithLabel:(UILabel *)label
            WithText:(NSString *)text{
      label.numberOfLines=0;
    NSDictionary *attribute=@{NSFontAttributeName :[UIFont systemFontOfSize:15]};
    CGRect rect=[text boundingRectWithSize:CGSizeMake(kScreenWidth-20,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    label.frame=CGRectMake(0, 0, kScreenWidth-10, rect.size.height+10);
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
