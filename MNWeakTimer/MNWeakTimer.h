//
//  MNWeakTimer.h
//  MNWeakTimer
//
//  Created by jianghat on 15/8/19.
//  Copyright (c) 2015年 jianghat. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MNWeakTimerHandler)(id userInfo);

@interface MNWeakTimer : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)yesOrNo block:(void (^)(void))block;

@end
