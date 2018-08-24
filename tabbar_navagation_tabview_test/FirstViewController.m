//
//  FirstViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/21.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailsViewController.h"
#import "UpTabbarViewController.h"

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
    [_goBtn setBackgroundColor:[UIColor purpleColor]];
    [_goBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_goBtn];
    
    UILabel *upTabbarlabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 180, 160, 60)];
    NSString *upTabbarlabelStr = @"Go To Find UpTabbar";
    upTabbarlabel.textColor = [UIColor blueColor];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};// 下划线
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:upTabbarlabelStr attributes:attribtDic];
    upTabbarlabel.attributedText = attribtStr;
    UITapGestureRecognizer *upTabbarLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(upTabbarlabelTapAction:)];
    upTabbarlabel.userInteractionEnabled = YES;
    [upTabbarlabel addGestureRecognizer:upTabbarLabelTap];
    [self.view addSubview:upTabbarlabel];
}

- (void)clickActionOfGoBtn {
    self.hidesBottomBarWhenPushed = YES;
    DetailsViewController *detailsViewController = [[DetailsViewController alloc] init];
    detailsViewController.labelStr = _goBtn.titleLabel.text;
    [self.navigationController pushViewController:detailsViewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

-(void)upTabbarlabelTapAction:(UITapGestureRecognizer *)tap {
    self.hidesBottomBarWhenPushed = YES;
    UpTabbarViewController *upTabbarVc = [[UpTabbarViewController alloc] init];
    [self.navigationController pushViewController:upTabbarVc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
