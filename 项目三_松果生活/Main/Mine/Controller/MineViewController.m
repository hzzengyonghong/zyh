//
//  MineViewController.m
//  项目三_松果生活
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "MineViewController.h"
#import "PersonViewCell.h"
#import "PersonHeaderView.h"
#import "PersonModel.h"
#import "SetTableViewController.h"
#import "TextCollectionViewController.h"
#import "FavCollectionViewController.h"
#define kPersonCellHeight 50
#define kSectionHeight 10



@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tab;
    NSArray *_labelTextArray;
    NSArray *_imageArray;
//    PersonModel *model;
    NSMutableDictionary *mDictionary;
    NSMutableArray *dataArr;
    NSArray *data2;
}


@end

@implementation MineViewController
-(void)viewWillAppear:(BOOL)animated{
//    [self _loadData];
    [self createMoreSubview:self name:@"设置" right:NO];
    [_tab reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   [self _loadData];

    [self _createTable];
//    self.view.backgroundColor = [UIColor purpleColor];
  
}
-(void)_createTable{
    
    _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) style:UITableViewStyleGrouped];
    [self.view addSubview:_tab];
    self.navigationController.navigationBar.hidden = YES;
    _tab.dataSource = self;
    _tab.delegate = self;
    _tab.backgroundColor = [UIColor clearColor];
    _tab.bounces = NO;
    
    _tab.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
    
    _tab.showsVerticalScrollIndicator = NO;
    
    
    //    _tab.tableFooterView.hidden = YES;
    
    [_tab registerNib:[UINib nibWithNibName:@"PersonViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PersonViewCell"];
    
    
//    [_tab reloadData];
}
-(void)tabReload{
    [_tab reloadData];
}
#define mark - loadData
-(void)_loadData{
    //使用第三方库，请求网络数据
    NSURL *urlString = [NSURL URLWithString:kGetMe];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.securityPolicy.allowInvalidCertificates = YES;
//
//    NSDictionary *params = @{@"mobile":@"15988404695",
//                             @"password":@"cw87404135"};
  
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
    request.HTTPMethod = @"GET";
     [request setValue:kUserCookie forHTTPHeaderField:@"Cookie"];

    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     
//        NSLog(@"成功");
//
//        //        NSLog(@"%@",data);
//                NSLog(@"%@",response);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        mDictionary = [dic copy];
//        NSLog(@"%@",mDictionary[@"nick"]);
        
     
        dataArr = [NSMutableArray array];
        PersonModel *model = [[PersonModel alloc]init];
        model.uid = mDictionary[@"id"];
        model.icon = mDictionary[@"icon"];
        model.nick = mDictionary[@"nick"];
        model.signature = mDictionary[@"signature"];
        model.mobile = mDictionary[@"mobile"];
        model.weibo = mDictionary[@"weibo"];
        [dataArr addObject:model];
//        NSLog(@"%@",dataArr[0]);
    [self performSelectorOnMainThread:@selector(tabReload) withObject:nil waitUntilDone:NO];
        
    }];
    
   
    
    
       [dataTask resume];
    
    
    //
    //
    //        mDictionary = [dic copy];
    //        NSLog(@"%@",mDictionary);

    
    
    
    
    
//    model = [[PersonModel alloc]init];
//    model.nick = @"cheng";
//    model.signature = @"hehe";
//    model.icon = @"none";
   

}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        if (section==0) {
            return 4;
        }
        if (section==1) {
            return 2;
        }
        if (section==2) {
            return 1;
        }
        return 0;
        
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PersonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonViewCell" forIndexPath:indexPath];
    
    [self praseData];
    
    
    if (indexPath.section == 0) {
        [cell.image setImage:[UIImage imageNamed:_imageArray[indexPath.row]]];
        [cell.label setText:_labelTextArray[indexPath.row]];
    }else if (indexPath.section==1){
        [cell.image setImage:[UIImage imageNamed:_imageArray[indexPath.row+4]]];
        [cell.label setText:_labelTextArray[indexPath.row+4]];

    }else if(indexPath.section==2){
        [cell.image setImage:[UIImage imageNamed:_imageArray[indexPath.row+6]]];
        [cell.label setText:_labelTextArray[indexPath.row+6]];

    }else{
        return nil;
    }
    cell.selectionStyle =   UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
-(void)praseData{
    _labelTextArray = @[@"文章",
                       @"消息",
                       @"活动",
                       @"物件",
                       @"关注的生活家",
                       @"成为生活家",
                       @"设置"];
    _imageArray = @[@"person_article~iphone",
                    @"person_message~iphone",
                    @"person_event~iphone",
                    @"person_gift~iphone",
                    @"person_attention~iphone",
                    @"person_become_master~iphone",
                    @"person_setting~iphone"];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return kPersonCellHeight;
}


#pragma mark - CellHeight
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 300;
    }
    return kSectionHeight;
}
#pragma mark - HeaderView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        PersonHeaderView *headerview = [[PersonHeaderView alloc]init];
//        headerview.backgroundColor = [UIColor greenColor];
        
        headerview.model = dataArr[0];
        
        return headerview;
    }
    return nil;
}
#pragma mark - CellDidSelect
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0 && indexPath.row==0) {
        NSLog(@"文章");
        [self createTextView];
        
    }else if(indexPath.section == 0 && indexPath.row == 1){
        NSLog(@"message");
        [self createMessageView];
        
    }else if (indexPath.section == 0 && indexPath.row ==2){
        NSLog(@"act");
        [self createActView];
        
    }else if (indexPath.section == 0 && indexPath.row == 3){
        NSLog(@"item");
        [self createItemView];
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
        NSLog(@"关注的生活家");
        [self createFavView];
        
    }else if (indexPath.section == 1 && indexPath.row == 1){
        NSLog(@"become");
        [self createBecomeView];
        
    }else if (indexPath.section==2 && indexPath.row ==0){
        NSLog(@"设置");
        [self createSetView];
        
    }
}


