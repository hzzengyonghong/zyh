//
//  TextCell.h
//  项目三_松果生活
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetaiModel.h"
@interface TextCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TextLabel;
@property(nonatomic,strong) DetaiModel *dmoel;
@property(nonatomic,strong)NSString *textstr;
@property(nonatomic,assign)NSInteger height;
-(void)textWithstring:(NSString *)textstr;


@end
