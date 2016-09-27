//
//  CollectionViewCell.h
//  项目三_松果生活
//
//  Created by mac56 on 16/9/20.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextModel.h"
#import "PersonModel.h"
@interface CollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *title;
//@property (weak, nonatomic) IBOutlet UIImageView *icon;
//@property (weak, nonatomic) IBOutlet UILabel *nick;
//
//@property (weak, nonatomic) IBOutlet UILabel *sig;
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (nonatomic,strong) TextModel *model;
@property (nonatomic,strong) PersonModel *pmodel;
@end
