//
//  ViewController.m
//  MNWeakTimer
//
//  Created by jianghat on 15/8/19.
//  Copyright (c) 2015年 jianghat. All rights reserved.
//

#import "MNTimerViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:@"下一步" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button setFrame:CGRectMake(20, 100, 300, 44)];
  [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (void)buttonAction:(id)sender {
  MNTimerViewController *vc = [[MNTimerViewController alloc] init];
  [self.navigationController pushViewController:vc animated:YES];
}

@end
