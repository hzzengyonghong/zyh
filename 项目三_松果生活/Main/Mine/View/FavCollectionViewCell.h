//
//  FavCollectionViewCell.h
//  项目三_松果生活
//
//  Created by mac56 on 16/9/20.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"

@interface FavCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *nick;

@property (strong, nonatomic) IBOutlet UILabel *sig;


@property (strong, nonatomic) IBOutlet UIButton *button;

@property (nonatomic,strong) PersonModel *pmodel;
@end
