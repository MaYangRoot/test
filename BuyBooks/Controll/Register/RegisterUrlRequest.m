//
//  RegisterUrlRequest.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/6.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "RegisterUrlRequest.h"


static RegisterUrlRequest * manager = nil;
@implementation RegisterUrlRequest

+(RegisterUrlRequest *)manager{
    if (!manager) {
        manager = [[self alloc]init];
    }
    return manager;
}

//c初始化用来装在数据的容器
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [[NSMutableData alloc]init];
    }
    return self;
}

-(void)setFailBlock:(FAIL)fail{
    self.fail = fail;
}
-(void)setSuccessBlock:(SUCCESS)success{
    self.success = success;
}

-(void)createRequest:(NSString *)url AndUserName:(NSString *)userName AndPassWord:(NSString *)passWord{
    self.passWord = passWord;
    self.dataSource.length = 0;
    
    NSString * temp = [NSString stringWithFormat:@"%@username=%@&password=%@",url,userName,passWord];
    
    NSData * body = [temp dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    
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
    NSLog(@"error====%@",error);
    self.fail(@"请求失败!");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.dataSource appendData:data];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"请求完成");
    [self resquseSuccess];
    
}
-(void)resquseSuccess{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:self.dataSource options:NSJSONReadingMutableContainers error:nil];
    NSString * str = [dic objectForKey:@"info"];
    
    if([str isEqualToString:@"注册成功"]){
        
        NSDictionary * temp = [dic objectForKey:@"member"];
        [[NSUserDefaults standardUserDefaults]setValue:self.passWord forKey:@"passWord"];
        [[NSUserDefaults standardUserDefaults]setValue:[temp objectForKey:@"token"] forKey:@"token"];
        [[NSUserDefaults standardUserDefaults]setValue:[temp objectForKey:@"uid"] forKey:@"uid"];
        [[NSUserDefaults standardUserDefaults]setValue:[temp objectForKey:@"nickname"] forKey:@"userName"];
        [[NSUserDefaults standardUserDefaults]setValue:[temp objectForKey:@"photo"] forKey:@"photo"];
    }
    
    self.success(str);
}

@end
