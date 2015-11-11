//
//  FourMSYClassViewController.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/8.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "FourMSYClassViewController.h"
#import "Top_MSYClassFourTableViewCell.h"
#import "SecondTableViewCell.h"
#import "MSYFourClassRequest.h"

@interface FourMSYClassViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic,assign)NSInteger number;
@property (nonatomic,assign)BOOL flag;

@end

@implementation FourMSYClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flag = NO;
    self.number = 0;
    [self.TableView registerNib:[UINib nibWithNibName:@"Top_MSYClassFourTableViewCell" bundle:nil] forCellReuseIdentifier:@"TOP_Cell"];
    [self.TableView registerNib:[UINib nibWithNibName:@"SecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"MSYSecond"];
    [self setBlock];
    [[MSYFourClassRequest manager]startRequstAndItemId:self.itemId AndShopId:self.shopId];
}

//实例化网络请求页面的block
- (void)setBlock{
    //    实例化
    __weak typeof(self) weakself = self;
    [[MSYFourClassRequest manager]setSuccessBlock:^(NSString *str) {
        weakself.flag = YES;
//        weakself.number = [str integerValue];
        NSLog(@"%@",str);
        [weakself.TableView reloadData];
    }];
    
    //    请求错误展示alert
    [[MSYFourClassRequest manager]setFailBlock:^(NSString *str) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您的网络可能出现了问题！请重新再试！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }];
}


#pragma mark ---UITableView 协议

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        return 200.f;
    }
    return 100.f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!self.flag){
        return 0;
    }
    if (section == 0) {
        return 2;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 && indexPath.section == 0) {
//        Top_MSYClassFourTableViewCell * top = [tableView dequeueReusableCellWithIdentifier:@"TOP_Cell"];
        
        Top_MSYClassFourTableViewCell *  top = [tableView dequeueReusableCellWithIdentifier:@"TOP_Cell" forIndexPath:indexPath];
        return [[MSYFourClassRequest manager]customFirstCell:top];
        
    }else if (indexPath.row == 1) {
       SecondTableViewCell * second = [tableView dequeueReusableCellWithIdentifier:@"MSYSecond"];
        return second;
    }
        return nil;
}


@end
