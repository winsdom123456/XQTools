//
//  UIAlertView+Block.h
//  GXQTools
//
//  Created by Gong Xueqiang on 2017/10/12.
//  Copyright © 2017年 Gong Xueqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertViewButtonClickedBlock) (UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (Block)

@property (nonatomic, copy) UIAlertViewButtonClickedBlock clickedBlock;

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelButtonTitle
    otherButtonTitles:(NSArray *)otherButtonTitles
         clickedBlock:(UIAlertViewButtonClickedBlock)clickedBlock;

@end
