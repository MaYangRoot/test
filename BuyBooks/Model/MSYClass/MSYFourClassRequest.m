//
//  MSYFourClassRequest.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/8.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "MSYFourClassRequest.h"
#import "MSYFourModel.h"
#import "Top_MSYClassFourTableViewCell.h"
#import "UIImageView+WebCache.h"

static MSYFourClassRequest * manager = nil;
@implementation MSYFourClassRequest


+(MSYFourClassRequest *)manager{
    if (!manager) {
        manager = [[self alloc]init];
    }
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [[NSMutableData alloc]init];
    }
    return self;
}

//请求成功地回调
-(void)setSuccessBlock:(SUCCESS)success{
    self.success = success;
}
//请求失败的回调
-(void)setFailBlock:(FAIL)fail{
    self.fail = fail;
}

//开始网络请求
- (void)startRequstAndItemId:(NSInteger)itemId AndShopId:(NSInteger)shopId{
    
    if (self.dataSource.length != 0) {
        self.dataSource.length = 0;
    }
    
    ////405021824&shopId=5812
    
    NSString * str = [NSString stringWithFormat:@"%@%ld%@%ld",MSYCLASSFOUR,itemId,@"&shopId=",shopId];
    
    NSData * body = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str]];
    
    [request setHTTPBody:body];
    
    
    //获得请求体的长度
    NSUInteger length = body.length;
    //设置请求头
    [request addValue:[NSString stringWithFormat:@"%lu", length] forHTTPHeaderField:@"Content-Length"];
    [request addValue:@"app.kongfz.com" forHTTPHeaderField:@"Host"];
    [request addValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [request addValue:@"Accept-Encoding" forHTTPHeaderField:@"gzip, deflate"];
    [request addValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"zh-Hans-CN;q=1" forHTTPHeaderField:@"Accept-Language"];
    [request addValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [request addValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:41.0) Gecko/20100101 Firefox/41.0" forHTTPHeaderField:@"User-Agent"];
    
    
    //设置请求为POST方法
    [request setHTTPMethod:@"POST"];
    //建立连接
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
    
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    self.fail(@"加载失败");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.dataSource appendData:data];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self netWorkDataSource];
}


- (void)netWorkDataSource{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:self.dataSource options:NSJSONReadingMutableContainers error:nil];
    
    NSArray * temp = @[dic];
    self.data = [[JSONModelArray alloc]initWithArray:temp modelClass:[MSYFourModel class]];
    self.success(@"请求成功");
}


-(UITableViewCell *)customFirstCell:(Top_MSYClassFourTableViewCell * )cell{
    MSYFourModel * model = [self.data objectAtIndex:0];
    NSArray * temp = model.imgList;
    
    for (int i = 0; i < temp.count; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * cell.ScrollView.Width, 0, cell.ScrollView.Width, cell.ScrollView.Height)];
        imgList * img = [temp objectAtIndex:i];
        NSURL * url = [NSURL URLWithString:img.big];
        [imageView setImageWithURL:url placeholderImage:nil];
        
        [cell.ScrollView addSubview:imageView];
        cell.ScrollView.contentSize = CGSizeMake(i * cell.ScrollView.Width, 0);
        NSLog(@"%d",i);
    }
    
    return cell;
}

@end
