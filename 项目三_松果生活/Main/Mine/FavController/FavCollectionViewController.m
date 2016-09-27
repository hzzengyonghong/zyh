//
//  TextCollectionViewController.m
//  项目三_松果生活
//
//  Created by mac56 on 16/9/12.
//  Copyright © 2016年 CW. All rights reserved.
//

#import "FavCollectionViewController.h"
#import "PersonModel.h"
#import "FavCollectionViewCell.h"

@interface FavCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *dataArr;
    UIButton *favButton;
    
    NSMutableArray *selectedArray;
    
}
@property (strong, nonatomic) IBOutlet UICollectionView *myView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation FavCollectionViewController
bool favSet=NO;//是否处于编辑模式
//static NSString * const reuseIdentifier = @"Cell";
-(void)setModel:(PersonModel *)model{
    _model = model;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMoreSubview:self name:@"文章" right:YES];
    
    favButton = [[UIButton alloc]initWithFrame:CGRectZero];
   
    
    favButton.backgroundColor = [UIColor orangeColor];
    
    [favButton setTitle:@"取消关注" forState:UIControlStateNormal];

    [favButton addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:favButton aboveSubview:_myView];

    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //_myView.backgroundColor = [UIColor orangeColor];
    [self _loadData];
    [self.myView registerNib:[UINib nibWithNibName:@"FavCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"favCollection"];
    _myView.dataSource = self;
    _myView.delegate = self;
    
    
    favButton = [[UIButton alloc]init];
    [self.view addSubview:favButton];
    
    _myView.backgroundColor = [UIColor whiteColor];
    _layout.itemSize = CGSizeMake(200, 200);
    _layout.minimumInteritemSpacing = 10;
    _layout.minimumLineSpacing = 20;
    

    // Do any additional setup after loading the view.
}
-(void)_loadData{
    //使用第三方库，请求网络数据
    NSURL *urlString = [NSURL URLWithString:[NSString stringWithFormat:@"http://songguolife.com/api/user/%@/fav/users?page=0&pageSize=15",self.model.uid]];
    
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
            
        
        PersonModel *model = [[PersonModel alloc]init];
            model.icon = dic[@"icon"];
            model.signature = dic[@"signature"];
            model.nick = dic[@"nick"];
            model.uid = dic[@"id"];
            
//            NSLog(@"%@",model.nick);
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



#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FavCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"favCollection" forIndexPath:indexPath];
    
    // Configure the cell
    cell.pmodel = dataArr[indexPath.row];
    int i = (int)dataArr.count;
    if (favSet==YES) {
        for (PersonModel *model in selectedArray) {
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
    }
    else{
        [cell.button setImage:nil forState:UIControlStateNormal];
        
    }
    return cell;
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
    if (favSet==YES) {
        
        //添加被选中单元格的model数据到selectedarray；
        PersonModel *model = [[PersonModel alloc]init];
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
-(void)resetButtonAction{
    
    favButton.frame = CGRectMake(0, kScreenHeight-150, kScreenWidth, 150);
    if (favSet==NO) {
        //进入编辑模式
        //        NSLog(@"进入编辑");
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
        rightButtonItem.tintColor = [UIColor blackColor];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
        
        favButton.frame =CGRectMake(0, kScreenHeight-50, kScreenWidth, 50);
        
        selectedArray = [NSMutableArray array];
        //        [selectedArray addObject:dataArr[0]];®
        
        
        
        
    }else{
//        NSLog(@"取消");
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonAction)];
        rightButtonItem.tintColor = [UIColor blackColor];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
        favButton.frame =CGRectZero;
    }
    favSet=!favSet;
    [_myView setContentOffset:CGPointMake(0,0) animated:NO];
    [_myView reloadData];
    
}
-(void)backButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
    favSet = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)deleteButtonAction{
    NSLog(@"nihao");
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
