//
//  MSYClassRequest.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/7.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "MSYClassRequest.h"
#import "MSYClassModel.h"


static MSYClassRequest * MSYClass = nil;
@implementation MSYClassRequest

+(MSYClassRequest *)manager {
    if (!MSYClass) {
        MSYClass = [[self alloc]init];
    }
    return MSYClass;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [[NSMutableData alloc]init];
        self.data = [[NSMutableArray alloc]init];
        self.secondeData = [[NSMutableArray alloc]init];
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
//创建网络请求
-(void)createRequestType:(NSInteger)type AndCatId:(NSInteger)catid{
    
    self.type = type;
//    开始处理数据
    if (type == 1) {
        if (self.dataSource) {
            self.dataSource.length = 0;
        }
        if (self.data.count != 0) {
            [self.data removeAllObjects];
        }
    }else{
        if (self.dataSource) {
            self.dataSource.length = 0;
        }
        if(self.secondeData.count != 0){
            [self.secondeData removeAllObjects];
        }
    }
    
    NSString * apiId = [NSString stringWithFormat:@"%@%ld",@"apiId=%E5%AD%94%E5%A4%AB%E5%AD%90%E6%97%A7%E4%B9%A6%E7%BD%91_iOS_1.4.3_1.0&catId=",catid];

    NSString * str = [NSString stringWithFormat:@"%@?%@",MSYCLASSFIRST,apiId];
//    开始调用网络请求
    [self startRequst:str];
    
}

//开始网络请求
- (void)startRequst:(NSString *)str{
    

    
    NSData * body = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:MSYCLASSFIRST]];
    
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

//返回cell需要的数据模型
- (MSYClassModel *)resuleSendTo:(NSIndexPath *)index AndType:(NSInteger)type{
    if (type == 1) {
        return [self.data objectAtIndex:index.row];
    }
    return [self.secondeData objectAtIndex:index.row];
}


//解析数据
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    [self netWorkDataSource:self.type];
}


//数据请求完成开始解析
- (void)netWorkDataSource:(NSInteger)type{
    
    NSString * count = nil;
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:self.dataSource options:NSJSONReadingMutableContainers error:nil];
    
    NSArray * dic1 = [dic objectForKey:@"list"];
    
    if (type == 1) {
        for (NSDictionary * obj in dic1) {
            MSYClassModel * model = [[MSYClassModel alloc]init];
            model.MSYId = [obj objectForKey:@"id"];
            model.hasLeaf = [obj objectForKey:@"hasLeaf"];
            model.name = [obj objectForKey:@"name"];
            model.count = [obj objectForKey:@"count"];
            [self.data addObject:model];
        }
        count = [NSString stringWithFormat:@"%ld/",self.data.count];

    }else{
//        NSLog(@"%@",dic);
        for (NSDictionary * obj in dic1) {
            MSYClassModel * model = [[MSYClassModel alloc]init];
            model.MSYId = [obj objectForKey:@"id"];
            model.hasLeaf = [obj objectForKey:@"hasLeaf"];
            model.name = [obj objectForKey:@"name"];
            model.count = [obj objectForKey:@"count"];
            [self.secondeData addObject:model];
        }
        count = [NSString stringWithFormat:@"%ld/",self.secondeData.count];
    }
    
    
    NSString * rel = [NSString stringWithFormat:@"%@/%@",count,@"请求成功"];
    
    self.success(rel);
    
}


@end
