//
//  JGRecommandController.m
//  JGAppFrameWork
//
//  Created by 郭军 on 2018/3/15.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "JGRecommandController.h"
#import "JGSetViewController.h"

@interface JGRecommandController ()

@end

@implementation JGRecommandController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-2*10, 100)];
    testLabel.text = @"点击我测试-->（带导航push  不带导航的页面，手势返回bug）";
    testLabel.backgroundColor = [UIColor magentaColor];
    testLabel.numberOfLines = 0;
    testLabel.center = self.view.center;
    testLabel.userInteractionEnabled = YES;
    [self.view addSubview:testLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    JGSetViewController *setVC = [JGSetViewController new];
    setVC.isHideBackItem = NO;
    [self.navigationController pushViewController:setVC animated:YES];
    
}

@end
