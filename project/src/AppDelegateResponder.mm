#import "AppDelegateResponder.h"

@interface AppDelegateResponder ()
{
    AutoGCRoot *_memoryWarningCallback;
}

@end

@implementation AppDelegateResponder

- (void) initialize
{
    /// memory warning
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(memoryWarning:)
                                                 name:UIApplicationDidReceiveMemoryWarningNotification 
                                               object:nil];

}

- (void) setMemoryWarningCallback:(value)callback
{
    _memoryWarningCallback = new AutoGCRoot(callback);
}

- (void) memoryWarning:(NSNotification *)notification
{
    val_call0(_memoryWarningCallback->get());
}

- (void) dealloc
{
    delete _memoryWarningCallback;

    [super dealloc];
}

@end
