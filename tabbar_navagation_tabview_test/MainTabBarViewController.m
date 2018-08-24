//
//  MainTabBarViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/21.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "UpTabbarViewController.h"
#import "DTScrollStatusHeader.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    UINavigationController *firstNc = [[UINavigationController alloc] initWithRootViewController:firstVc];
    firstNc.navigationBar.translucent = NO;
    firstNc.navigationBar.tintColor = [UIColor whiteColor];
    firstNc.navigationBar.barTintColor = DTColor(10, 193, 147, 1);
    UITabBarItem *firstTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    firstNc.tabBarItem = firstTabBarItem;
    
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    UINavigationController *secondNc = [[UINavigationController alloc] initWithRootViewController:secondVc];
    secondVc.view.backgroundColor = [UIColor purpleColor];
    UITabBarItem *secondTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    secondNc.tabBarItem = secondTabBarItem;
    
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    UINavigationController *thirdNc = [[UINavigationController alloc] initWithRootViewController:thirdVc];
    thirdNc.view.backgroundColor = [UIColor whiteColor];
    UITabBarItem *thirdTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:2];
    thirdNc.tabBarItem = thirdTabBarItem;
    
    self.viewControllers = @[firstNc,secondNc,thirdNc];
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
