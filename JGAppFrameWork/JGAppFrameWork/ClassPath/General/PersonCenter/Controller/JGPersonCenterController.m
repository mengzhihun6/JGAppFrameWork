//
//  JGPersonCenterController.m
//  JGAppFrameWork
//
//  Created by 郭军 on 2018/3/15.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "JGPersonCenterController.h"
#import "JGSetViewController.h"
#import "JGMessageViewController.h"

@interface JGPersonCenterController ()

@end

@implementation JGPersonCenterController

-(BOOL)gestureRecognizerShouldBegin{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar jg_setBackgroundColor:[UIColor greenColor] isHiddenBottomBlackLine:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jg_reset];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"setting" highIcon:nil target:self action:@selector(setItemDidAction:)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"message" highIcon:nil target:self action:@selector(messageItemDidAction:)];
}

-(void)setItemDidAction:(UIBarButtonItem *)sender{
    JGSetViewController *setVC = [JGSetViewController new];
    setVC.isHideBackItem = NO;
    [self.navigationController pushViewController:setVC animated:YES];
}

-(void)messageItemDidAction:(UIBarButtonItem *)sender{
    [self.navigationController pushViewController:[JGMessageViewController new] animated:YES];
    //    [self presentViewController:[MessageViewController new] animated:YES completion:^{
    //
    //    }];
    
}
@end
