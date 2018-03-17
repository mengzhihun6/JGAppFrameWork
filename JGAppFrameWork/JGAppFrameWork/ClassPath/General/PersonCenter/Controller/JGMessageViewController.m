//
//  JGMessageViewController.m
//  JGAppFrameWork
//
//  Created by 郭军 on 2018/3/15.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "JGMessageViewController.h"
#import "JGBaseWebViewController.h"


@interface JGMessageViewController () <UITableViewDelegate,UITableViewDataSource>{
    NSString *applicantId;
}
@property(nonatomic,strong)UITableView *messageTableView;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation JGMessageViewController

-(NSString *)backItemImageName{
    return @"back_gold";
}
/**
 懒加载数据源dataSource
 
 @return dataSource
 */
-(NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return  _dataSource;
}
/**
 懒加载tableView
 
 @return myGroupTableView
 */
-(UITableView *)messageTableView{
    if (_messageTableView==nil) {
        _messageTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavbarHeight, kScreenWidth, kScreenHeight-kNavbarHeight) style:UITableViewStylePlain];
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_messageTableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:@"UITableViewCell"];
        _messageTableView.rowHeight = 50;
    }
    return _messageTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的消息";
    for (NSUInteger index = 0; index<20; index++) {
        [self.dataSource addObject:@(index)];
    }
    [self.view addSubview:self.messageTableView];
}

//支不支持删除
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//滑动删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return@"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self.dataSource removeObjectAtIndex:indexPath.row];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationBottom];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =  (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataSource[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    return;
//    LoginViewController *loginVC =[LoginViewController new];
//    BaseNavigationController *baseNav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
//    [self presentViewController:baseNav animated:YES completion:nil];
}


- (void)dealloc
{
    JGLog(@"%s dealloc",object_getClassName(self));
}


@end
