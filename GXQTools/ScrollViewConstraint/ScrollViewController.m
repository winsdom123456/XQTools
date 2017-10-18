//
//  ScrollViewController.m
//  GXQTools
//
//  Created by Gong Xueqiang on 2017/10/16.
//  Copyright © 2017年 Gong Xueqiang. All rights reserved.
//

#import "ScrollViewController.h"
#import "Masonry.h"

@interface ScrollViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view addSubview:self.scrollView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSameWidthView];
}

- (void)addSameWidthView {
    UIView *view1 = [UIView new];
    UIView *view2 = [UIView new];
    UIView *view3 = [UIView new];
    view1.backgroundColor = [UIColor blueColor];
    view2.backgroundColor = [UIColor blueColor];
    view3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(400);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view1.mas_right).offset(10);
        make.width.mas_equalTo(view1.mas_width);
        make.height.mas_equalTo(400);
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view2.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(view1.mas_width);
        make.height.mas_equalTo(400);
    }];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _scrollView.backgroundColor = [UIColor blueColor];
    }
    return _scrollView;
}

@end
