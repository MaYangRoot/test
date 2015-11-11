//
//  MSYThreeClassRequest.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/7.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void(^SUCCESS)(NSString * str);
typedef void(^FAIL)(NSString * str);

@class MSYClassTableViewCell,MSYThreeModel;
@interface MSYThreeClassRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic,copy)SUCCESS success;
@property (nonatomic,copy)FAIL fail;
@property (nonatomic,strong) NSMutableData * dataSource;
@property (nonatomic,strong) NSMutableArray * data;

+ (MSYThreeClassRequest *)manager ;

- (void)startRequst:(NSInteger)catid AndOrder:(NSInteger)order AndPage:(NSInteger)page;
-(void)setSuccessBlock:(SUCCESS)success;
-(void)setFailBlock:(FAIL)fail;
-(MSYThreeModel *)sendDataToController:(NSIndexPath *)index;

- (UITableViewCell *)customCell:(MSYClassTableViewCell *)cell AndIndex:(NSIndexPath *)index;
@end
