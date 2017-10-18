//
//  UIAlertView+Block.m
//  GXQTools
//
//  Created by Gong Xueqiang on 2017/10/12.
//  Copyright © 2017年 Gong Xueqiang. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

static const void *UIAlertViewClickedBlockKey = &UIAlertViewClickedBlockKey;

@implementation UIAlertView (Block)

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelButtonTitle
    otherButtonTitles:(NSArray *)otherButtonTitles
             clickedBlock:(UIAlertViewButtonClickedBlock)clickedBlock {
    
    UIAlertView *alertView = [[self alloc] initWithTitle:title
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:cancelButtonTitle
                                       otherButtonTitles:nil];
    for (NSString *buttonTitle in otherButtonTitles) {
        [alertView addButtonWithTitle:buttonTitle];
    }
    alertView.clickedBlock = clickedBlock;
    [alertView show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.clickedBlock) {
        alertView.clickedBlock(alertView, buttonIndex);
    }
}

- (UIAlertViewButtonClickedBlock)clickedBlock {
    return objc_getAssociatedObject(self, UIAlertViewClickedBlockKey);
}

- (void)setClickedBlock:(UIAlertViewButtonClickedBlock)clickedBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertViewClickedBlockKey, clickedBlock, OBJC_ASSOCIATION_COPY);
}

@end
