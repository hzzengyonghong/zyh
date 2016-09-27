//
//  AddressViewController.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/13.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressSetViewController.h"

#import "AdderssSetTableViewCell.h"
#import "AdressCell.h"
#import "AddAddressTableViewCell.h"
#import "AdressModel.h"
#import "YYModel.h"
@interface AddressViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    NSDictionary *mDictionary;
    NSMutableArray *dataArr;
    UIButton *deleteButton ;
    NSMutableArray *selectedArray;

    
}
@property (strong, nonatomic) IBOutlet UITableView *tab;

@end

@implementation AddressViewController
bool a=NO;//是否处于编辑模式

-(void)viewWillAppear:(BOOL)animated{
     [self createMoreSubview:self name:@"收货地址" right:YES];
   
    
    [self _loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self _loadData];
    [self _createTable];
    
    //删除按钮
    
    deleteButton =[[UIButton alloc]initWithFrame: CGRectZero];
    deleteButton.backgroundColor = [UIColor orangeColor];
    [deleteButton setTitle:@"删除地址" forState:UIControlStateNormal];
    [deleteButton addTarget:selectedArray action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
}
-(void)_createTable{
   
    [self _loadData];
    _tab.delegate = self;
    _tab.dataSource = self;
//    _tab.frame = CGRectMake(0, 20, kScreenWidth, 200*data);
    _tab.tableHeaderView=nil;
    _tab.bounces = NO;
    _tab.showsHorizontalScrollIndicator = NO;
    _tab.showsVerticalScrollIndicator = NO;
    
    [_tab registerNib:[UINib nibWithNibName:@"AdressCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"address"];
    [_tab registerNib:[UINib nibWithNibName:@"AddAddressTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"addAddress"];
    [_tab registerNib:[UINib nibWithNibName:@"AdderssSetTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"addressSet"];
    
}
-(void)_loadData{
        //使用第三方库，请求网络数据
        NSURL *urlString = [NSURL URLWithString:kGetMyAddress];
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
//            if (data==nil) {
//                return ;
//            }
            NSLog(@"成功");
            
            //        NSLog(@"%@",data);
            NSLog(@"%@",response);
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            
            mDictionary = [dic copy];
            //        NSLog(@"%@",mDictionary[@"nick"]);
            
            
            dataArr = [NSMutableArray array];
            for (NSDictionary *dic in mDictionary) {
                
            
                AdressModel *model = [[AdressModel alloc]init];
                model.name = dic[@"name"];
                model.mobile = dic[@"mobile"];
                model.address = dic[@"address"];
                model.addressID = dic[@"id"];
                
                [dataArr addObject:model];
            }
            
//            NSLog(@"%@",dataArr[0]);
            [self performSelectorOnMainThread:@selector(tabReload) withObject:nil waitUntilDone:NO];
              NSLog(@"%@",dataArr);
        }];
  
    
        
        
        [dataTask resume];
        
        
        
}

-(void)tabReload{
    [_tab reloadData];
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (a==NO) {
        return dataArr.count+1;
    }else{
        return dataArr.count;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
    
    
    if (a==NO) {
        
    
    if (indexPath.row==dataArr.count) {
        AddAddressTableViewCell *tbCell = [tableView dequeueReusableCellWithIdentifier:@"addAddress"forIndexPath:indexPath];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 100, 20)];
            [button setTitle:@"添加新地址" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(addressButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
            [tbCell addSubview:button];
       

        return tbCell;
        

    }else{
        
    AdressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"address" forIndexPath:indexPath ];
    cell.model = dataArr[indexPath.row];
      
    
    return cell;
    }
    }else{
       AdderssSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addressSet" forIndexPath:indexPath ];
        cell.model = dataArr[indexPath.row];
        int i = (int)dataArr.count;
        for (AdressModel *model in selectedArray) {
            i--;
            if (model == dataArr[indexPath.row]) {
                //如果被选中数组中的model 与当前cell的model相同则
                //此处cell改成打勾状态
                [cell.button setImage:[UIImage imageNamed:@"set_new_add_done~iphone"] forState:UIControlStateNormal];
                i=0;
                break;
            }
        }
        if (i!=0) {
            //此处cell改成未打勾状态
            [cell.button setImage:nil forState:UIControlStateNormal];
            
            cell.button.backgroundColor = [UIColor whiteColor];
        }
        
        
        return cell;

    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (a==YES) {

        //添加被选中单元格的model数据到selectedarray；
    AdressModel *model = [[AdressModel alloc]init];
    int i = (int)dataArr.count;
    for (model in selectedArray) {
        i--;
        if (model == dataArr[indexPath.row]) {
            //如果被点击的cell的id已经被录入selectedarray ，则移出，否则加入
            [selectedArray removeObject:model];
            i=0;
            break;
            
        }
        
        
    }
        if (i!=0) {
            [selectedArray addObject:dataArr[indexPath.row]];
        }


//    NSLog(@"%@",selectedArray);
    
        [_tab reloadData];
    }
}
-(void)addressButtonAction{
    AddressSetViewController *addressView = [self.storyboard instantiateViewControllerWithIdentifier:@"addressSet"];
    
    [self.navigationController pushViewController:addressView animated:YES];
    
}
-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    
//    self.navigationController.navigationBar.hidden = YES;
//    self.tabBarController.tabBar.hidden = NO;
}
-(void)resetButtonAction{
   
    if (a==NO) {
        //进入编辑模式
//        NSLog(@"进入编辑");
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
        rightButtonItem.tintColor = [UIColor blackColor];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
         deleteButton.frame =CGRectMake(0, kScreenHeight-50, kScreenWidth, 50);
        
        selectedArray = [NSMutableArray array];
//        [selectedArray addObject:dataArr[0]];
        
        
        
        
    }else{
        NSLog(@"取消");
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
        rightButtonItem.tintColor = [UIColor blackColor];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
        deleteButton.frame =CGRectZero;
    }
    a=!a;
    [_tab setContentOffset:CGPointMake(0,0) animated:NO];
    
    
//    NSIndexPath *indexPath;
//    [self tableView:_tab cellForRowAtIndexPath:indexPath];
//
     [_tab reloadData];
}
-(void)deleteButtonAction{
    //使用第三方库，请求网络数据
    NSURL *urlString = [NSURL URLWithString:kAddressRemove];
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //
    //    manager.securityPolicy.allowInvalidCertificates = YES;
    //
    //    NSDictionary *params = @{@"mobile":@"15988404695",
    //                             @"password":@"cw87404135"};
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
    request.HTTPMethod = @"POST";
    [request setValue:kUserCookie forHTTPHeaderField:@"Cookie"];
    [request setValue:@" application/json" forHTTPHeaderField:@"Content-Type"];
    NSMutableArray *selArr = [NSMutableArray array];
    for (AdressModel *model in selectedArray) {
       
        [selArr addObject:model.addressID];
        
    }
    NSArray *array = [selArr copy];
    NSDictionary *dic = @{@"ids":array};
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    request.HTTPBody = data;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    NSLog(@"%@",response);
    [self performSelectorOnMainThread:@selector(resetButtonAction) withObject:nil waitUntilDone:NO];
    [self performSelectorOnMainThread:@selector(_loadData) withObject:nil waitUntilDone:NO];
    }];
    
    
    
   

    [dataTask resume];
    
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
