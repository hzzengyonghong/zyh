//
//  DiscoverViewController.m
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "DiscoverViewController.h"
#import "NSString+ChineseTtansformToPinyin.h"
#define classifytpye 18
@interface DiscoverViewController (){
     BOOL button1Stutus;
    UIView *classify;
    UIView *LivingView;
    UIView *edvd;
    UIScrollView *Scroller;
    UIView *coverview;
   
    


}

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createView];
   // transform:(NSString *)chinese
//    NSString *a=[NSString transform:@"中文"];
//    NSLog(@"%@",a);
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationController.navigationBar.hidden = YES;

}
-(void)_createView{
    coverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/8, kScreenWidth/8)];
    coverview.backgroundColor=[UIColor grayColor];
    coverview.alpha=0.3;
    Scroller=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight)];
    Scroller.contentSize=CGSizeMake(kScreenWidth, (1.7)*kScreenHeight);
    [self.view addSubview:Scroller];
    [self _createclassify];
    [self _createLiving];
    [self _createdvd];
    


}
-(void)_createclassify{
   classify=[[UIView alloc]initWithFrame:CGRectMake(5, 20, kScreenWidth, kScreenHeight/3)];
    classify.backgroundColor=[UIColor whiteColor];
    [Scroller addSubview:classify];
    UILabel *titileLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, classify.frame.size.height/4)];
    titileLabel.text=@"分类";
    [classify addSubview:titileLabel];
  
    [self createButtonWithView:classify WithTag:0 WithNorname:@"查看全部分类" withSelename:@"收起全部分类"WithNorImag:[UIImage imageNamed:@"all_type_down~iphone"] WithSelectedImag:[UIImage imageNamed:@"all_type_up~iphone"]];
   
   NSArray *buttonArray=@[@"品酒",@"寻味",@"看片",@"旅行",
                           @"电影",@"听歌",@"风尚",@"艺术",
                           @"家居",@"运动",@"读书",@"玩物",
                           @"雅艺",@"周刊"];
    NSLog(@"%@",[NSString transform:@"旅行"]);
    [self _createIconButtonWithButtonArray:buttonArray withView:classify];
    
    
    }


-(void)button1Action:(UIButton *)button{
    if (button.tag==0) {
        button.selected=!button.selected;
        if (button.selected==YES) {
          //  button1Stutus=1;
            classify.frame=CGRectMake(5, 64, kScreenWidth, kScreenHeight*(3/4.));
            
            Scroller.contentSize=CGSizeMake(kScreenWidth, 2*kScreenHeight);
        }else{
            classify.frame=CGRectMake(5, 64, kScreenWidth, kScreenHeight/3);
            button1Stutus=0;
            Scroller.contentSize=CGSizeMake(kScreenWidth, 1.7*kScreenHeight);
        }
        LivingView.frame=CGRectMake(5, classify.frame.size.height+5+classify.frame.origin.y, kScreenWidth, kScreenHeight/3);
        edvd.frame=CGRectMake(5, classify.frame.size.height+LivingView.frame.size.height+10, kScreenWidth, Scroller.contentSize.height-(classify.frame.size.height+LivingView.frame.size.height+10));
    }else if(button.tag==1){
      //  NSLog(@"111");
    
    }
    
 }
-(void)_createLiving{
    LivingView=[[UIView alloc]initWithFrame:CGRectMake(5, classify.frame.size.height+classify.frame.origin.y+5, kScreenWidth, kScreenHeight/3)];
    LivingView.backgroundColor=[UIColor whiteColor];
    
    [Scroller addSubview:LivingView];
    [self createButtonWithView:LivingView WithTag:1 WithNorname:@"换一换" withSelename:@"换一换" WithNorImag:[UIImage imageNamed:@"refresh~iphone"] WithSelectedImag:[UIImage imageNamed:@"refresh~iphone"]];
    NSArray *liveName=@[@"123",@"345",@"333",@"111"];
    [self _createIconButtonWithButtonArray:liveName withView:LivingView];
    
    
    

}
-(void)_createdvd{
    edvd=[[UIView alloc]initWithFrame:CGRectMake(5, classify.frame.size.height+LivingView.frame.size.height+10, kScreenWidth, Scroller.contentSize.height-(classify.frame.size.height+LivingView.frame.size.height+10))];
    edvd.backgroundColor=[UIColor redColor];
    [Scroller addSubview:edvd];
    
    


}
-(void)createButtonWithView:(UIView *)view
                    WithTag:(NSInteger)buttontag
                WithNorname:(NSString *)norstr
               withSelename:(NSString *)selstr
                WithNorImag:(UIImage *)norImag
           WithSelectedImag:(UIImage *)SelectImag {
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    button1.tag=buttontag;
    button1.frame=CGRectMake(kScreenWidth-150, 0,150,view.frame.size.height/4);
    [button1 setTitle:norstr forState:UIControlStateNormal];
    [button1 setTitle:selstr forState:UIControlStateSelected];
    [button1 setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
    [button1 setImage:norImag forState:UIControlStateNormal];
    [button1 setImage:SelectImag forState:UIControlStateSelected];
    [button1 setTitleColor:[UIColor redColor]forState:UIControlStateSelected];
    
    [view addSubview:button1];
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];


}
-(void)_createIconButtonWithButtonArray:(NSArray *)buarr
                               withView:(UIView *)view{
    
    
    for (int i=0; i<buarr.count; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        
        int  b= i%4;
        int  c=(i-b)/4;
       // NSLog(@"%d%d",b,c);
        
        NSString *imageName=[NSString stringWithFormat:@"ts_%@~iphone",[NSString transform:buarr[i]]];
        //NSLog(@"%@",imageName);
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
      
        [button setImage:[UIImage imageNamed:imageName] forState: UIControlStateSelected];
        //  NSLog(@"%@",button.imageView);
//        [button setTitle:buarr[i] forState:UIControlStateNormal];
//        [button setTitle:buarr[i] forState:UIControlStateSelected];
        
        
        button.frame=CGRectMake(kScreenWidth/16.0+b*kScreenWidth/8.0+b*kScreenWidth/8.0,kScreenWidth/12.0+c*kScreenWidth/8.0, kScreenWidth/8.0, kScreenWidth/8.0);
        button.tag=i;
        [view addSubview:button];
            [button addTarget:self action:@selector(choosetpye:) forControlEvents:UIControlEventTouchUpInside];}
    
        



}
-(void)choosetpye:(UIButton *)button{
    button.selected=!button.selected;
    if (button.selected==YES) {
        NSLog(@"1");
        coverview.center=button.center;
        [classify addSubview:coverview];
    }else {
    
        [coverview removeFromSuperview];
    
    }
    
    
    
    
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
