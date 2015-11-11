//
//  MSYClassRequest.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/7.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>



@class MSYClassModel;

typedef void(^SUCCESS)(NSString * str);
typedef void(^FAIL)(NSString * str);


@interface MSYClassRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic,assign)NSInteger type;
@property (nonatomic,strong) NSMutableData * dataSource;
@property (nonatomic,strong) NSMutableArray * data;

@property (nonatomic,strong) NSMutableArray * secondeData;

@property (nonatomic,copy)SUCCESS success;
@property (nonatomic,copy)FAIL fail;


+(MSYClassRequest *)manager;
-(void)createRequestType:(NSInteger)type AndCatId:(NSInteger)catid;

-(void)setSuccessBlock:(SUCCESS)success;
-(void)setFailBlock:(FAIL)fail;


- (MSYClassModel *)resuleSendTo:(NSIndexPath *)index AndType:(NSInteger)type;
@end