//-------------------------Text----------------------------------//
-(void)createTextView{
//    self.navigationController.navigationBar.hidden = NO;
    
    TextCollectionViewController *viewCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"article"];
    //viewCtrl.view.backgroundColor = [UIColor whiteColor];
//    viewCtrl.title = @"收藏文章";
    viewCtrl.model=dataArr[0];
//    [self createMoreSubview:viewCtrl name:@"文章" right:YES];

    
    [self.navigationController pushViewController:viewCtrl animated:YES];
    self.navigationController.navigationBar.hidden = NO;
    viewCtrl.tabBarController.tabBar.hidden = YES;
    
}

//-------------------------Message--------------------------------//
-(void)createMessageView{
    UIViewController *viewCtrl = [[UIViewController alloc]init];
    viewCtrl.view.backgroundColor = [UIColor whiteColor];
//    viewCtrl.title = @"消息";
    [self createMoreSubview:viewCtrl name:@"消息" right:NO];
    
    [self.navigationController pushViewController:viewCtrl animated:YES];
    self.navigationController.navigationBar.hidden = NO;
    viewCtrl.tabBarController.tabBar.hidden = YES;

}

//------------------------Act----------------------------------//
-(void)createActView{
    UIViewController *viewCtrl = [[UIViewController alloc]init];
    viewCtrl.view.backgroundColor = [UIColor whiteColor];
//    viewCtrl.title = @"act";
    [self createActSubview:viewCtrl];
    [self.navigationController pushViewController:viewCtrl animated:YES];
    self.navigationController.navigationBar.hidden = NO;
    viewCtrl.tabBarController.tabBar.hidden = YES;
}
-(void)createActSubview:(UIViewController *)viewCtrl{
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
//    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
//    viewCtrl.navigationItem.rightBarButtonItem = rightButtonItem;
    
    //中
    NSArray *segmentArr = @[@"参加的活动",@"收藏"];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:segmentArr];
    segment.frame = CGRectMake(kScreenWidth/2-100, 10, 200, 30);
    segment.tintColor = [UIColor orangeColor];
    segment.selectedSegmentIndex = 0;
    
    [self.navigationController.navigationBar addSubview:segment];
    
    //内容
//    UICollectionView *collectionView = [[UICollectionView alloc]init];
    
    
}

//-------------------------Item----------------------------------//
-(void)createItemView{
    UIViewController *viewCtrl = [[UIViewController alloc]init];
    viewCtrl.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.navigationController pushViewController:viewCtrl animated:YES];
    [self createItemSubview:viewCtrl];
    self.navigationController.navigationBar.hidden = NO;
    viewCtrl.tabBarController.tabBar.hidden = YES;

}
-(void)createItemSubview:(UIViewController *)viewCtrl{
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
    //    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
    //    viewCtrl.navigationItem.rightBarButtonItem = rightButtonItem;
    //中
    NSArray *segmentArr = @[@"订单",@"收藏"];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:segmentArr];
    segment.frame = CGRectMake(kScreenWidth/2-100, 10, 200, 30);
    segment.tintColor = [UIColor orangeColor];
    segment.selectedSegmentIndex = 0;
    
    [self.navigationController.navigationBar addSubview:segment];
    
    
}

//-------------------------Fav----------------------------------//
-(void)createFavView{
    FavCollectionViewController *viewCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"fav"];
    viewCtrl.model = dataArr[0];
    
//    viewCtrl.title= @"关注的生活家";
  
    [self.navigationController pushViewController:viewCtrl animated:YES];
    self.navigationController.navigationBar.hidden = NO;
    viewCtrl.tabBarController.tabBar.hidden = YES;
}

//-------------------------Become----------------------------------//
-(void)createBecomeView{
    UIViewController *viewCtrl = [[UIViewController alloc]init];
    viewCtrl.view.backgroundColor = [UIColor whiteColor];
    viewCtrl.title = @"become";
    [self createBecomeSubview:viewCtrl];
    [self.navigationController pushViewController:viewCtrl animated:YES];
    self.navigationController.navigationBar.hidden = NO;
    viewCtrl.tabBarController.tabBar.hidden = YES;

}
-(void)createBecomeSubview:(UIViewController *)viewCtrl{
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
//    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
//    viewCtrl.navigationItem.rightBarButtonItem = rightButtonItem;
    //中
    //    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-40, 20, 80, 44)];
    //    label.text = @"关注的生活家";
    //    label.textColor = [UIColor orangeColor];
    //    label.textAlignment = UITextAlignmentCenter;
    //    [self.view addSubview:label];
    
    
}

//-------------------------Set----------------------------------//
-(void)createSetView{
   SetTableViewController *viewCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"more"];
    viewCtrl.view.backgroundColor = [UIColor whiteColor];
//    viewCtrl.title = @"设置";
    [self createMoreSubview:viewCtrl name:@"设置" right:NO];
    
    
    [self.navigationController pushViewController:viewCtrl animated:YES];
    
    self.navigationController.navigationBar.hidden = NO;
    viewCtrl.tabBarController.tabBar.hidden = YES;

}



-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)resetButtonAction{
    NSLog(@"编辑1");
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
