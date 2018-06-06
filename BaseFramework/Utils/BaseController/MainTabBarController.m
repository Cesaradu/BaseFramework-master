//
//  MainTabBarController.m
//  BaseFramework
//
//  Created by hztuen on 17/3/2.
//  Copyright © 2017年 Cesar. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabBar];
}

- (void)createTabBar {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    
    NSMutableArray *controllerArray = [NSMutableArray arrayWithObjects:homeVC, mineVC, nil];
    
    NSArray *normalImageArray = @[@"home_icon_normal", @"mine_icon_normal"];
    NSArray *selectedImageArray = @[@"home_icon_selected", @"mine_icon_selected"];
    NSArray *titleArray = @[@"首页", @"我的"];
    
    for (int  i = 0; i < controllerArray.count; i++)
    {
        // 分别找到每个视图控制器
        UIViewController *vc        = controllerArray[i];
        // 添加标题
        vc.title                    = titleArray[i];
        // 转化成导航控制器
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        // 将数组array中的视图控制器替换成导航控制器
        [controllerArray replaceObjectAtIndex:i withObject:navi];
        
        // 渲染模式
        UIImage *normalImage = [UIImage imageNamed:normalImageArray[i]];
        UIImage *selectImage = [UIImage imageNamed:selectedImageArray[i]];
        
        navi.tabBarItem.image         = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navi.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //tabbar文字字体颜色
        [navi.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:45/255.0 green:158/255.0 blue:47/255.0 alpha:1]} forState:UIControlStateSelected];
        
    }
    self.viewControllers = controllerArray;
    
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
