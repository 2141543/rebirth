//
//  FirstViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/21.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailsViewController.h"

@interface FirstViewController ()

@property(nonatomic, strong) UIButton *goBtn;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _setupViews];
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

-(void)_setupViews {
    self.title = @"firstView";
    
    _goBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 80, 80, 80)];
    [_goBtn setTitle:@"gogogo" forState:UIControlStateNormal];
    [_goBtn addTarget:self action:@selector(clickActionOfGoBtn) forControlEvents:UIControlEventTouchUpInside];
    [_goBtn setBackgroundColor:[UIColor whiteColor]];
    [_goBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_goBtn];
}

- (void)clickActionOfGoBtn {
    self.hidesBottomBarWhenPushed = YES;
    DetailsViewController *detailsViewController = [[DetailsViewController alloc] init];
    detailsViewController.labelStr = _goBtn.titleLabel.text;
    [self.navigationController pushViewController:detailsViewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
