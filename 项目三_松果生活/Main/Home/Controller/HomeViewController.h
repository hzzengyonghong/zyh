//
//  HomeViewController.h
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController : BaseViewController
@property(nonatomic,strong)NSDictionary *hmodelDic;
@property (nonatomic,strong) NSMutableArray *refreshImages; //刷新动画的图片数组
@property (nonatomic,strong) NSMutableArray *normalImages;//普通状态下的图片数组
@property (nonatomic,strong) NSTimer *timer;//模拟数据刷新需要的时间控制器
@property (nonatomic,assign) int time;
@property(nonatomic,assign)float contenoffsety;

@end
