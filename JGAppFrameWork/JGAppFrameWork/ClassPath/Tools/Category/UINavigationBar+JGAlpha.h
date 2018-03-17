//
//  UINavigationBar+JGAlpha.h
//  JGAppFrameWork
//
//  Created by 郭军 on 2018/3/15.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (JGAlpha)

- (void)jg_setBackgroundColor:(UIColor *)backgroundColor isHiddenBottomBlackLine:(BOOL)isHiddenBottomBlackLine;
///获取UINavigationBar的颜色
- (UIColor *)jg_getBackgroundColor;

- (void)jg_setContentAlpha:(CGFloat)alpha;
- (void)jg_setTranslationY:(CGFloat)translationY;
- (void)jg_reset;

@end
