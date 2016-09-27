//
//  SuggestViewController.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/13.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "SuggestViewController.h"

@interface SuggestViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMoreSubview:self name:@"建议与意见" right:YES];
    
    [self.navigationItem.rightBarButtonItem setTitle:@"提交"];
    
    

}

-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    
    //    self.navigationController.navigationBar.hidden = YES;
    //    self.tabBarController.tabBar.hidden = NO;
}

-(void)resetButtonAction{
    NSURL *urlString =[NSURL URLWithString:kFeedBack];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
    request.HTTPMethod = @"POST";
    [request setValue:@"sanlian-session=MTQ3Mzc0OTM5OHxEdi1CQkFFQ180SUFBUkFCRUFBQU5mLUNBQUVHYzNSeWFXNW5EQVVBQTNWcFpBWnpkSEpwYm1jTUdnQVlOVGRpTVRJeVpHVTNZMlkzTVRFM05tSmpZalJsTlRSanxMxDyk6grk6KcRDg9TQSHHVl5f2LPLkUwBh28U1Qu_jQ==" forHTTPHeaderField:@"Cookie"];
    
      [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *dic = @{@"text":_textView.text};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    request.HTTPBody = jsonData;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"成功");
        
        //        NSLog(@"%@",data);
        NSLog(@"%@",response);
        
//        [self performSelectorOnMainThread:@selector(tabReload) withObject:nil waitUntilDone:NO];
        
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
