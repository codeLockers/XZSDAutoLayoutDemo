//
//  ViewController.m
//  XZSDAutoLayoutDemo
//
//  Created by 徐章 on 16/9/10.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZDemo0ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"SDAutoLayout";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 44.0f;
    self.titleArray = @[@"UITableViewCell根据UILabel内容自适应"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%@",(long)indexPath.row,self.titleArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            XZDemo0ViewController *demo0Vc = [[XZDemo0ViewController alloc] init];
            demo0Vc.navigationItem.title = @"Demo0";
            [self.navigationController pushViewController:demo0Vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
