//
//  RadioViewController.m
//  LCSelectTableViewDemo
//
//  Created by LiCheng on 2016/12/30.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "RadioViewController.h"

@interface RadioViewController ()

/** 当前选中行 */
@property (nonatomic, strong)  NSIndexPath *currentSelIndexPath;


@end

@implementation RadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    if (self.currentSelIndexPath) { // 有选择
        
        UITableViewCell *selCell = [self.tableView cellForRowAtIndexPath:self.currentSelIndexPath];
        message = selCell.textLabel.text;
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
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row+1];
    
    // 判断 当前cell 是否是 选中的cell
    if (self.currentSelIndexPath == indexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (self.currentSelIndexPath) { // 有选中的cell, 修改上一个cell的样式
        // 上一次选中的 cell
        UITableViewCell *lastSelCell = [tableView cellForRowAtIndexPath:self.currentSelIndexPath];
        lastSelCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // 当前的 cell
    UITableViewCell *currentSelCell = [tableView cellForRowAtIndexPath:indexPath];
    currentSelCell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.currentSelIndexPath = indexPath;
}
@end
