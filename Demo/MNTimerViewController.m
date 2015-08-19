//
//  MNTimerViewController.m
//  MNWeakTimer
//
//  Created by jianghat on 15/8/19.
//  Copyright (c) 2015年 jianghat. All rights reserved.
//

#import "MNTimerViewController.h"
#import "MNWeakTimer.h"

@interface MNTimerViewController ()

@end

@implementation MNTimerViewController {
  NSTimer *_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  _timer = [MNWeakTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^{
    NSLog(@"timerStart");
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  if ([_timer isValid]) {
    [_timer invalidate];
  }
}

@end
