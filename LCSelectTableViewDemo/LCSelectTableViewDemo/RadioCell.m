//
//  RadioCell.m
//  LCSelectTableViewDemo
//
//  Created by LiCheng on 2016/12/30.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "RadioCell.h"

@implementation RadioCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+(instancetype)loadCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

@end
