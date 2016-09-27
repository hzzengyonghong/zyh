//
//  TextCollectionViewController.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/12.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "TextCollectionViewController.h"
#import "TextModel.h"
#import "CollectionViewCell.h"
@interface TextCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *dataArr;
    UIButton *setButton;
    
    NSMutableArray *selectedArray;
}
@property (strong, nonatomic) IBOutlet UICollectionView *myView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation TextCollectionViewController
bool textSet=NO;//是否处于编辑模式
//static NSString * const reuseIdentifier = @"Cell";
-(void)setModel:(PersonModel *)model{
    _model = model;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self createMoreSubview:self name:@"文章" right:YES];
    setButton = [[UIButton alloc]initWithFrame:CGRectZero];
    
    setButton.backgroundColor = [UIColor orangeColor];
    
    [setButton setTitle:@"取消收藏" forState:UIControlStateNormal];
    
    [setButton addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:setButton aboveSubview:_myView];
    
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //_myView.backgroundColor = [UIColor orangeColor];
    [self _loadTextData];
    [self.myView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"textCollection"];
    _myView.dataSource = self;
    _myView.delegate = self;
    
    _myView.backgroundColor = [UIColor whiteColor];
    _layout.itemSize = CGSizeMake(200, 200);
    _layout.minimumInteritemSpacing = 10;
    _layout.minimumLineSpacing = 20;
    

    // Do any additional setup after loading the view.
}
-(void)_loadTextData{
    //使用第三方库，请求网络数据
    NSURL *urlString = [NSURL URLWithString:[NSString stringWithFormat:@"http://songguolife.com/api/user/%@/fav/articles?page=0&pageSize=15",self.model.uid]];
        
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
    request.HTTPMethod = @"GET";
//    [request setValue:kUserCookie forHTTPHeaderField:@"Cookie"];
    
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"成功");
        
        //        NSLog(@"%@",data);
        NSLog(@"%@",response);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *mDictionary;
        mDictionary = [dic copy];
        //        NSLog(@"%@",mDictionary[@"nick"]);
        
        
        dataArr = [NSMutableArray array];
        for (NSDictionary *dic in mDictionary) {
            
        
        TextModel *model = [[TextModel alloc]init];
        model.textID = dic[@"article"][@"id"];
        model.imageURL = dic[@"article"][@"topImage"][@"url"];
        model.title = dic[@"article"][@"title"];
        NSLog(@"%@",model.imageURL);
        model.type =dic[@"type"];
            
        [dataArr addObject:model];
            
        }
        
        [self performSelectorOnMainThread:@selector(tabReload) withObject:nil waitUntilDone:NO];
        
    }];
    
    
    
    
    [dataTask resume];
    
    
    
    
    
}
-(void)tabReload{
    [_myView reloadData];
};
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

#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"textCollection" forIndexPath:indexPath];
    
    // Configure the cell
    cell.model = dataArr[indexPath.row];
    
    int i = (int)dataArr.count;
    if (textSet == YES) {
        
    
        for (TextModel *model in selectedArray) {
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
            
//            cell.button.backgroundColor = [UIColor whiteColor];

        }

    }else{
        [cell.button setImage:nil forState:UIControlStateNormal];
    }
        
        
    
    
    return cell;
}
-(void)resetButtonAction{
    
    setButton.frame = CGRectMake(0, kScreenHeight-50, kScreenWidth, 50);
    if (textSet==NO) {
        //进入编辑模式
        //        NSLog(@"进入编辑");
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
        rightButtonItem.tintColor = [UIColor blackColor];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
        setButton.frame =CGRectMake(0, kScreenHeight-50, kScreenWidth, 50);
        
        selectedArray = [NSMutableArray array];
        //        [selectedArray addObject:dataArr[0]];®
        
        
        
        
    }else{
        NSLog(@"取消");
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
        rightButtonItem.tintColor = [UIColor blackColor];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
        setButton.frame =CGRectZero;
    }
    textSet=!textSet;
    [_myView setContentOffset:CGPointMake(0,0) animated:NO];
    [_myView reloadData];

}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (textSet==YES) {
        
        //添加被选中单元格的model数据到selectedarray；
        TextModel *model = [[TextModel alloc]init];
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
        
        [_myView reloadData];
    }

}
-(void)deleteButtonAction{
        //使用第三方库，请求网络数据
        NSURL *urlString = [NSURL URLWithString:kArticleRemove];
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
        for (TextModel *model in selectedArray) {
            NSDictionary *diction = [[NSDictionary alloc]init];
            NSLog(@"textIDIDID=%@",model);
            diction = @{@"id":[NSString stringWithFormat:@"%@",model.textID],@"type":@0};
            
            [selArr addObject:diction];
            
        }
        NSArray *array = [selArr copy];
        NSDictionary *dic = @{@"ids":array};
    NSLog(@"dic=%@",dic);
        NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        
        request.HTTPBody = data;
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"%@",response);
            [self performSelectorOnMainThread:@selector(resetButtonAction) withObject:nil waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(_loadTextData) withObject:nil waitUntilDone:NO];
        }];
        
        
        
        
        
        [dataTask resume];
        
    

    
}
-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    textSet = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
