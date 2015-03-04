#import "AppDelegateResponder.h"

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
    /// Did receive memory warning
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(memoryWarning:)
                                                 name:UIApplicationDidReceiveMemoryWarningNotification 
                                               object:nil];

    /// Will Enter Background
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];


    /// Will Enter Foreground
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];

    /// Will Terminate Application
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willTerminate:)
                                                 name:UIApplicationWillTerminateNotification
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

- (void) willResignActive:(NSNotification *)notification
{
    val_call0(_willResignActiveCallback->get());
}


/// Will Enter Foreground
- (void) setWillEnterForegroundCallback:(value)callback
{
    _willEnterForegroundCallback = new AutoGCRoot(callback);
}

- (void) willEnterForeground:(NSNotification *)notification
{
    val_call0(_willEnterForegroundCallback->get());
}


/// Will Terminate Application
- (void) setWillTerminateCallback:(value)callback
{
    _willTerminateCallback = new AutoGCRoot(callback);
}

- (void) willTerminate:(NSNotification *)notification
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
