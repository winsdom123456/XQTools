//
//  ViewController.m
//  GXQTools
//
//  Created by Gong Xueqiang on 2017/8/26.
//  Copyright © 2017年 Gong Xueqiang. All rights reserved.
//

// This is the first Git Project
#import "ViewController.h"
#import "Person.h"
#import "UIAlertView+Block.h"
#import "ScrollViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic ,strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromClass([super class]));
    [self.view addSubview:self.tableView];
    self.dataArray = @[@"Label", @"AlertView", @"ScrollView"];
//    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(flashAction)];
//    link.frameInterval = 50;
//    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
//    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(_timer, ^{
//        NSLog(@"GCD-----%@",[NSThread currentThread]);
//    });
//    dispatch_resume(_timer);
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(flashAction) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    Person *person = [[Person alloc] init];
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    object_getClassName(person);
    [person class];
}

- (void)flashAction {
    NSLog(@"Call Timer ____");
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        [UIAlertView showWithTitle:@"Test" message:@"AlertView Block" cancelButtonTitle:@"OK" otherButtonTitles:@[@"OtherButton"] clickedBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            NSLog(@"Success");
        }];
    } else if (indexPath.row == 2) {
        ScrollViewController *controller = [[ScrollViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

@end
