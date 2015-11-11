//
//  MSYFourClassRequest.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/8.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"


typedef void(^SUCCESS)(NSString * str);
typedef void(^FAIL)(NSString * str);

@class Top_MSYClassFourTableViewCell;
@interface MSYFourClassRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,copy)SUCCESS success;
@property (nonatomic,copy)FAIL fail;
@property (nonatomic,strong)NSMutableData * dataSource;
//@property (nonatomic,strong)NSMutableArray * data;
//@property (nonatomic,strong)NSMutableArray * imageData;
//@property (nonatomic,strong)NSMutableArray * descListData;
@property (nonatomic,retain)JSONModelArray * data;


+(MSYFourClassRequest *)manager;
-(void)setSuccessBlock:(SUCCESS)success;
-(void)setFailBlock:(FAIL)fail;

- (void)startRequstAndItemId:(NSInteger)itemId AndShopId:(NSInteger)shopId;
-(UITableViewCell *)customFirstCell:(Top_MSYClassFourTableViewCell * )cell;
@end
