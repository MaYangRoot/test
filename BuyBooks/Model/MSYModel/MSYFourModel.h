//
//  MSYFourModel.h
//  BuyBooks
//
//  Created by QianFeng on 15/11/8.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class imgList,shop,descList,shipData;

@protocol imgList <NSObject>

@end

@protocol descList <NSObject>

@end



@interface MSYFourModel : JSONModel

@property (nonatomic ,strong)NSNumber * status;
@property (nonatomic,retain)NSArray <imgList> * imgList;
@property (nonatomic,strong)NSString * name;
//@property (nonatomic,strong)id  promise;
@property (nonatomic,strong)NSNumber * price;
@property (nonatomic,strong)NSNumber * oriPrice;
@property (nonatomic,strong)NSNumber * oldPrice;
@property (nonatomic,strong)NSString * quality;
@property (nonatomic,strong)NSNumber * count;
@property (nonatomic,strong)NSNumber * sold;
@property (nonatomic,strong)NSString * itemSn;
@property (nonatomic,strong)NSString * url;
@property (nonatomic,strong)NSString *area;
@property (nonatomic,strong)NSNumber * mouldId;
@property (nonatomic,strong)shipData* shipData;
@property (nonatomic,strong)NSArray <descList>* descList;
@property (nonatomic,strong)NSString * detail;
@property (nonatomic,strong)shop* shop;

@end

@interface shipData : JSONModel
@property (nonatomic,strong)NSNumber * type;
@end

@interface shop : JSONModel

@property (nonatomic,strong)NSNumber * MSYId;
@property (nonatomic,strong)NSString * name;
@property (nonatomic,strong)NSString * ownerName;
@property (nonatomic,strong)NSString * ownerId;
@property (nonatomic,strong)NSString * rate;
@property (nonatomic,strong)NSNumber * credit;
@property (nonatomic,strong)NSNumber * MSYClass;

@end


@interface descList : JSONModel

@property (nonatomic,strong)NSString * n;
@property (nonatomic,strong)NSString * c;

@end


@interface imgList : JSONModel

@property (nonatomic,strong)NSNumber * ListId;
@property (nonatomic,strong)NSString * big;
@property (nonatomic ,strong)NSString * middle;
@property (nonatomic,strong)NSString * small;
@end