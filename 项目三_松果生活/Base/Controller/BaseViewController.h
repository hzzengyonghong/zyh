//
//  BaseViewController.h
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//创建自定义navigationbar （中间无segment）
-(void)createMoreSubview:(UIViewController *)viewCtrl name:(NSString *)name right:(BOOL)right;

@end
