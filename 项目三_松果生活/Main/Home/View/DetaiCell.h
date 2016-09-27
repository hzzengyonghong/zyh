//
//  DetaiCell.h
//  项目三_松果生活
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetaiModel.h"
@interface DetaiCell : UITableViewCell


@property(nonatomic,strong)DetaiModel *dmodel;
@property (weak, nonatomic) IBOutlet UIImageView *imagev;
@property(nonatomic,strong)NSString *urlstring;
@property(nonatomic,assign)float rate;


-(void)utrstring:(NSString *)string
        withrate:(float )rate;

@end
