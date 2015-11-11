//
//  RootViewController.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "RootCollectionViewCell.h"
#import "RootCollectionReusableView.h"
#import "RootCollectionViewCellControll.h"
#import "MainViewController.h"


@interface RootViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
//第一页面上边面 imageView 布局
@property (nonatomic,retain)UIImageView * imageView;
//第一页面下半页的页面
@property (nonatomic,retain)UICollectionView * collect;
//用户按钮
@property (nonatomic,retain)UIButton * login;
//用户登录后的图像
@property (nonatomic,retain)UIImageView * userImage;

@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
//    隐藏上导航
    self.navigationController.navigationBar.hidden = YES;
    
//    创建上半格页面的imageView视图
    [self createImageView];
//    创建下边的视图
    [self createBottomView];
//    创建一个用户登陆的imageView
    [self createUserImageView];

    
//    注册cell
    [self.collect registerClass:[RootCollectionViewCell class] forCellWithReuseIdentifier:@"Root"];
    [self.collect registerClass:[RootCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Head"];
}

//给添加手势
- (void)addGestueToLogin:(UIView *)view{
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loginDidCliked:)];
    [view addGestureRecognizer:gesture];
}

//手势事件（登录按钮被点击）
- (void)loginDidCliked:(id)sender{
//    跳转到登录页面
    
//    MainViewController * main = [MainViewController manager];
//    [self presentViewController:main animated:YES completion:NULL];
    
    LoginViewController * login = [[LoginViewController alloc]init];
//    使两个页面建立联系，用来隐藏状态栏
    __weak typeof(self) weakself = self;
    [login setBlock:^{
        weakself.navigationController.navigationBar.hidden = YES;
    }];
    
    
    [self.navigationController pushViewController:login animated:YES];
}

//创建一个用户登录的按钮
- (void)createUserImageView{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"avatar" ofType:@"png"];
    UIImage * image = [UIImage imageWithContentsOfFile:path];
    self.userImage = [[UIImageView alloc]init];
    [self.userImage setWidth:100];
    [self.userImage setHeight:100];
    self.userImage.center = self.imageView.center;
    self.userImage.image = image;
    self.userImage.userInteractionEnabled = YES;
    self.userImage.layer.masksToBounds = YES;
    self.userImage.layer.cornerRadius = 50.f;
//    添加登录手势
    [self addGestueToLogin:self.userImage];
    [self.view addSubview:self.userImage];
    
//    在用户登录的图像下边添加一个登录的文字
    
   
    self.login = [UIButton buttonWithType:UIButtonTypeCustom];
    self.login.frame = CGRectMake(self.userImage.Left, self.userImage.Bottom + 5, self.userImage.Width, 30);
    [self.login setTitle:@"登 陆" forState:UIControlStateNormal];
    [self.login addTarget:self action:@selector(loginDidCliked:) forControlEvents:UIControlEventTouchUpInside];
//    添加登录手势
    [self.view addSubview:self.login];
}

//第一页面上边面 imageView 布局
-(void)createImageView{
//    创建并添加一个ImageView
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight / 2 - 50)];
    NSString * imagePath = [[NSBundle mainBundle]pathForResource:@"home_banner_bac.png" ofType:nil];
    UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
    self.imageView.image = image;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
}

//创建并且实例化collectionView
-(void)createBottomView{
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0.f;
    flowLayout.minimumInteritemSpacing = 0.f;
    CGFloat height = ( ScreenHeight - self.imageView.Bottom - 64 ) / 2 - 20;
    flowLayout.itemSize = CGSizeMake(ScreenWidth / 4, height);
    flowLayout.headerReferenceSize = CGSizeMake(ScreenWidth, 40);
    
    
    self.collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.imageView.Bottom, ScreenWidth, ScreenHeight - self.imageView.Bottom) collectionViewLayout:flowLayout];
    self.collect.dataSource = self;
    self.collect.delegate = self;
    
    self.collect.backgroundColor = WhiteColor;
    [self.view addSubview:self.collect];
}



#pragma mark -----UICollectionView 协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

//返回cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    从复用队列取出cell
    RootCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Root" forIndexPath:indexPath];
    [cell createView];
//    定制cell
     cell = (RootCollectionViewCell *) [[RootCollectionViewCellControll manager]customCell:cell AndIndex:indexPath];
    return  cell;
}

//返回头视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    RootCollectionReusableView * head = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Head" forIndexPath:indexPath];
    [head createView];
//    返回头视图的内容
    if (indexPath.section == 0) {
        head.label.text = @"店铺";
    }else{
        head.label.text = @"竞拍";
    }
    return head;
}




-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        MainViewController * main = [[MainViewController alloc]init];
        [self.navigationController pushViewController:main animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
