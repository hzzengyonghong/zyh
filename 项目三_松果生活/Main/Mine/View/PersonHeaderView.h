//
//  PersonHeaderView.h
//  项目三_松果生活
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"
@interface PersonHeaderView : UIView
@property (nonatomic ,strong)UIImageView *image;
@property (nonatomic ,strong)UILabel *name;
@property (nonatomic ,strong)UILabel *text;


@property(nonatomic ,strong)PersonModel *model;

@end
