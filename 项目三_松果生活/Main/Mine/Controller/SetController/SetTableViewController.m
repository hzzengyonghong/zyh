//
//  SetTableViewController.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/12.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "SetTableViewController.h"
#import "PersonModel.h"
@interface SetTableViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    NSMutableArray *dataArr;
    PersonModel *model;
}
@property (strong, nonatomic) IBOutlet UITextField *weibo;
//@property (strong, nonatomic) IBOutlet UITableView *tab;
@property (strong, nonatomic) IBOutlet UITableView *tab;

@end

@implementation SetTableViewController
-(void)viewWillAppear:(BOOL)animated{
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
    self.navigationItem.leftBarButtonItem = buttonItem;
    
    //右按钮
//    if (right == YES) {
//        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
//        rightButtonItem.tintColor = [UIColor blackColor];
//        viewCtrl.navigationItem.rightBarButtonItem = rightButtonItem;
//    }else{
//        
//    }
    
    //中
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-80, 0, 160, 44)];
    label.text = @"设置";
    label.textColor = [UIColor orangeColor];
    label.textAlignment = UITextAlignmentCenter;
    [self.navigationController.navigationBar addSubview:label];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [[PersonModel alloc]init];
    [self _loadData];
   
    
    
    
}
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
        
        NSLog(@"成功");
        
        //        NSLog(@"%@",data);
        NSLog(@"%@",response);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *mDictionary;
        
        mDictionary = [dic copy];
        //        NSLog(@"%@",mDictionary[@"nick"]);
        
        
       
        
       
        model.weibo = mDictionary[@"weibo"];
        NSLog(@"%@",model.weibo);
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
-(void)tabReload{
     _weibo.text =model.weibo;
    [_tab reloadData];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2&&indexPath.row == 0) {
        [self alertView:@"确定要清楚缓存吗？"num:1];
    }
    if (indexPath.section ==4&&indexPath.row==0) {
        [self alertView:@"确定要退出登录吗？"num:2];
    }
}
-(void)alertView:(NSString *)string num:(NSInteger)num{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:string delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = 2000+num;
    
    [alert show];
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 2001) {
        
    
    if (buttonIndex == 0) {
        
    }else{
        [self clearCache];
    }
    }
    if (alertView.tag == 2002) {
        if (buttonIndex == 0) {
            
        }else{
            [self logout];
        }
    }
    
}
-(void)clearCache{
    //简便方法
    //    [[SDImageCache sharedImageCache] clearDisk];
    NSString *cache = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    
    [[NSFileManager defaultManager]removeItemAtPath:cache error:nil];
    [[NSFileManager defaultManager]createDirectoryAtPath:cache
                             withIntermediateDirectories:YES
                                              attributes:nil
                                                   error:NULL];
    NSLog(@"清楚");
}
-(void)logout{
    NSLog(@"退出登录");
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

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
