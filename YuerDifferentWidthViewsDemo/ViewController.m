//
//  ViewController.m
//  YuerDifferentWidthViewsDemo
//
//  Created by XiangTaiMini on 2017/5/23.
//  Copyright © 2017年 yuer. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "NSString+Size.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, nullable, strong) UITableView *tableView;
@property (nonatomic, nullable, strong) TableViewCell *cell;
@property (nonatomic, nullable, strong) NSArray *contents;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.cell.getCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    self.cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!self.cell) {
        self.cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    self.cell.contents = self.contents;
    return self.cell;
}

-(UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSArray *)contents {
    
    if (!_contents) {
        _contents = @[@"明细",@"办公用品",@"耗材",@"明细",@"办公用品",@"耗材",@"明细",@"办公用品",@"耗材",@"明细办公用品办公用品办公用品",@"办公用品",@"耗材"];
    }
    return _contents;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
