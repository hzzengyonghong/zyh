//
//  Imagviewctl.m
//  项目三_松果生活
//
//  Created by mac on 16/9/5.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "Imagviewctl.h"

@interface Imagviewctl (){
    
    UIImageView *imagev;

}

@end

@implementation Imagviewctl
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
   // self.tabBarController.tabBar.hidden = NO;


}

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.userInteractionEnabled=YES;
    [self createMoreSubview:self name:@" " right:NO];
    imagev=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth,kScreenWidth*self.rate)];
    imagev.center=self.view.center;
    [imagev sd_setImageWithURL:[NSURL URLWithString:self.imagurl] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
      //  NSLog(@"%ld%ld",receivedSize,expectedSize);
    } completed:nil];
    
     [self.view addSubview:imagev];
   
    imagev.userInteractionEnabled=YES;
    UIPinchGestureRecognizer *pin=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinaction:)];
    [imagev addGestureRecognizer:pin];
    
    
}
-(void)pinaction:(UIPinchGestureRecognizer *)pin{

   


}
-(void)viewWillDisappear:(BOOL)animated{
    [imagev removeFromSuperview];

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
