//
//  AddressSetViewController.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/18.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "AddressSetViewController.h"

@interface AddressSetViewController ()
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *mobile;
@property (strong, nonatomic) IBOutlet UITextView *address;

@end

@implementation AddressSetViewController
-(void)viewWillAppear:(BOOL)animated{
    [self createMoreSubview:self name:@"添加新地址" right:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}
- (IBAction)finish:(id)sender {
    
    NSURL *urlString = [NSURL URLWithString:kGetMyAddress];
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //
    //    manager.securityPolicy.allowInvalidCertificates = YES;
    //
    //    NSDictionary *params = @{@"mobile":@"15988404695",
    //                             @"password":@"cw87404135"};
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
    request.HTTPMethod = @"POST";
    [request setValue:kUserCookie forHTTPHeaderField:@"Cookie"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

//    NSString *string = [NSString stringWithFormat:@"name=%@&mobile=%@&address=%@",_name.text,_mobile.text,_address.text];
//    NSLog(@"%@",string);
    NSDictionary *dic = @{@"name":_name.text,@"mobile":_mobile.text,@"address":_address.text
                          };
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
//    NSData *stringData = [data dataUsingEncoding:NSUTF8StringEncoding];
   
//    NSLog(@"%@",jsonString);
    
    request.HTTPBody = data;
    
    
    NSLog(@"%@",request);
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //            if (data==nil) {
        //                return ;
        //            }
        NSLog(@"成功");
        
        //        NSLog(@"%@",data);
        NSLog(@"%@",response);
        [self performSelectorOnMainThread:@selector(backButtonAction) withObject:nil waitUntilDone:NO];

           }];
    
    
    
    
    [dataTask resume];
    
    
    
}
-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    
//    self.navigationController.navigationBar.hidden = YES;
//    self.tabBarController.tabBar.hidden = NO;
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
