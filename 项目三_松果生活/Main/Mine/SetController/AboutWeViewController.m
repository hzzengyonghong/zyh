//
//  AboutWeViewController.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/13.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "AboutWeViewController.h"

@interface AboutWeViewController ()

@end

@implementation AboutWeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMoreSubview:self name:@"关于我们" right:NO];
    
    
    
    
}

-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    
    //    self.navigationController.navigationBar.hidden = YES;
    //    self.tabBarController.tabBar.hidden = NO;
}

-(void)resetButtonAction{
    NSLog(@"编辑");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
