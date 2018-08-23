//
//  DetailsViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/21.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property(nonatomic, strong) UILabel *label1;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _setupView];
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

-(void)_setupView {
    self.title = @"detailsView";
    self.view.backgroundColor = [UIColor yellowColor];
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(180, 180, 80, 80)];
    _label1.backgroundColor = [UIColor blueColor];
    _label1.text = self.labelStr;
    [self.view addSubview:_label1];
}

@end
