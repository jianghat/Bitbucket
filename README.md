# MNWeakTimer

NSTimer alternative that doesn't retain the target.

苹果开发文档原文介绍如下：
You use the NSTimer class to create timer objects or, more simply, timers. A timer waits until a certain time interval has elapsed and then fires, sending a specified message to a target object. For example, you could create an NSTimer object that sends a message to a window, telling it to update itself after a certain time interval.

Timers work in conjunction with run loops. To use a timer effectively, you should be aware of how run loops operate—see NSRunLoop and Threading Programming Guide. Note in particular that run loops maintain strong references to their timers, so you don’t have to maintain your own strong reference to a timer after you have added it to a run loop.
