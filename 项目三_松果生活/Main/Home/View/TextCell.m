//
//  TextCell.m
//  项目三_松果生活
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "TextCell.h"

@implementation TextCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)textWithstring:(NSString *)textstr
         
{
  
    _textstr=textstr;
   
    _TextLabel.text=_textstr;
    [self TextWithLabel:_TextLabel WithText:_TextLabel.text];
    
    
   
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)TextWithLabel:(UILabel *)label
            WithText:(NSString *)text{
    
    label.numberOfLines=0;
  
    
    NSDictionary *attribute=@{NSFontAttributeName :[UIFont systemFontOfSize:15]};
    CGRect rect=[text boundingRectWithSize:CGSizeMake(kScreenWidth-20,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    label.frame=CGRectMake(0, 0, kScreenWidth-10, rect.size.height+10);
   
   
    
  
    
}



@end
