//
//  MSYFourModel.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/8.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "MSYFourModel.h"

@implementation MSYFourModel

@end
@implementation imgList

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"ListId"}];
}

@end

@implementation shop

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"MSYId",@"class":@"MSYClass"}];
}

@end

@implementation descList


@end
@implementation shipData

@end