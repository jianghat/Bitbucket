//
//  MNWeakTimer.m
//  MNWeakTimer
//
//  Created by jianghat on 15/8/19.
//  Copyright (c) 2015年 jianghat. All rights reserved.
//

#import "MNWeakTimer.h"

@interface MNWeakTimer ()

@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation MNWeakTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo {
  MNWeakTimer *weakTimer = [[MNWeakTimer alloc] initWithTarget:aTarget selector:aSelector];
  weakTimer.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                     target:weakTimer
                                                   selector:@selector(fire:)
                                                   userInfo:userInfo
                                                    repeats:yesOrNo];
  return weakTimer.timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)yesOrNo block:(void (^)(void))block {
  MNWeakTimer *weakTimer = [[MNWeakTimer alloc] initWithTarget:nil selector:nil];
  weakTimer.timer = [NSTimer scheduledTimerWithTimeInterval:seconds
                                                     target:weakTimer
                                                   selector:@selector(timerBlockInvoke:)
                                                   userInfo:block
                                                    repeats:yesOrNo];
  return weakTimer.timer;
}

#pragma mark- Life cycle

- (instancetype)initWithTarget:(id)aTarget selector:(SEL)aSelector {
  self = [super init];
  if (self) {
    _target = aTarget;
    _selector = aSelector;
  }
  return self;
}

- (void)fire:(NSTimer *)timer {
  if(self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.target performSelector:self.selector withObject:timer.userInfo afterDelay:0.0f];
#pragma clang diagnostic pop
  }
  else {
    [self.timer invalidate];
  }
}

- (void)timerBlockInvoke:(NSTimer *)timer {
  if ([timer.userInfo isKindOfClass:NSClassFromString(@"NSBlock")]) {
    void (^block)(void) = timer.userInfo;
    block();
  }
}

- (void)dealloc {
  NSLog(@"MNWeakTimer dealloc");
}

@end
