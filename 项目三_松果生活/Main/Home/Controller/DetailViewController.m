//
//  DetailViewController.m
//  项目三_松果生活
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "DetailViewController.h"
#import "DetaiModel.h"
#import "DetaiCell.h"
#import "TextCell.h"
#import "HomeViewController.h"
#import "YYModel.h"
#import "Imagviewctl.h"
#import "TitleCell.h"
#import "JoinActivityctl.h"
#import "NameCell.h"
#import "AppDelegate.h"


//#import "PersonDetailViewController.h"


#define kImgeWith  kScreenWidth-30

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView  *DetaiTable;
    NSArray *dataArray;
    UIImageView *HeadView;
    UIButton *button1;
    
    UIImageView *bigview;
    BOOL favstatus;
    

}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    //参加活动

   
}
-(void)_creatbutton{
    [self createMoreSubview:self name:@" " right:NO];
    
    button1=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-50, 0, 50, 50)];
    [button1 setImage:[UIImage imageNamed:@"mark~iphone"] forState:UIControlStateNormal];
    
    [button1 setImage:[UIImage imageNamed:@"mark_active~iphone"] forState: UIControlStateSelected];
    [button1 addTarget:self action:@selector(FavAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *mark=[[UIBarButtonItem alloc]initWithCustomView:button1];
    
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-50, 0, 50, 50)];
    [button2 setImage:[UIImage imageNamed:@"share~iphone.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *sharebutton=[[UIBarButtonItem alloc]initWithCustomView:button2];
    ///sharebutton.tintColor=[UIColor grayColor];
    NSArray *buttons=@[mark,sharebutton];
    self.navigationItem.rightBarButtonItems=buttons;

    
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    self.navigationController.navigationBar.hidden=NO;
    
   // NSLog(@"1");
    
    NSURL *urlString = [NSURL URLWithString:[NSString stringWithFormat:@"http://songguolife.com/api/%@/%@",self.type,self.idstr]];
    NSLog(@"%@",urlString);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
    request.HTTPMethod = @"GET";
    [request setValue:kUserCookie forHTTPHeaderField:@"Cookie"];
    [request setValue:@" application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

        NSArray *resouce=[dic valueForKey:@"resource"];
        NSDictionary *user=[dic valueForKey:@"user"];
        NSMutableArray *marray=[[NSMutableArray alloc]init];
        //单独纪录心形
        DetaiModel *favdmodel= [[DetaiModel alloc]init];
        [favdmodel yy_modelSetWithDictionary:dic];
        //单独纪录headview
        DetaiModel  *headdmoel=[[DetaiModel alloc]init];
        headdmoel.headurl=[[dic valueForKey:@"topImage"]valueForKey:@"url"];
        //内容填充
        for (int i=0; i<resouce.count+2; i++) {
            DetaiModel *dmodel=[[DetaiModel alloc]init];
            if (i==0) {
                
                dmodel.icon=[user valueForKey:@"icon"];
                dmodel.nick=[user valueForKey:@"nick"];
                dmodel.signature=[user valueForKey:@"signature"];
                dmodel.userid=[user valueForKey:@"id"];
                
            }else if(i==1){
       
            dmodel.name= [dic valueForKey:@"name"];
            
             

        }else{
                if (![[resouce[i-2] valueForKey:@"width"] integerValue]==0) {
                   
               dmodel.url=[resouce[i-2]valueForKey:@"url"];
                    //dmodel.isSubTitle=[resouce[i-2]valueForKey:@"isSubTitle"];
                    dmodel.tp=2;
                    dmodel.height=[[resouce[i-2]valueForKey:@"height"] integerValue];
                    dmodel.width =[[resouce[i-2]valueForKey:@"width"] integerValue];
                }else if(![[resouce[i-2] valueForKey:@"txt"]       isEqualToString:@""]){
                    dmodel.text=[resouce[i-2] valueForKey:@"txt"];
                    dmodel.tp=1;
                    dmodel.isSubTitle=[resouce[i-2]valueForKey:@"isSubTitle"];
                    
                }else{
                    dmodel.needblank=1;
                    dmodel.tp=0;
                }
            }
            [marray addObject:dmodel];
        }
            
        
        [self performSelectorOnMainThread:@selector(_createtableview:) withObject:marray waitUntilDone:NO];
      
        [self performSelectorOnMainThread:@selector(_creatbutton) withObject:nil waitUntilDone:NO];
        [self performSelectorOnMainThread:@selector(_creatHeaderView:) withObject:headdmoel waitUntilDone:NO];
          [self performSelectorOnMainThread:@selector(fresh:) withObject:favdmodel waitUntilDone:NO];
        
    }];
    [dataTask resume];}

