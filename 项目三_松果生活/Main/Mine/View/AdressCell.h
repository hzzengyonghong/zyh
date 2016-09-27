//
//  AdressCell.h
//  项目三_松果生活
//
//  Created by mac56 on 16/9/14.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdressModel.h"
@interface AdressCell : UITableViewCell

//@property (nonatomic,strong) NSString *name;
//@property (nonatomic,strong) NSString *address;
//@property (nonatomic,strong) NSString *mobile;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *mobile;

@property (strong, nonatomic) IBOutlet UILabel *address;



@property (nonatomic,strong) AdressModel *model;

@end
