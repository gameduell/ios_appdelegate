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

static value ios_appdelegate_set_screenIdleTimerDisabled (value disabled) {

    [[UIApplication sharedApplication] setIdleTimerDisabled:val_bool(disabled)];

	return alloc_null();
}
DEFINE_PRIM (ios_appdelegate_set_screenIdleTimerDisabled, 1);

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

static value ios_appdelegate_set_willEnterBackgroundCallback (value inCallback) {

    [responder setWillEnteBackgroundCallback:inCallback];
	return alloc_null();
}
DEFINE_PRIM (ios_appdelegate_set_willEnterBackgroundCallback, 1);


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
