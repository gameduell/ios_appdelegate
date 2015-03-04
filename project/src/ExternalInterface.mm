#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>
#include "AppDelegateResponder.h"


static AppDelegateResponder *responder;


static value ios_appdelegate_initialize () {

    if(!responder)
    {
        responder = [[AppDelegateResponder alloc] init];

        [responder initialize];
    }

	return alloc_null();
	
}
DEFINE_PRIM (ios_appdelegate_initialize, 0);


/// CALLBACK SETTERS
static value ios_appdelegate_set_memorywarningcallback (value inCallback) {
	
    [responder setMemoryWarningCallback:inCallback];
	return alloc_null();
	
}
DEFINE_PRIM (ios_appdelegate_set_memorywarningcallback, 1);


static value ios_appdelegate_set_willResignActiveCallback (value inCallback) {

    [responder setWillResignActiveCallback:inCallback];
	return alloc_null();

}
DEFINE_PRIM (ios_appdelegate_set_willResignActiveCallback, 1);


static value ios_appdelegate_set_willEnterForegroundCallback (value inCallback) {

    [responder setWillEnterForegroundCallback:inCallback];
	return alloc_null();

}
DEFINE_PRIM (ios_appdelegate_set_willEnterForegroundCallback, 1);


static value ios_appdelegate_set_willTerminateCallback (value inCallback) {

    [responder setWillTerminateCallback:inCallback];
	return alloc_null();

}
DEFINE_PRIM (ios_appdelegate_set_willTerminateCallback, 1);


/// OTHER
extern "C" void ios_appdelegate_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (ios_appdelegate_main);



extern "C" int ios_appdelegate_register_prims () { return 0; }