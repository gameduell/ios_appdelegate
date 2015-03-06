/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
#import "AppDelegateResponder.h"

#import "DUELLAppDelegate.h"

@interface AppDelegateResponder ()
{
    AutoGCRoot *_memoryWarningCallback;

    AutoGCRoot *_willResignActiveCallback;
    AutoGCRoot *_willEnterForegroundCallback;
    AutoGCRoot *_willTerminateCallback;
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
