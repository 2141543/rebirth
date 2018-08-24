//
//  UpTabbarViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/23.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "UpTabbarViewController.h"
#import "DTScrollStatusView.h"

@interface UpTabbarViewController ()<DTScrollStatusDelegate>

@property(nonatomic,strong) DTScrollStatusView *scrollView;

@end

@implementation UpTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _setupViews];
}

-(void)_setupViews {
    self.title = @"upTabbar";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _scrollView = [[DTScrollStatusView alloc] initWithTitleArr:@[@"1",@"2",@"3"] type:ScrollTapTypeWithNavigation];
    _scrollView.scrollStatusDelegate = self;
    [self.view addSubview:_scrollView];
}

#pragma mark - RBScrollStatusDelegate
- (void)refreshViewWithTag:(NSInteger)tag
                  isHeader:(BOOL)isHeader {
    if(isHeader)
    {
        NSLog(@"当前%ld个tableview 的头部正在刷新",tag);
    }
    else
    {
        NSLog(@"当前%ld个tableview 的尾部正在刷新",tag);
    }
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 0) {
        return 1;
    }else {
        return 2;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    if (tableView.tag == 0) {
        cell.textLabel.text = @"11111111111";
    }else if (tableView.tag == 1) {
        cell.textLabel.text = @"22222222222";
    }else if (tableView.tag == 2) {
        cell.textLabel.text = @"33333333333";
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
