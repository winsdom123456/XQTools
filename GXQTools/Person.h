//
//  Person.h
//  GXQTools
//
//  Created by Gong Xueqiang on 2017/9/13.
//  Copyright © 2017年 Gong Xueqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gender;

- (void)read;
- (void)write;
@end
