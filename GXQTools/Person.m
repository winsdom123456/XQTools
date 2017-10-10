//
//  Person.m
//  GXQTools
//
//  Created by Gong Xueqiang on 2017/9/13.
//  Copyright © 2017年 Gong Xueqiang. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (void)load {
    Method methodCount = class_getInstanceMethod([self class], @selector(read));
    Method methodMyCount = class_getInstanceMethod([self class], @selector(write));
    method_exchangeImplementations(methodCount, methodMyCount);
}

- (void)read {
    NSLog(@"write_____");
}

- (void)write {
    NSLog(@"read_____");
}

@end
