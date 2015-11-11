//
//  MSYThreeClassRequest.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/7.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "MSYThreeClassRequest.h"
#import "MSYThreeModel.h"
#import "MSYClassTableViewCell.h"
#import "UIImageView+WebCache.h"

static MSYThreeClassRequest * manager = nil;

@implementation MSYThreeClassRequest

+(MSYThreeClassRequest *)manager{
    if (!manager) {
        manager = [[self alloc]init];
    }
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = [[NSMutableArray alloc]init];
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
- (void)startRequst:(NSInteger)catid AndOrder:(NSInteger)order AndPage:(NSInteger)page{
    
    if (self.dataSource.length != 0) {
        self.dataSource.length = 0;
    }
    if (self.data.count != 0) {
        [self.data removeAllObjects];
    }
    
    NSString * str = [NSString stringWithFormat:@"%@%ld%@",MSYCLASSTHREE,catid,@"&order="];
    
    str = [NSString stringWithFormat:@"%@%ld%@%ld",str,order,@"&page=",page];
//    NSString * str = [NSString stringWithFormat:@"%@%ld%@",MSYCLASSTHREE,catid,@"&order=0&page=0"];
    
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

    NSArray * temp = [dic objectForKey:@"list"];
    for (NSDictionary * obj in temp) {
        
        MSYThreeModel * model = [[MSYThreeModel alloc]init];
        model.area = [obj objectForKey:@"area"];
        model.date = [obj objectForKey:@"date"];
        model.MSYid = [obj objectForKey:@"id"];
        model.name = [obj objectForKey:@"name"];
        model.price = [obj objectForKey:@"price"];
        model.quality = [obj objectForKey:@"quality"];
        model.shopId = [obj objectForKey:@"shopId"];
        model.shopLevel = [obj objectForKey:@"shopLevel"];
        model.shopName = [obj objectForKey:@"shopName"];
        model.smallImg = [obj objectForKey:@"smallImg"];
        
        [self.data addObject:model];
    }
    
//    调用开始方法；
    NSString * str = [NSString stringWithFormat:@"%ld",self.data.count];
    self.success(str);
}

//定制cell
- (UITableViewCell *)customCell:(MSYClassTableViewCell *)cell AndIndex:(NSIndexPath *)index{
    MSYThreeModel * model = [self.data objectAtIndex:index.row];
    
    cell.title.text = model.name;
    float pr = [model.price floatValue];
    NSString * price = [NSString stringWithFormat:@"%.2f",pr];
    cell.money.text = price;
    cell.jibie.text = model.quality;
    cell.place.text = model.shopName;
    
//    新开线程用来后台请求网络图片
//    [NSThread detachNewThreadSelector:@selector(requestImageView:) toTarget:self withObject:@{@"cell":cell,@"imagePath":model.smallImg}];
    
    [cell.ImageView setImageWithURL:model.smallImg placeholderImage:nil];
    
    return cell;
}

//返回某个数据指定的
-(MSYThreeModel *)sendDataToController:(NSIndexPath *)index{
    MSYThreeModel * model = [self.data objectAtIndex:index.row];
    return model;
}


//请求网络图片
- (void)requestImageView:(NSDictionary *)dic{
    
    NSURL * url = [NSURL URLWithString:[dic objectForKey:@"imagePath"]];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    
    MSYClassTableViewCell * cell = [dic objectForKey:@"cell"];
    cell.ImageView.image = image;
}

@end
