//
//  AdderssSetTableViewCell.h
//  项目三_松果生活
//
//  Created by mac56 on 16/9/18.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdressModel.h"
@interface AdderssSetTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *address;

@property (strong, nonatomic) IBOutlet UILabel *mobile;

@property (nonatomic,strong) NSString *addressID;



@property (nonatomic,strong) AdressModel *model;
@end
