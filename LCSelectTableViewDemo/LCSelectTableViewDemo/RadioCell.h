//
//  RadioCell.h
//  LCSelectTableViewDemo
//
//  Created by LiCheng on 2016/12/30.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *checkImg;

+(instancetype)loadCell;
@end
