//
//  JGBaseViewController.m
//  JGAppFrameWork
//
//  Created by 郭军 on 2018/3/15.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "JGBaseViewController.h"

@interface JGBaseViewController ()

@end

@implementation JGBaseViewController

///右滑返回功能，默认开启（YES）
- (BOOL)gestureRecognizerShouldBegin{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)])
    {
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
}


- (void)showHUDToViewMessage:(NSString *)msg{
    if (!self.hud) {
        self.hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.dimBackground = YES;
        if (msg==nil||[msg isEqualToString:@""]) {
            
        }else{
            self.hud.labelText= msg;
        }
    }
}
- (void)showHUDToWindowMessage:(NSString *)msg{
    if (!self.hud) {
        self.hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        self.hud.dimBackground = YES;
        if (msg==nil||[msg isEqualToString:@""]) {
            
        }else{
            self.hud.labelText= msg;
        }
    }
}

- (void)removeHUD{
    if (self.hud) {
        [self.hud removeFromSuperview];
        self.hud=nil;
    }
}

-(NSString *)backItemImageName{
    return @"navigator_btn_back";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

@end
