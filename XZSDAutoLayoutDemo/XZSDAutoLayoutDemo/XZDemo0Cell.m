//
//  XZDemo0Cell.m
//  XZSDAutoLayoutDemo
//
//  Created by 徐章 on 16/9/10.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZDemo0Cell.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface XZDemo0Cell()



@end

@implementation XZDemo0Cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    
    self.contentLab = [[UILabel alloc] init];
    self.contentLab.backgroundColor = [UIColor yellowColor];
    
    [self.contentView sd_addSubviews:@[view1,self.contentLab]];
    
    view1.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .widthIs(50)
    .heightIs(50);
    
    self.contentLab.sd_layout
    .topEqualToView(view1)
    .leftSpaceToView(view1,10)
    .rightSpaceToView(self.contentView,10)
    .autoHeightRatio(0);

    [self setupAutoHeightWithBottomViewsArray:@[view1,self.contentLab] bottomMargin:10];
}

- (void)setModel:(XZDemo0Model *)model{

    _model = model;
    self.contentLab.text = model.name;
}
//
@end
