//
//  SecondViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/21.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailsViewController.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *numTableview;
@property(nonatomic,strong) NSMutableArray *numTableviewData;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
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

-(void)loadData {
    _numTableviewData = [NSMutableArray array];
    for (int i = 0; i < 30; i++) {
        NSString *numStr = [NSString stringWithFormat:@"num_%d",i];
        [_numTableviewData addObject:numStr];
    }
}

-(void)_setupViews {
    self.title = @"secondView";
    
    _numTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_numTableview];
    _numTableview.delegate = self;
    _numTableview.dataSource = self;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _numTableviewData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *numTableviewCellIdentifier = @"numTableviewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:numTableviewCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:numTableviewCellIdentifier];
    }
    cell.textLabel.text = [_numTableviewData objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedCellStr = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    self.hidesBottomBarWhenPushed = YES;
    DetailsViewController *detailsVc = [[DetailsViewController alloc] init];
    detailsVc.labelStr = selectedCellStr;
    [self.navigationController pushViewController:detailsVc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
