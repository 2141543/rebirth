//
//  TimerViewController.m
//  tabbar_navagation_tabview_test
//
//  Created by Shi Jackie on 2018/8/23.
//  Copyright © 2018年 Shi Jackie. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property(nonatomic,strong) UILabel *timeShowLabel;
@property(nonatomic,strong) UIButton *startButton;

@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,assign) BOOL isTimerStop;
@property(nonatomic,assign) int mSeconds;
@property(nonatomic,assign) int seconds;
@property(nonatomic,assign) int minutes;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _setupViews];
    
    _isTimerStop = YES;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(_runTimer) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantFuture]];//设置触发时间为未来，即定时器进入等待触发的状态
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
    self.title = @"timer";
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *timeShowLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 180, 200, 80)];
    timeShowLabel.backgroundColor = [UIColor yellowColor];
    timeShowLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",_minutes,_seconds,_mSeconds];
    [self.view addSubview:timeShowLabel];
    _timeShowLabel = timeShowLabel;
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(85, 350, 50, 50)];
    startButton.backgroundColor = [UIColor whiteColor];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(_startTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    _startButton = startButton;
    
    UIButton *recodeButton = [[UIButton alloc] initWithFrame:CGRectMake(155, 350, 50, 50)];
    recodeButton.backgroundColor = [UIColor whiteColor];
    [recodeButton setTitle:@"计次" forState:UIControlStateNormal];
    [recodeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [recodeButton addTarget:self action:@selector(_recordTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:recodeButton];
    
    UIButton *restartButton = [[UIButton alloc] initWithFrame:CGRectMake(225, 350, 50, 50)];
    restartButton.backgroundColor = [UIColor whiteColor];
    [restartButton setTitle:@"复位" forState:UIControlStateNormal];
    [restartButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [restartButton addTarget:self action:@selector(_restartTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restartButton];
}

-(void)_runTimer {
    _mSeconds++;
    if (_mSeconds == 100) {
        _seconds++;
        _mSeconds = 0;
    }
    if (_seconds == 60) {
        _minutes++;
        _seconds = 0;
    }
    _timeShowLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",_minutes,_seconds,_mSeconds];
}

-(void)_startTimer {
    if (_isTimerStop) {
        [_timer setFireDate:[NSDate date]];
        [_startButton setTitle:@"停止" forState:UIControlStateNormal];
        _isTimerStop = NO;
    }else {
        [_timer setFireDate:[NSDate distantFuture]];
        _isTimerStop = YES;
        [_startButton setTitle:@"开始" forState:UIControlStateNormal];
    }
}

-(void)_recordTimer {
    if (_isTimerStop) {
        return;
    }
    static int count = 0;
    
    UILabel *countLabel = [[UILabel alloc] init];
    countLabel.frame = CGRectMake(85, count * 30 + 420, 100, 30);
    countLabel.text = [NSString stringWithFormat:@"计次 %d",++count];
    [self.view addSubview:countLabel];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.frame = CGRectMake(220, 420 + (count - 1) * 30, 100, 30);
    timeLabel.text = _timeShowLabel.text;
    [self.view addSubview:timeLabel];
}

-(void)_restartTimer {
    _mSeconds = 0;
    _seconds = 0;
    _minutes = 0;
    _timeShowLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",_minutes,_seconds,_mSeconds];
}

@end
