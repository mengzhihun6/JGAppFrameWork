//
//  JGUserGuideController.m
//  JGAppFrameWork
//
//  Created by 郭军 on 2018/3/15.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "JGUserGuideController.h"
#import "JGBaseTabbarController.h"

@interface JGUserGuideController () {
    UIScrollView *_scrollView;
}

@end

@implementation JGUserGuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGuideView];
    
}
- (void)initGuideView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_scrollView];
    
    NSArray *iPhone4Array = @[@"guidePage1@2x", @"guidePage2@2x", @"guidePage3@2x"];
    NSArray *iPhone5Array = @[@"guidePage1-568h", @"guidePage2-568h", @"guidePage3-568h"];
    
    _scrollView.contentSize = CGSizeMake(kScreenWidth*iPhone5Array.count, 0);
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton addTarget:self action:@selector(showMainUI:) forControlEvents:UIControlEventTouchUpInside];
    aButton.frame = CGRectMake((iPhone5Array.count-1)*kScreenWidth, 0, kScreenWidth, kScreenHeight);
    
    if (IS_IPHONE4){
        for (NSUInteger i = 0; i<iPhone4Array.count; i++){
            UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight)];
            iv.image = [UIImage imageNamed:iPhone4Array[i]];
            [_scrollView addSubview:iv];
        }
    }else {
        for (NSUInteger i = 0; i<iPhone5Array.count; i++) {
            UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight)];
            iv.image = [UIImage imageNamed:iPhone5Array[i]];
            [_scrollView addSubview:iv];
        }
    }
    
    aButton.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:aButton];
    [_scrollView bringSubviewToFront:aButton];
    
}
- (void)showMainUI:(UIButton *)sender
{
    [AppDelegate shareAppDelegate].rootTabbar = [[JGBaseTabbarController alloc]init];
    [self presentViewController:[AppDelegate shareAppDelegate].rootTabbar animated:YES completion:^{
        //        [AppDelegate shareAppDelegate].rootTabbar.viewControllers[2].tabBarItem.badgeValue = @"3";
        
    }];
    
}
-(void)dealloc{
    NSLog(@"HHHH");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
