//
//  RadioViewController.m
//  LCSelectTableViewDemo
//
//  Created by LiCheng on 2016/12/30.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "CheckBoxViewController.h"

@interface CheckBoxViewController ()


/** 数据 */
@property (nonatomic, strong) NSArray *datas;
/** 选中的数组 */
@property (nonatomic, strong)  NSMutableArray *selDatas;


@end

@implementation CheckBoxViewController

-(NSMutableArray *)selDatas{
    if (_selDatas==nil) {
        _selDatas = [NSMutableArray array];
    }
    return _selDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
    self.datas = @[@"第一行",@"第二行",@"第三行",@"第四行",@"第五行",@"第六行",@"第七行",@"第八行",@"第九行",@"第十行",@"第十一行",@"第十二行",@"第13行",@"第14行",@"第15行",@"第16行",@"第17行",@"第18行",@"第19行",@"第20行",@"第21行",@"第22行",@"第23行",@"第24行",];
    
    // 右按钮， 获取选择的 cell 的数据
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                 style:(UIBarButtonItemStyleDone)
                                                                target:self
                                                                action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

/** 确定按钮 触发事件 */
-(void)rightClick{
    
    NSString *message = @"您还没有选择 cell";
    
   
    if (self.selDatas.count != 0) {
        message = @"";
        for (NSString *data in self.selDatas) {
            message = [NSString stringWithFormat:@"%@-%@-",message, data];
        }
    }
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"选中的 cell"
                                                                    message:message
                                                             preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *subAction = [UIAlertAction actionWithTitle:@"确定"
                                                        style:(UIAlertActionStyleCancel)
                                                      handler:nil];
    [alertC addAction:subAction];
    [self presentViewController:alertC animated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    NSString *data = self.datas[indexPath.row];
    cell.textLabel.text = data;
    
    // 如果当前 cell 的数据在选中数据中，改变样式
    if ([self.selDatas containsObject:data]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}
    

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *selCell = [tableView cellForRowAtIndexPath:indexPath];

    // 判断是否选中的 cell
    if (self.selDatas.count != 0) { //  有
        
        // 判断选中数据中是否包含当前的cell的数据
        if ([self.selDatas containsObject:self.datas[indexPath.row]]){ // 有
            
            // 删除当前数据
            [self.selDatas removeObject:self.datas[indexPath.row]];
            // 将 cell 样式改为未选择样式
            selCell.accessoryType = UITableViewCellAccessoryNone;
            
        }else{ // 没有
            
            // 将当前数据添加到选中数据中
            [self.selDatas addObject:self.datas[indexPath.row]];
            // cell样式改为选中样式
            selCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        
    }else{ // 没有
        
        // 添加
        [self.selDatas addObject:self.datas[indexPath.row]];
        // 改样式
        selCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}
@end
