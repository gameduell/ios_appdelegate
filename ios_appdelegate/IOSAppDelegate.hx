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

package ios_appdelegate;

import cpp.Lib;

import msignal.Signal;

class IOSAppDelegate
{
    public var onWillEnterBackground(default, null): Signal0;
    /**
      * Dispatched when the app receives a warning from the operating system about low memory availability.
    **/
    public var onMemoryWarning(default, null): Signal0;

    /**
      * Dispatched when the app is no longer active and loses focus.
      *
      * An app is active when it is receiving events. An active app can be said to have focus.
      * It gains focus after being launched, loses focus when an overlay window pops up or when the device is locked,
      * and gains focus when the device is unlocked.
    **/
    public var onWillResignActive(default, null): Signal0;

    /**
      * Dispatched shortly before an app leaves the background state on its way to becoming the active app.
    **/
    public var onWillEnterForeground(default, null): Signal0;

    /**
      * Dispatched when the app is about to terminate. It is not called if your app is suspended.
    **/
    public var onWillTerminate(default, null): Signal0;

    /**
      * Screen dimming enabling
    **/
    public var screenIdleTimerDisabled(default, set): Bool;

    /**
       @return User setting of remote (push) notifications
    */
    public var remoteNotificationsEnabled(get, never): Bool;

    /**
      * If the app was opened due to a remote notification, this property stores the payload in json format.
      * The field is null if the app was opened normally.
      * https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/TheNotificationPayload.html
    */
    public var lastRemoteNotificationPayload(default, null): String = null;

    /**
      * Dispatched when the app received a remote notification.
      * The payload property stores the last notification payload.
      * This signal could dispatch in background. You should not trigger heavy duty tasks on this.
    **/
    public var onReceivedRemoteNotification(default, null): Signal0;

    /**
      * If the app was opened from another app, this property stores the url used to open this app.
      * The field is null if the app was opened normally.
      *
      * https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Inter-AppCommunication/Inter-AppCommunication.html#//apple_ref/doc/uid/TP40007072-CH6-SW10
    */
    public var lastURLFromApplicationOpening(default, null): String = null;

    /**
      * Dispatched when the app is opened from another app.
    **/
    public var onApplicationDidOpenWithURL(default, null): Signal0;


    static private var appDelegateInstance: IOSAppDelegate;

	private static var ios_appdelegate_initialize = Lib.load ("ios_appdelegate", "ios_appdelegate_initialize", 0);
    private static var ios_appdelegate_set_screenIdleTimerDisabled = Lib.load ("ios_appdelegate", "ios_appdelegate_set_screenIdleTimerDisabled", 1);
    private static var ios_appdelegate_set_memorywarningcallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_memorywarningcallback", 1);
    private static var ios_appdelegate_set_willResignActiveCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_willResignActiveCallback", 1);
    private static var ios_appdelegate_set_willEnterForegroundCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_willEnterForegroundCallback", 1);
    private static var ios_appdelegate_set_willTerminateCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_willTerminateCallback", 1);
    private static var ios_appdelegate_set_willEnterBackgroundCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_willEnterBackgroundCallback", 1);
    private static var ios_appdelegate_set_remoteNotificationCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_remoteNotificationCallback", 1);
    private static var ios_appdelegate_set_applicationDidOpenWithURLCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_applicationDidOpenWithURLCallback", 1);
    private static var ios_appdelegate_openUrl = Lib.load ("ios_appdelegate", "ios_appdelegate_openUrl", 1);
    private static var ios_appdelegate_get_remoteNotificationsEnabled = Lib.load ("ios_appdelegate", "ios_appdelegate_get_remoteNotificationsEnabled", 0);

	private function new(): Void
    {
        onMemoryWarning = new Signal0();
        onWillResignActive = new Signal0();
        onWillEnterForeground = new Signal0();
        onWillTerminate = new Signal0();
        onWillEnterBackground = new Signal0();
        onReceivedRemoteNotification = new Signal0();
        onApplicationDidOpenWithURL = new Signal0();
        screenIdleTimerDisabled = false;
        lastRemoteNotificationPayload = null;
        lastURLFromApplicationOpening = null;

		ios_appdelegate_initialize();

		ios_appdelegate_set_memorywarningcallback(onMemoryWarning.dispatch);
        ios_appdelegate_set_willResignActiveCallback(onWillResignActive.dispatch);
        ios_appdelegate_set_willEnterForegroundCallback(onWillEnterForeground.dispatch);
        ios_appdelegate_set_willTerminateCallback(onWillTerminate.dispatch);
        ios_appdelegate_set_willEnterBackgroundCallback(onWillEnterBackground.dispatch);
        ios_appdelegate_set_remoteNotificationCallback(assign_remoteNotificationPayload);
        ios_appdelegate_set_applicationDidOpenWithURLCallback(assign_applicationOpeningURL);
    }
    //
    // native calls
    //
    public function openURL(url:String): Bool
    {
        return ios_appdelegate_openUrl(url);
    }

    private function set_screenIdleTimerDisabled(disabled: Bool): Bool
    {
        ios_appdelegate_set_screenIdleTimerDisabled(disabled);
        screenIdleTimerDisabled = disabled;
        return disabled;
    }

    private function get_remoteNotificationsEnabled(): Bool
    {
        return ios_appdelegate_get_remoteNotificationsEnabled();
    }

    private function assign_remoteNotificationPayload(payload: String): Void
    {
        lastRemoteNotificationPayload = payload;
        onReceivedRemoteNotification.dispatch();
    }

    private function assign_applicationOpeningURL(url: String): Void
    {
        lastURLFromApplicationOpening = url;
        onApplicationDidOpenWithURL.dispatch();
    }

	static public inline function instance(): IOSAppDelegate
	{
		if(appDelegateInstance == null)
		{
			appDelegateInstance = new IOSAppDelegate();
		}
		return appDelegateInstance;
	}

}
