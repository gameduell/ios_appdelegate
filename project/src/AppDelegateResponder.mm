/*
 * Copyright (c) 2003-2015, GameDuell GmbH
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "AppDelegateResponder.h"

#import "DUELLAppDelegate.h"

@interface AppDelegateResponder ()
{
    AutoGCRoot *_memoryWarningCallback;

    AutoGCRoot *_willResignActiveCallback;
    AutoGCRoot *_willEnterForegroundCallback;
    AutoGCRoot *_willTerminateCallback;
    AutoGCRoot *_willEnterBackgroundCallback;
}

@end

@implementation AppDelegateResponder

- (void) initialize
{
    DUELLAppDelegate *appDelegate = (DUELLAppDelegate *)[[UIApplication sharedApplication] delegate];

    [appDelegate addDuellDelegate:self];

    /// Did receive memory warning
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(memoryWarning:)
                                                 name:UIApplicationDidReceiveMemoryWarningNotification
                                               object:nil];
}

/// Memory Warning
- (void) setMemoryWarningCallback:(value)callback
{
    _memoryWarningCallback = new AutoGCRoot(callback);
}

- (void) memoryWarning:(NSNotification *)notification
{
    val_call0(_memoryWarningCallback->get());
}


/// Will Enter Background
- (void) setWillResignActiveCallback:(value)callback
{
    _willResignActiveCallback = new AutoGCRoot(callback);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    val_call0(_willResignActiveCallback->get());
}


/// Will Enter Foreground
- (void) setWillEnterForegroundCallback:(value)callback
{
    _willEnterForegroundCallback = new AutoGCRoot(callback);
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    val_call0(_willEnterForegroundCallback->get());
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    val_call0(_willEnterBackgroundCallback->get());
}

/// Will Terminate Application
- (void) setWillEnterBackgroundCallback:(value)callback
{
    _willEnterBackgroundCallback = new AutoGCRoot(callback);
}

/// Will Terminate Application
- (void) setWillTerminateCallback:(value)callback
{
    _willTerminateCallback = new AutoGCRoot(callback);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    val_call0(_willTerminateCallback->get());
}


- (void) dealloc
{
    delete _memoryWarningCallback;

    delete _willResignActiveCallback;
    delete _willEnterForegroundCallback;
    delete _willTerminateCallback;

    [super dealloc];
}

@end
