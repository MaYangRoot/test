//
//  RegisterUrlRequest.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/6.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void(^SUCCESS)(NSString * str);
typedef void(^FAIL)(NSString * str);

@interface RegisterUrlRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,retain)NSString * passWord;
@property (nonatomic,copy)SUCCESS success;
@property (nonatomic,copy)FAIL fail;

@property (nonatomic,retain)NSMutableData * dataSource;
/*
 *实例化一个网络请求对象，做成单例
 */
+(RegisterUrlRequest *)manager;

-(void)setSuccessBlock:(SUCCESS)success;
-(void)setFailBlock:(FAIL)fail;

-(void)createRequest:(NSString *)url AndUserName:(NSString *)userName AndPassWord:(NSString *)passWord;
@end
