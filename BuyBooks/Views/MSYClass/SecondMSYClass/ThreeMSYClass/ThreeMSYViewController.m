//
//  ThreeMSYViewController.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/7.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "ThreeMSYViewController.h"
#import "MSYThreeClassRequest.h"
#import "MSYClassTableViewCell.h"
#import "FourMSYClassViewController.h"
#import "MSYThreeModel.h"


@interface ThreeMSYViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segMent;
@property (nonatomic,assign) NSInteger number;


@end

@implementation ThreeMSYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = self.Title;
    self.number = 0;
    [self setBlock];
    
    [self.TableView registerNib:[UINib nibWithNibName:@"MSYClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"Three"];
    
    [[MSYThreeClassRequest manager]startRequst:self.catid AndOrder:0 AndPage:0];
}

//步进器被点击
- (IBAction)segmentedDidCliked:(id)sender {
    UISegmentedControl * segment = (UISegmentedControl *)sender;
    
    [self restartNetRequest:segment];
}

- (void)restartNetRequest:(UISegmentedControl *)segment{
    if (segment.selectedSegmentIndex == 0) {
        [[MSYThreeClassRequest manager]startRequst:self.catid AndOrder:0 AndPage:0];
    }else if(segment.selectedSegmentIndex == 1){
        [[MSYThreeClassRequest manager]startRequst:self.catid AndOrder:1 AndPage:1];
    }else if (segment.selectedSegmentIndex == 2){
        [[MSYThreeClassRequest manager]startRequst:self.catid AndOrder:2 AndPage:1];
    }else{
        [[MSYThreeClassRequest manager]startRequst:self.catid AndOrder:-4 AndPage:1];
    }
}

//实例化网络请求页面的block
- (void)setBlock{
    //    实例化
    __weak typeof(self)weakself = self;
    [[MSYThreeClassRequest manager]setSuccessBlock:^(NSString *str) {
     
        weakself.number = [str integerValue];
        [weakself.TableView reloadData];
    }];
    
    //    请求错误展示alert
    [[MSYThreeClassRequest manager]setFailBlock:^(NSString *str) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您的网络可能出现了问题！请重新再试！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.number;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSYClassTableViewCell   * cell = [tableView dequeueReusableCellWithIdentifier:@"Three"];
    
    return [[MSYThreeClassRequest manager]customCell:cell AndIndex:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    获取被点击哪一行的数据
     MSYThreeModel * model = [[MSYThreeClassRequest manager]sendDataToController:indexPath];
    
    FourMSYClassViewController * four = [[FourMSYClassViewController alloc]init];
   
    four.itemId = [model.MSYid integerValue];
    four.shopId = [model.shopId integerValue];
    
    [self.navigationController pushViewController:four animated:YES];
}

@end