-(void)fresh:(DetaiModel *)dmoel{
    NSLog(@"%i",dmoel.favorite);
    if (dmoel.favorite==0) {
        button1.selected=NO;
        favstatus=0;
    }else {
        button1.selected=YES;
        favstatus=1;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    if(favstatus==1){
    NSString *urlstr=[NSString stringWithFormat:@"http://songguolife.com/api/%@/%@/fav",self.type,self.idstr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:urlstr]];
    request.HTTPMethod = @"POST";
    [request setValue:kUserCookie forHTTPHeaderField:@"Cookie"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      
        
    }];
    [dataTask resume];}else
    {
      NSURL *urlString = [NSURL URLWithString:[NSString stringWithFormat:@"http:songguolife.com/api/%@/remove/fav",self.type]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
            request.HTTPMethod = @"POST";
            [request setValue:kUserCookie forHTTPHeaderField:@"Cookie"];
            [request setValue:@" application/json" forHTTPHeaderField:@"Content-Type"];
        NSDictionary *dic=[[NSDictionary alloc]init];
        NSArray *array=[[NSArray alloc]init];
        if ([self.type isEqualToString:@"article"]) {
            dic= @{@"id":self.idstr,
                    @"tpye":@0};
            array=@[dic];
        }else{
           array=@[self.idstr];
        }
           NSDictionary *datadic=@{@"ids":array};
            NSData *data = [NSJSONSerialization dataWithJSONObject:datadic options:NSJSONWritingPrettyPrinted error:nil];
          request.HTTPBody = data;
          NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            }];
                [dataTask resume];}

}

#pragma mark buttonAction:

-(void)shareAction:(UIButton *)button{
    //变暗
    bigview=[[UIImageView alloc]initWithFrame:self.view.frame];
    bigview.backgroundColor=[UIColor colorWithWhite:0.4 alpha:0.6];
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight*2/3, kScreenWidth, kScreenHeight/3)];
    bigview.userInteractionEnabled=YES;
    [[UIApplication sharedApplication] keyWindow].userInteractionEnabled=YES;
    UIButton *button3=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*2/3.)];
   // button3.backgroundColor=[UIColor clearColor];
    [button3 addTarget:self action:@selector(exitAction:) forControlEvents:UIControlEventTouchUpInside ];
    view2.backgroundColor=[UIColor whiteColor];
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/12)];
    titleLabel.text=@"分享";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    [view2 addSubview:titleLabel];
    NSArray *imageArray=@[@"share_weixin~iphone.png",
                          @"share_pengyouquan~iphone.png",
                          @"share_weibo~iphone.png"];
    for (int i=0; i<3; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((2*i+1)*kScreenWidth/7, kScreenHeight*(3/24.), kScreenWidth/7, kScreenWidth/7)];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        
        button.tag=i;
        [button addTarget:self action:@selector(shareAction1:) forControlEvents:UIControlEventTouchUpInside];
        [view2 addSubview:button];
}
    UIButton *exitbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, kScreenHeight*(1/6.+1/7.+1/24.), kScreenWidth, kScreenHeight*(1/3.-1/6.-1/7.-1/8.) )];
   // exitbutton.backgroundColor=[UIColor redColor];
    
    [exitbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    exitbutton.layer.borderColor=[UIColor colorWithWhite:0.2 alpha:0.4].CGColor;
    exitbutton.layer.borderWidth=1.0f;
    [exitbutton setTitle:@"退出" forState:  UIControlStateNormal];
    [exitbutton addTarget:self action:@selector(exitAction:) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:exitbutton];
    [bigview addSubview:button3];
    [bigview addSubview:view2];
    [[[UIApplication sharedApplication] keyWindow]addSubview:bigview];
}
-(void)exitAction:(UIButton *)button{
    
    
    [bigview removeFromSuperview];

}
-(void)FavAction:(UIButton *)button{
    
  button.selected=!button.selected;
   
    if (button.selected==YES) {
        favstatus=1;
    }else if(button.selected==NO){
        favstatus=0;
    }
    
}
-(void)buttonAction:(UIButton *)button{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"JoinAcivity" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:[story instantiateViewControllerWithIdentifier:@"Join"] animated:YES];
}

