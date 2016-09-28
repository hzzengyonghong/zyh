//
//  HomeCell.h
//  项目三_松果生活
//
//  Created by mac on 16/8/20.
//  Copyright © 2016年 CW. All rights reserved.
//
#pragma mark 图片处理存在问题
#import <UIKit/UIKit.h>
#import "HomeModel.h"



@interface HomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ImageV;

//@property (weak, nonatomic) IBOutlet UIView *TextV;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property(strong,nonatomic)HomeModel *hmodel;


-(void)hModel:(HomeModel *)hmodel;
-(NSString *)getDate:(NSString *)date;

;


@end
