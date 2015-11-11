//
//  MSYClassViewController.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/7.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "MSYClassViewController.h"
#import "MSYClassRequest.h"
#import "MSYClassModel.h"
#import "SecondMSYViewController.h"


@interface MSYClassViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic,assign) NSInteger number;


@end

@implementation MSYClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"分类";
    
    self.number = 0;
    
    [self.TableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self setBlock];
    
    [[MSYClassRequest manager]createRequestType:1 AndCatId:0];
    
}
//实例化网络请求页面的block
- (void)setBlock{
//    实例化
    __weak typeof(self)weakself = self;
    [[MSYClassRequest manager]setSuccessBlock:^(NSString *str) {
//        请求成功，调用结果
        [weakself relustToObject:str];
        
    }];
    
//    请求错误展示alert
    [[MSYClassRequest manager]setFailBlock:^(NSString *str) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您的网络可能出现了问题！请重新再试！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }];
}
//解析网络请求返回的结果
- (void)relustToObject:(NSString *)str{
    
    NSArray * temp = [str componentsSeparatedByString:@"/"];
    NSString * num = [temp objectAtIndex:0];
    
    self.number = [num integerValue];
    [self.TableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.number;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    MSYClassModel * model = [[MSYClassRequest manager]resuleSendTo:indexPath AndType:1];
    
    NSString * cellTitle = [NSString stringWithFormat:@"%@(%@)",model.name,model.count];
    
    //设置Cell的附件
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = cellTitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    获取被点击哪一行的数据
    MSYClassModel * model = [[MSYClassRequest manager]resuleSendTo:indexPath AndType:1];
    
    SecondMSYViewController * second = [[SecondMSYViewController alloc]init];
    
    second.catid = [model.MSYId integerValue];
    
    second.Title = model.name;
    
    [self.navigationController pushViewController:second animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
