//
//  ActivityViewController.m
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "ActivityViewController.h"
#import "HomeViewController.h"
#import "YYModel.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "DetailViewController.h"
#import "MJRefresh.h"
#import "NSMutableURLRequest+tag.h"

#define KHomeURL   @"http://songguolife.com/api/home?count=20&since=0&until=0"
#define KHomeData @"KHomeData"
#define KHomeURL   @"http://songguolife.com/api/home?count=20&since=0&until=0"
@interface ActivityViewController ()<UITableViewDelegate,UITableViewDataSource>{
        UITableView *HomeTable;
        NSMutableArray *dataArray;
        NSMutableArray *imageURLmarray;
        NSMutableURLRequest *request;
        NSInteger count;
        MJRefreshAutoGifFooter *foot;
}

@end

@implementation ActivityViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self _creadData];
    
    
    
    
    
    self.title = @"活动";
}


-(void)_createURLRequest:(NSMutableURLRequest *)req{
    NSURLSession *session=[NSURLSession sharedSession];
    // NSLog(@"%@",req.URL);
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization
                             JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        // 根据tppe的不同进行解析数据
        //tpye是nsnumber需要进行类型转化
        NSMutableArray *marray=[[NSMutableArray alloc]init];
        NSArray *tpye=[dic valueForKey:@"type"];
       
        
        
        for (int i=0; i<tpye.count; i++) {
            HomeModel *hmodel=[[HomeModel alloc]init];
             {

                [hmodel yy_modelSetWithDictionary:[dic valueForKey:@"activity"][i]];
                hmodel.ulr=[[[dic valueForKey:@"activity"][i]valueForKey:@"topImage"]valueForKey:@"url"];
                hmodel.resource=[[dic valueForKey:@"activity"][i]valueForKey:@"resource"];
                hmodel.tpye=1;
                hmodel.user=[[dic valueForKey:@"activity"][i]valueForKey:@"user"];}
            
            [marray addObject:hmodel];
            
        }
        if ([req.Requesttag isEqualToString:@"0"]) {
            [self performSelectorOnMainThread:@selector(_creadTab:) withObject:marray waitUntilDone:NO];}
        if ([req.Requesttag isEqualToString:@"1"]) {
            dataArray=[marray mutableCopy];
            [HomeTable performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            [NSThread sleepForTimeInterval:0.5];
            [HomeTable.mj_header endRefreshing];
            
            
        }
        if ([req.Requesttag isEqualToString:@"2"]) {
            [marray removeObjectAtIndex:0];
            // [dataArray addObjectsFromArray:[marray copy]];
            [dataArray performSelectorOnMainThread:@selector(addObjectsFromArray:) withObject:[marray copy] waitUntilDone:NO];
            [HomeTable performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            [NSThread sleepForTimeInterval:0.5];
            [HomeTable.mj_footer endRefreshing];
        }
        
    }];
    [dataTask resume];
}
-(void)_creadData{
    
    request=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:KHomeURL] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    request.Requesttag=@"0";
    [self _createURLRequest:request];
    
}

-(void)_creadTab:(NSMutableArray *)marray1{
    dataArray=[marray1 mutableCopy];
    HomeTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
    HomeTable.delegate=self;
    HomeTable.dataSource=self;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [HomeTable registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:HomeTable];
    // [self _creatHeaderView];
    //------------刷新功能---------------------------//
    //headfresh
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.lastUpdatedTimeLabel.hidden= YES;
    header.stateLabel.hidden=YES;
    [header setImages:self.refreshImages forState:MJRefreshStateRefreshing];
    [header setImages:self.normalImages forState:MJRefreshStateIdle];
    [header setImages:self.refreshImages duration:2 forState:MJRefreshStatePulling ];
    // 设置header
    HomeTable.mj_header = header;
    [HomeTable.mj_header setAutomaticallyChangeAlpha:YES];
    
    
    
    //    footRefresh
    foot=[MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [foot setImages:self.refreshImages duration:2 forState:MJRefreshStateRefreshing];
    foot.stateLabel.hidden=YES;
    foot.refreshingTitleHidden = YES;
    HomeTable.mj_footer=foot;
    
}
#pragma mark imagv
- (NSMutableArray *)normalImages
{
    if (_normalImages == nil) {
        _normalImages = [[NSMutableArray alloc] init];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"pulldown_00000~iphone"]];
        [self.normalImages addObject:image];
    }
    return _normalImages;
}

-(void)timeAction {
    self.time --;
    // NSLog(@"%d",self.time);
    if (self.time == 0) {
        //        刷新数据
        [HomeTable reloadData];
        //        停止刷新
        [HomeTable.mj_header endRefreshing];
        [self.timer invalidate];
    }
}
//正在刷新状态下的图片
- (NSMutableArray *)refreshImages
{
    if (_refreshImages == nil) {
        _refreshImages = [[NSMutableArray alloc] init];
        
        
        for (NSUInteger i = 0; i<=66; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"pulldown_000%02ld~iphone", i]];
            // NSLog(@"%@",image);
            [self.refreshImages addObject:image];
            
        }
    }
    return _refreshImages;
}


-(void)loadNewData{
    self.timer  =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    self.time = 3;
    
    request.URL=[NSURL URLWithString:KHomeURL];
    request.Requesttag=@"1";
    [self _createURLRequest:request];
    
}
-(void)loadMoreData{
    
    //http://songguolife.com/api/home?count=20&since=0&until=0
    HomeModel *Lasthmodel=[dataArray lastObject];
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://songguolife.com/api/home?count=20&since=0&until=%@",Lasthmodel.ct] ];
    request.URL=url;
    request.Requesttag=@"2";
    
    [self _createURLRequest:request];
    
    
    
}

#pragma mark datasoure

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%i",dataArray.count);
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    HomeModel *hmodel=dataArray[indexPath.row];
    
    [cell.ImageV sd_cancelCurrentAnimationImagesLoad];
    [cell setHmodel:hmodel];
    [cell hModel:hmodel];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenHeight*10/24;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%i",indexPath.row);
    DetailViewController *detailctl=[[DetailViewController alloc]init];
    if (((HomeModel *)dataArray[indexPath.row]).tpye==1){
        detailctl.type=@"activity";
    }else if(((HomeModel *)dataArray[indexPath.row]).tpye==0){
        detailctl.type=@"article";
    }
    detailctl.idstr =((HomeModel *)dataArray[indexPath.row]).idstr;
    [self.navigationController pushViewController:detailctl animated:YES];
    detailctl.tabBarController.tabBar.hidden=YES;
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    
    
    
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
