//
//  ThirdViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/23.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "ThirdViewController.h"
#import "TimerViewController.h"

@interface ThirdViewController ()

@property(nonatomic,strong) UITextField *nameTextfield;
@property(nonatomic,strong) UITextField *passwordTextfield;
@property(nonatomic,strong) UILabel *showLabel;
@property(nonatomic,strong) UIButton *findMoreBtn;

@end

@implementation ThirdViewController

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

- (void)_setupViews {    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, 30, 40)];
    nameLabel.text = @"账号:";
    nameLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:nameLabel];
    
    UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 80, 200, 40)];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:nameTextField];
    _nameTextfield = nameTextField;
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 130, 30, 40)];
    passwordLabel.text = @"密码:";
    passwordLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:passwordLabel];
    
    UITextField *passwordTextfield = [[UITextField alloc] initWithFrame:CGRectMake(90, 130, 200, 40)];
    passwordTextfield.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextfield.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:passwordTextfield];
    _passwordTextfield = passwordTextfield;
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setFrame:CGRectMake(110, 190, 100, 40)];
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitButton.backgroundColor = [UIColor grayColor];
    [submitButton addTarget:self action:@selector(submitBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
    
    UILabel *showLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 350, 290, 100)];
    showLabel.backgroundColor = [UIColor blackColor];
    showLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:showLabel];
    _showLabel = showLabel;
    
    UIButton *findMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [findMoreBtn setFrame:CGRectMake(200, 500, 100, 100)];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"FindMore"];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [findMoreBtn setAttributedTitle:title forState:UIControlStateNormal];
    findMoreBtn.hidden = YES;
    [findMoreBtn addTarget:self action:@selector(findMoreBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findMoreBtn];
    _findMoreBtn = findMoreBtn;
}

-(void)submitBtnAction {
    if (_nameTextfield.text.length > 0 && _passwordTextfield.text.length > 0) {
        NSString *showStr = [NSString stringWithFormat:@"%@ 先生/女式，欢迎登录！",_nameTextfield.text];
        _showLabel.text = showStr;
        _findMoreBtn.hidden = NO;
    }else {
        _findMoreBtn.hidden = YES;
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void)findMoreBtnAction {
    self.hidesBottomBarWhenPushed = YES;
    TimerViewController *timerVc = [[TimerViewController alloc] init];
    [self.navigationController pushViewController:timerVc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
