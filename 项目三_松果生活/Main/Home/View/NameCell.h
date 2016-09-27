//
//  NameCell.h
//  项目三_松果生活
//
//  Created by mac55 on 16/9/14.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetaiModel.h"

@interface NameCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property(nonatomic,strong)DetaiModel *dmoel;
-(void)Name:(DetaiModel *)dmodel;

@end