-(void)shareAction1:(UIButton *)button{
    if (button.tag==2) {
//        SendMessageToWXReq *SendReq=[[SendMessageToWXReq alloc]init];
//        SendReq.bText = NO;
//        //0 = 好友列表 1 = 朋友圈 2 = 收藏
//        SendReq.scene = 1;
        
        
        
        
    }

}

#pragma mark tarstatus
- (BOOL)prefersStatusBarHidden{
    //隐藏为YES，显示为NO
    return YES;
    
}
-(void)_createtableview:(NSMutableArray *)array1{
    dataArray=[array1 mutableCopy];
    DetaiTable=[[UITableView alloc]initWithFrame:CGRectMake(0,-20, kScreenWidth, kScreenHeight-49+20) style:UITableViewStylePlain];
    if ([self.type isEqualToString:@"article"]) {
        self.view.frame=CGRectMake(0, -20, kScreenWidth, kScreenHeight+20);
        DetaiTable.frame=self.view.frame;
   
    }
    DetaiTable.dataSource=self;
    DetaiTable.delegate=self;
    [DetaiTable registerNib:[UINib nibWithNibName:@"TitleCell" bundle:nil] forCellReuseIdentifier:@"Hcell"];
    [DetaiTable registerNib:[UINib nibWithNibName:@"DetaiCell"bundle:nil] forCellReuseIdentifier:@"Dcell"];
    [DetaiTable registerNib:[UINib nibWithNibName:@"TextCell" bundle:nil] forCellReuseIdentifier:@"Tcell"];
     [DetaiTable registerNib:[UINib nibWithNibName:@"NameCell" bundle:nil] forCellReuseIdentifier:@"Namecell"];
    DetaiTable.separatorStyle=NO;
    DetaiTable.showsHorizontalScrollIndicator=NO;
    DetaiTable.showsVerticalScrollIndicator=NO;
    DetaiTable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:DetaiTable];
     self.automaticallyAdjustsScrollViewInsets=NO;
    if ([self.type isEqualToString:@"activity"]) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, DetaiTable.frame.size.height-20, kScreenWidth, 49)];
        
        button.backgroundColor=[UIColor orangeColor];
        [button setTitle:@"我要参加活动" forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents: UIControlEventTouchUpInside];
    }
    [self prefersStatusBarHidden];
    
    
  //  [self _creatHeaderView];
    
    
}


/*-(void)_createData{
    NSMutableArray *marray=[[NSMutableArray alloc]init];
    for (int i=0; i<_resource.count+2; i++) {
        DetaiModel *dmodel=[[DetaiModel alloc]init];
        if (i==0) {
            dmodel.icon=[_user valueForKey:@"icon"];
            dmodel.nick=[_user valueForKey:@"nick"];
            dmodel.signature=[_user valueForKey:@"signature"];
        }else if(i==1){
            dmodel.name=self.name;
        }else{
        
    if (![[_resource[i-2] valueForKey:@"width"] integerValue]==0) {
            //有图片   NSLog(@"%i,%@",i,dmodel.url);
            dmodel.url=[_resource[i-2]valueForKey:@"url"];
            dmodel.tp=2;
        dmodel.height=[[_resource[i-2]valueForKey:@"height"] integerValue];
         dmodel.width =[[_resource[i-2]valueForKey:@"width"] integerValue];
    }else if(![[_resource[i-2] valueForKey:@"txt"]       isEqualToString:@""]){
        dmodel.text=[_resource[i-2] valueForKey:@"txt"];
        dmodel.tp=1;
   }else{
        dmodel.needblank=1;
        dmodel.tp=0;
  }
        }
        [marray addObject:dmodel];
       
}
 
    dataArray=[marray copy];

}
 */
