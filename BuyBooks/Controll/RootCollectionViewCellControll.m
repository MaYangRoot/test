//
//  RootCollectionViewCellControll.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "RootCollectionViewCellControll.h"
#import "RootCollectionViewCell.h"

static RootCollectionViewCellControll * manager = nil;
@implementation RootCollectionViewCellControll

+(RootCollectionViewCellControll *)manager{
    if (!manager) {
        manager = [[self alloc]init];
    }
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray * dataTop = @[@"home_ent_01",@"home_ent_02",@"home_ent_03",@"home_ent_04"];
        NSArray * dataBottom = @[@"home_ent_05",@"home_ent_06",@"home_ent_07",@"home_ent_08"];
        self.dataSource = @[dataTop,dataBottom];
        
        NSArray * titleTop = @[@"分类",@"购物车",@"收藏",@"订单"];
        NSArray * titleBottom = @[@"拍卖",@"竞拍",@"收藏",@"交易"];
        self.dataTitle = @[titleTop,titleBottom];
    }
    return self;
}
-(RootCollectionViewCell *)customCell:(RootCollectionViewCell *)cell AndIndex:(NSIndexPath *)index{
//    取得数据定制cell
    NSArray * tempImage = [self.dataSource objectAtIndex:index.section];
    NSArray * tempTitle = [self.dataTitle objectAtIndex:index.section];
    NSString * imageName = [tempImage objectAtIndex:index.row];
    NSString * title = [tempTitle objectAtIndex:index.row];
    NSString * imagePath = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
    UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
    
    cell.imageView.image = image;
    cell.title.text = title;
    
    return cell;
}

@end
