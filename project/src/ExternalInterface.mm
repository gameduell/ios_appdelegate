#include <hx/CFFI.h>
#include "AppDelegateResponder.h"


static AppDelegateResponder *responder;


static value ios_appdelegate_initialize () {

    if(!responder)
    {
        responder = [[AppDelegateResponder alloc] init];

        [responder initialize];
    }

	return alloc_int(0);
	
}
DEFINE_PRIM (ios_appdelegate_initialize, 0);


/// CALLBACK SETTERS
static value ios_appdelegate_set_memorywarningcallback (value inCallback) {
	
    [responder setMemoryWarningCallback:inCallback];
	return alloc_int(0);
	
}
DEFINE_PRIM (ios_appdelegate_set_memorywarningcallback, 1);









/// OTHER
extern "C" void ios_appdelegate_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (ios_appdelegate_main);



extern "C" int ios_appdelegate_register_prims () { return 0; }