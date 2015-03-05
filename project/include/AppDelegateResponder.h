/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>

@interface AppDelegateResponder : NSObject

- (void) initialize;
- (void) setMemoryWarningCallback:(value)callback;

- (void) setWillResignActiveCallback:(value)callback;
- (void) setWillEnterForegroundCallback:(value)callback;
- (void) setWillTerminateCallback:(value)callback;

@end