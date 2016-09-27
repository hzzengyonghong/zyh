//
//  JoinActivityctl.m
//  项目三_松果生活
//
//  Created by mac55 on 16/9/12.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "JoinActivityctl.h"

@interface JoinActivityctl ()

@end

@implementation JoinActivityctl
-(void)viewWillAppear:(BOOL)animated{
    NSArray *views = [self.navigationController.navigationBar subviews];
        for (UIView *view in views) {
            [view removeFromSuperview];
        }
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -20, kScreenWidth, 69)];
        view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.2];
        [self.navigationController.navigationBar insertSubview:view atIndex:0];
        //左按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 40, 40);
        [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"nav_back~iphone"] forState:UIControlStateNormal];
        UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = buttonItem;
        
    
        
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled=YES;
//    [self createMoreSubview:self name:@" " right:NO];
    // Do any additional setup after loading the view from its nib.
}
-(void)awakeFromNib{
    [super awakeFromNib];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
  
}











/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
