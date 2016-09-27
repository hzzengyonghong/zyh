//
//  TitleCell.h
//  项目三_松果生活
//
//  Created by mac on 16/9/9.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "DetaiModel.h"
@interface TitleCell : UITableViewCell
//@property(nonatomic,strong)NSString *iconURL;
//@property(nonatomic,strong)NSString *signature;
@property(nonatomic,strong)DetaiModel *dmoel;
@property (weak, nonatomic) IBOutlet UIImageView *IconImage;

@property (weak, nonatomic) IBOutlet UILabel *signatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;



-(void)Dmodel:(DetaiModel *)dmoel;


@end
