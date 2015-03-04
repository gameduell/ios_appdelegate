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