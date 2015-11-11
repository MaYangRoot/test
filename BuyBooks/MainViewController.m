//
//  MainViewController.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/6.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "MainViewController.h"
#import "MSYClassViewController.h"

@interface MainViewController ()<UITabBarDelegate>

@property (nonatomic,assign)NSInteger oldSelect;

@end

static MainViewController * main = nil;
@implementation MainViewController

+ (MainViewController *)manager{
    if (!main) {
        main = [[self alloc]init];
    }
    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self addGesture];
}

//添加tabbar的手势，使之可以返回跟视图
-(void)addGesture{
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureCliked:)];
    [self.view addGestureRecognizer:swipe];
}
//手势相应时间
- (void)gestureCliked:(UISwipeGestureRecognizer *)swipe{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createView{
    NSArray * titleArray = @[@"分类"];
    NSArray * noSelectImage = @[@"bookstore_tabbar_02@2x"];
    NSArray * selectImage = @[@"bookstore_tabbar_02_sel@2x"];
    
    
    MSYClassViewController * msyClass = [[MSYClassViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:msyClass];
//    nav.navigationItem.title = @"分类";
    
    self.viewControllers = @[nav];
    
    for (int i = 0; i < titleArray.count; i++) {
        CGFloat width = ScreenWidth / titleArray.count;
//        创建一个button放在items
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString * noSelectimagePath = [[NSBundle mainBundle]pathForResource:[noSelectImage objectAtIndex:i] ofType:@"png"];
//        设置图片的渲染模式
        UIImage * noSelectImage1 = [UIImage imageWithContentsOfFile:noSelectimagePath];
        noSelectImage1 = [noSelectImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [button setImage:noSelectImage1 forState:UIControlStateNormal];
        NSString * selectImagePath = [[NSBundle mainBundle]pathForResource:[selectImage objectAtIndex:i] ofType:@"png"];
        
        UIImage * selectImage1 = [UIImage imageWithContentsOfFile:selectImagePath];
        selectImage1 = [selectImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [button setImage:selectImage1 forState:UIControlStateSelected];
        button.frame = CGRectMake(i * width, 0, width , 49);
        
        [button addTarget:self action:@selector(ButtonDidCliked:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            button.selected = YES;
            self.oldSelect = button.tag;
        }
        
        [self.tabBar addSubview:button];
    }
    
}

-(void)ButtonDidCliked:(UIButton *)button{
    if (button.tag == self.oldSelect) {
        return;
    }
    UIButton * oldButton = (UIButton *)[self.view viewWithTag:self.oldSelect];
    oldButton.selected = NO;
    button.selected = YES;
    self.oldSelect = button.tag;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"%@",item.title);
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