- (void)_creatHeaderView:(DetaiModel *)demodel{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    view.backgroundColor = [UIColor clearColor];
    DetaiTable.tableHeaderView = view;
    HeadView = [[UIImageView alloc] init];
    [HeadView sd_setImageWithURL:[NSURL URLWithString:demodel.headurl]];
    HeadView.contentMode = UIViewContentModeScaleAspectFill;
    HeadView.frame = CGRectMake(0, 0
                                , kScreenWidth, 200);
    [self.view insertSubview:HeadView atIndex:0];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = DetaiTable.contentOffset.y;
    if (y >= 0) {
        HeadView.frame = CGRectMake(0, 0-y, kScreenWidth, 200);
       
    }else{
        HeadView.frame = CGRectMake(0, 0, kScreenWidth, 200- y);
    }
}

#pragma mark tableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 

    return dataArray.count;
   

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetaiModel *dmodel=dataArray[indexPath.row];
   //label
    if (indexPath.row==0) {
        TitleCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Hcell"];
        [cell Dmodel:dmodel];
        cell.contentView.backgroundColor=[UIColor colorWithWhite:0.8 alpha:0.2];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if(indexPath.row==1){
        NameCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Namecell"];
        [cell Name:dmodel];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
       
    }else{
    if (dmodel.tp==2) {
        DetaiCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Dcell"];
        [cell.imagev sd_cancelCurrentImageLoad];
        float rate=dmodel.height/dmodel.width;
        [cell utrstring:dmodel.url withrate:rate];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        TextCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Tcell"];
        [cell textWithstring:dmodel.text];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
  }
}



#pragma mark tableviewRowHeight
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetaiModel *dmodel=dataArray[indexPath.row];
    if (indexPath.row==0) {
     
        return kScreenHeight/8.;
    
    }else if(indexPath.row==1){
        NSDictionary *attribute=@{NSFontAttributeName :[UIFont systemFontOfSize:17]};
        CGRect rect=[dmodel.name boundingRectWithSize:CGSizeMake(kScreenWidth-10,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
        return rect.size.height+30;
    
    }else{
    
    if (dmodel.tp==2) {
       return (kImgeWith)*dmodel.height/dmodel.width+30;
    }else if(dmodel.tp==1){
        NSDictionary *attribute=@{NSFontAttributeName :[UIFont systemFontOfSize:15]};
        CGRect rect=[dmodel.text boundingRectWithSize:CGSizeMake(kScreenWidth-10,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
       return rect.size.height+30;
    
    
    }else {
    
        return 20;
    }

  }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   DetaiModel *dmodel=dataArray[indexPath.row];
    if (indexPath.row>0) {
         DetaiModel *dmodel=dataArray[indexPath.row-1];
        NSLog(@"%ld",dmodel.tp);
    }
    
    
    
    if (indexPath.row==0) {
//        PersonDetailViewController *p=[[PersonDetailViewController alloc]init];
//        p.uid=dmodel.
       // NSLog(@"%@",dmodel.userid);
    }

  // NSLog(@"%ld",indexPath.row);
    if (dmodel.tp==2) {
        Imagviewctl *imgctl=[[Imagviewctl alloc]init];
        imgctl.imagurl=dmodel.url;
        imgctl.rate=(double)dmodel.height/dmodel.width;
        CATransition *animation = [CATransition animation];
        animation.duration = 0.4f;
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromRight;
        [self.navigationController.view.layer addAnimation:animation forKey:nil];
        [self.navigationController pushViewController:imgctl animated:NO];
        self.navigationController.hidesBottomBarWhenPushed=YES;
        imgctl.tabBarController.tabBar.hidden=YES;
    }


}






-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
 }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//
//
//
//
//
//

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
