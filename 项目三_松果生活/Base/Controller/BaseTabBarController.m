//
//  BaseTabBarController.m
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()
{
//    BOOL buttonSelect[4];
    
}
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)init{
    self = [super init];
    if (self) {
        
        
        [self _createSubviews];
        [self _createToolBar];
        
       
        
        
    }
    return self;
    
}
-(void)_createSubviews{
    
    //加载sb
    NSArray *array = @[@"Home",@"Discover",@"Activity",@"Mine"];
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    
    for (NSString *sbName in array) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:[NSBundle mainBundle]];
        
        UINavigationController *nav = [sb instantiateInitialViewController];
        [mArray addObject:nav];
        
    }
    self.viewControllers = [mArray copy];
    
    
    
    
}
-(void)_createToolBar{
    
    //删除原有的系统按钮
    for (UIView *subview in self.tabBar.subviews) {
        Class buttonClass = NSClassFromString(@"UITabBarButton");
        if ([subview isKindOfClass:buttonClass]) {
            [subview removeFromSuperview];
        }
    }
    
    //自定义button 的 图案位置
    NSArray *buttonActiveImage = @[@"tab_home_active~iphone",
                                   @"tab_explore_active~iphone",
                                   @"tab_event_active~iphone",
                                   @"tab_me_active~iphone"];
    
    NSArray *buttonImage = @[@"tab_home~iphone",
                             @"tab_explore~iphone",
                             @"tab_event~iphone",
                             @"tab_me~iphone"];
    NSArray *buttonName = @[@"精选",
                            @"探索",
                            @"活动",
                            @"我"];
    
    CGFloat buttonWidth = kScreenWidth/4;
    for (int i = 0; i<4; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*buttonWidth, 0, buttonWidth, 34)];
        [button setImage:[UIImage imageNamed:buttonImage[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonActiveImage[i]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//        button.selected = YES;
        
        [self.tabBar addSubview:button];
        
        button.tag = 100+i;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 34, buttonWidth, 10)];
        [label setText:buttonName[i]];
        label.tag = 200+i;
        label.textAlignment =UITextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [button addSubview:label];
    }
    //主页button设为已选中状态
    UIButton *homeButton = [self.view viewWithTag:100];
    homeButton.selected = YES;
    UILabel *homeLabel = [self.view viewWithTag:200];
    homeLabel.textColor = [UIColor orangeColor];
    
    
    
}
-(void)buttonAction:(UIButton *)button{
    
    //点击触发时，所有button都变成未选中
    for (int i = 0; i<4 ; i++) {
        UIButton *tagButton = [self.view viewWithTag:100+i];
        tagButton.selected = NO;
        UILabel *tagLabel = [self.view viewWithTag:200+i];
        tagLabel.textColor = [UIColor blackColor];
        
        
    }
    //当前button变成选中
    button.selected = YES;
    UILabel *label = [self.view viewWithTag:button.tag+100];
    label.textColor = [UIColor orangeColor];
    
    
    
    //当前button决定tab的页数
    self.selectedIndex = button.tag-100;
    
    
}
//-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//    
//}
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
