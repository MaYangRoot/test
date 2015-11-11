//
//  BaseViewController.m
//  TEST
//
//  Created by QianFeng on 15/9/9.
//  Copyright (c) 2015年 MaShaoYang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //调用初始化数据
    [self initData];
    //调用创建视图
    [self createView];
    //调用添加事件
    [self addTouchAction];
    
    [self backAction];
}
- (void)initData{

}
- (void)createView{
    
}
- (void)addTouchAction {

}
- (void)backAction {
    
}
- (void)ButtonDidCliked:(UIButton *)button{
    
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
