//
//  XZDemo0ViewController.m
//  XZSDAutoLayoutDemo
//
//  Created by 徐章 on 16/9/10.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZDemo0ViewController.h"
#import "XZDemo0Cell.h"
#import <SDAutoLayout/SDAutoLayout.h>

@implementation XZDemo0Model



@end


@interface XZDemo0ViewController ()<UITableViewDataSource,UITableViewDelegate>{

    NSArray *_textArray;
    NSMutableArray *_modelArray;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XZDemo0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    _textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
                           ];

    
    _modelArray = [NSMutableArray array];
    
    for (NSString *string in _textArray) {
        
        XZDemo0Model *model = [[XZDemo0Model alloc] init];
        model.name = string;
        [_modelArray addObject:model];
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _modelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

   return [self.tableView cellHeightForIndexPath:indexPath model:_modelArray[indexPath.row] keyPath:@"model" cellClass:[XZDemo0Cell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    XZDemo0Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([XZDemo0Cell class])];
    if (!cell) {
        
        cell = [[XZDemo0Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([XZDemo0Cell class])];
    }
    
    cell.model = _modelArray[indexPath.row];

    return cell;
}


@end
