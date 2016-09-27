//
//  BaseViewController.m
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createMoreSubview:(UIViewController *)viewCtrl name:(NSString *)name right:(BOOL)right{
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
    viewCtrl.navigationItem.leftBarButtonItem = buttonItem;
    
    //右按钮
    if (right == YES) {
            UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
            rightButtonItem.tintColor = [UIColor blackColor];
            viewCtrl.navigationItem.rightBarButtonItem = rightButtonItem;
    }else{
        
    }
    
    //中
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-80, 0, 160, 44)];
    label.text = name;
    label.textColor = [UIColor orangeColor];
    label.textAlignment = UITextAlignmentCenter;
    [self.navigationController.navigationBar addSubview:label];
    
    
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
