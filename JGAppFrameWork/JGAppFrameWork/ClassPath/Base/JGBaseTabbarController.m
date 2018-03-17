//
//  JGBaseTabbarController.m
//  JGAppFrameWork
//
//  Created by 郭军 on 2018/3/15.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "JGBaseTabbarController.h"
#import "JGBaseNavigationController.h"
#import "JGBaseViewController.h"

@interface JGBaseTabbarController ()

@end

@implementation JGBaseTabbarController

-(void)createTabBar
{
    NSURL *plistUrl = [[NSBundle mainBundle] URLForResource:@"MainUI" withExtension:@"plist"];
    NSArray *sourceArray = [NSArray arrayWithContentsOfURL:plistUrl];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSDictionary *dic in sourceArray) {
        JGBaseViewController  *aVC = (JGBaseViewController *) [[NSClassFromString(dic[@"vcName"]) alloc]init];
        JGBaseNavigationController *nav=[[JGBaseNavigationController alloc]initWithRootViewController:aVC];
        UITabBarItem *tabItem=[[UITabBarItem alloc]initWithTitle:dic[@"title"] image:[[UIImage imageNamed:dic[@"icon"] ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:dic[@"selectIcon"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        aVC.title = dic[@"title"];
        nav.tabBarItem = tabItem;
        [viewControllers addObject:nav];
    }
    self.viewControllers = viewControllers;
    self.tabBar.tintColor = kTintColor;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
