//
//  DiscoverViewController.m
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "DiscoverViewController.h"
#import "NSString+ChineseTtansformToPinyin.h"
#import "TopicModel.h"
#import "authorModel.h"
#import "NSMutableURLRequest+tag.h"
#define classifytpye 18
#define classifyHeight (kScreenHeight/5)
#define LivingViewHeight (kScreenHeight/3)
#define DiscoverAauthorURL  @"http://songguolife.com/api/author/recommend?from=244&count=4"

#define KDiscoverURL  @"http://songguolife.com/api/topic?count=20&since=0&until=0"





@interface DiscoverViewController (){
     BOOL button1Stutus;
    UIView *classify;
    UIView *LivingView;
    UIView *edvd;
    UIScrollView *Scroller;
    UIView *coverview;
    NSArray *TmodelArray;
    NSArray *IconArray;
 
   
    


}

@end

@implementation DiscoverViewController
-(void)viewWillDisappear:(BOOL)animated{
 

}






-(void)viewWillAppear:(BOOL)animated{
     IconArray=[[NSArray alloc]init];
    dispatch_queue_t queue=dispatch_queue_create("queu1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSMutableURLRequest   *request=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:KDiscoverURL] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        NSURLSession *session=[NSURLSession sharedSession];
        // NSLog(@"%@",req.URL);
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSArray *array= [NSJSONSerialization
                             JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            NSMutableArray *topArray=[NSMutableArray array];
            for (int i=0; i<array.count; i++) {
                TopicModel *top=[[TopicModel alloc]init];
                top.title=[array[i] valueForKey:@"title"];
                top.imageURL=[[array[i] valueForKey:@"topImage"]valueForKey:@"url"];
                [topArray addObject:top];
            }
            [self performSelectorOnMainThread:@selector(_createView:) withObject:[topArray copy] waitUntilDone:YES];
            
            
        }];
        
        [dataTask resume];
    
    });dispatch_async(queue, ^{
        NSMutableURLRequest   *request=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:DiscoverAauthorURL] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        NSURLSession *session=[NSURLSession sharedSession];
       
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         
           NSArray *array= [NSJSONSerialization
                             JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            NSMutableArray *mrray=[NSMutableArray array];
            for (int i=0; i<array.count; i++) {
                authorModel *amodel=[[authorModel alloc]init];
                amodel.nick=[array[i] valueForKey:@"nick"];
                amodel.iconURL=[array[i] valueForKey:@"icon"];
              
                
                amodel.authorID=[array[i] valueForKey:@"id"];
                [mrray addObject:amodel];
                }
            [self performSelectorOnMainThread:@selector(marray:) withObject:mrray waitUntilDone:NO];
            
        }];
        
        [dataTask resume];
        
    });

 
}
-(void)marray:(NSMutableArray *)mray{
    IconArray=[mray copy];
   // NSLog(@"%@",IconArray);
}
- (void)viewDidLoad {

    [super viewDidLoad];
   
    Scroller=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight)];
    Scroller.contentSize=CGSizeMake(kScreenWidth, (1.9)*kScreenHeight);
    [self.view addSubview:Scroller];

    self.view.backgroundColor = [UIColor colorWithRed:255 green:255 blue:224 alpha:1];
    self.navigationController.navigationBar.hidden = YES;
    //NSLog(@"%@",IconArray);
}
-(void)_createView:(NSArray *)array{
    TmodelArray=array ;
  
    coverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/6, kScreenWidth/6)];
    coverview.backgroundColor=[UIColor grayColor];
    coverview.alpha=0.3;
  
    [self _createclassify];
    [self _createLiving];
    [self _createdvd];
    
}
-(void)_createclassify{
   classify=[[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, classifyHeight)];
    classify.backgroundColor=[UIColor whiteColor];
    [Scroller addSubview:classify];
    UILabel *titileLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 60, classify.frame.size.height/4)];
    titileLabel.text=@"分类";
    [classify addSubview:titileLabel];
  
    [self createButtonWithView:classify WithTag:0 WithNorname:@"查看全部分类" withSelename:@"收起全部分类"WithNorImag:[UIImage imageNamed:@"all_type_down~iphone"] WithSelectedImag:[UIImage imageNamed:@"all_type_up~iphone"]];
   
    NSArray *buttonArray=@[@"品酒",@"寻味",@"看片",@"旅行",
                           @"电影",@"听歌",@"风尚",@"艺术",
                           @"家居",@"运动",@"读书",@"玩物",
                           @"雅艺",@"周刊"];
 
    [self _createIconButtonWithButtonArray:buttonArray withView:classify];
}
-(void)_createLiving{
    LivingView=[[UIView alloc]initWithFrame:CGRectMake(5, classify.frame.size.height+5+classify.frame.origin.y, kScreenWidth, LivingViewHeight)];
    LivingView.backgroundColor=[UIColor whiteColor];
    [Scroller addSubview:LivingView];
    [self createButtonWithView:LivingView WithTag:1 WithNorname:@"换一换" withSelename:@"换一换" WithNorImag:[UIImage imageNamed:@"refresh~iphone"] WithSelectedImag:[UIImage imageNamed:@"refresh~iphone"]];
    for (int i=0; i<IconArray.count; i++) {
        authorModel *amodel=IconArray[i];
        NSLog(@"%@",amodel.authorID);
        UIButton *button=[[UIButton alloc]init];
        button.frame=CGRectMake(15*(i+1)+i*kScreenWidth/5.0, 50, kScreenWidth/5, kScreenWidth/5);
       UIImageView *imageV=[[UIImageView alloc]init];
        imageV.frame=button.frame;
        button.tag=i;
        button.backgroundColor=[UIColor clearColor];
       // button.backgroundColor=[UIColor redColor];
        imageV.layer.cornerRadius=imageV.frame.size.width/2;
//        imageV.userActivity=YES;
        imageV.userInteractionEnabled=YES;
        imageV.contentMode= UIViewContentModeScaleAspectFill;
        imageV.layer.masksToBounds=YES;
        [imageV sd_setImageWithURL:[NSURL URLWithString:amodel.iconURL]];
//        UIImage *buttonI=imageV.image;
//        [button setBackgroundImage:buttonI forState:UIControlStateNormal];
       
       
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15*(i+1)+i*kScreenWidth/5.0, imageV.frame.origin.y+imageV.frame.size.height+10, kScreenWidth/5, 10)];
        [label setText:amodel.nick];
       label.textAlignment =UITextAlignmentCenter;
        label.textColor=[UIColor redColor];
        label.font = [UIFont systemFontOfSize:14];
        [LivingView addSubview:label];
        [LivingView addSubview:imageV];
        [LivingView addSubview:button];
        [button addTarget:self action:@selector(AuthorAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)_createdvd{
    edvd=[[UIView alloc]initWithFrame:CGRectMake(0, classify.frame.size.height+LivingView.frame.size.height, kScreenWidth, Scroller.contentSize.height-(classify.frame.size.height+LivingView.frame.size.height+10))];
    edvd.backgroundColor=[UIColor whiteColor];
    [Scroller addSubview:edvd];
    for (int i=0; i<TmodelArray.count; i++) {
        float Spacing;
       Spacing=i*edvd.frame.size.height/9.0;
        UIImageView *imagew=[[UIImageView alloc]initWithFrame:CGRectZero];
        imagew.contentMode= UIViewContentModeScaleAspectFill;

        imagew.frame=CGRectMake(0, 20+i*edvd.frame.size.height/4.0, kScreenWidth, edvd.frame.size.height/4.0);
      //  NSLog(@"%f",imagew.frame.origin.y);
        
        UILabel *textlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        textlabel.backgroundColor=[UIColor clearColor];
        textlabel.textColor=[UIColor whiteColor];
        textlabel.textAlignment= NSTextAlignmentCenter;
        
        TopicModel *top=TmodelArray[i];
      
        textlabel.text=top.title;
        NSDictionary *attribute=@{NSFontAttributeName :[UIFont boldSystemFontOfSize:25]};
        CGRect rect=[top.title boundingRectWithSize:CGSizeMake(MAXFLOAT,200) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
        textlabel.frame=CGRectMake(0, 0, rect.size.width+20,200);
        
        
        textlabel.center=imagew.center;
        
        [imagew sd_setImageWithURL:[NSURL URLWithString:top.imageURL]];
       
        [edvd addSubview:imagew];
         [edvd addSubview:textlabel];
}
    
    
    
    
 
    
    
    
}

#pragma mark buttonAction
-(void)button1Action:(UIButton *)button{
    if (button.tag==0) {
        button.selected=!button.selected;
        if (button.selected==YES) {
          classify.frame=CGRectMake(5, 64, kScreenWidth, 3*classifyHeight);
            
            Scroller.contentSize=CGSizeMake(kScreenWidth, 2.5*kScreenHeight);
        }else{
            classify.frame=CGRectMake(5, 64, kScreenWidth, classifyHeight);
            button1Stutus=0;
            Scroller.contentSize=CGSizeMake(kScreenWidth, 1.5*kScreenHeight);
        }
        LivingView.frame=CGRectMake(5, classify.frame.size.height+5+classify.frame.origin.y, kScreenWidth, LivingViewHeight);
        edvd.frame=CGRectMake(5, classify.frame.size.height+LivingView.frame.size.height, kScreenWidth, Scroller.contentSize.height-(classify.frame.size.height+LivingViewHeight+10));
    }else if(button.tag==1){
      
    
    }
    
 }
-(void)AuthorAction:(UIButton *)button{
 
    


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
      NSString *imageName=[NSString stringWithFormat:@"ts_%@~iphone",[NSString transform:buarr[i]]];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageName] forState: UIControlStateSelected];
        //
        button.frame=CGRectMake(b*kScreenWidth/4.0,kScreenWidth/12.0+c*kScreenWidth/4.0,kScreenWidth/4.0,kScreenWidth/4.0);
        button.tag=i+100;
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
