package ios_appdelegate;

import cpp.Lib;

import msignal.Signal;

class IOSAppDelegate 
{
	/// NATIVE ACCESS
	private var ios_appdelegate_initialize = Lib.load ("ios_appdelegate", "ios_appdelegate_initialize", 0);

    private var ios_appdelegate_set_memorywarningcallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_memorywarningcallback", 1);

    private var ios_appdelegate_set_willResignActiveCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_willResignActiveCallback", 1);
    private var ios_appdelegate_set_willEnterForegroundCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_willEnterForegroundCallback", 1);
    private var ios_appdelegate_set_willTerminateCallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_willTerminateCallback", 1);


	/// SIGNALS
	public var onMemoryWarning(default, null) : Signal0;
    public var onWillResignActive(default, null) : Signal0;
    public var onWillEnterForeground(default, null) : Signal0;
	public var onWillTerminate(default, null) : Signal0;

	/// INIT
	private function new() : Void {
		
		ios_appdelegate_initialize();

		onMemoryWarning = new Signal0();

        onWillResignActive = new Signal0();
        onWillEnterForeground = new Signal0();
        onWillTerminate = new Signal0();

		ios_appdelegate_set_memorywarningcallback(onMemoryWarning.dispatch);

        ios_appdelegate_set_willResignActiveCallback(onWillResignActive.dispatch);
        ios_appdelegate_set_willEnterForegroundCallback(onWillEnterForeground.dispatch);
        ios_appdelegate_set_willTerminateCallback(onWillTerminate.dispatch);
	}

	/// SINGLETON
	static var appDelegateInstance : IOSAppDelegate;
	static public inline function instance() : IOSAppDelegate
	{
		if(appDelegateInstance == null)
		{
			appDelegateInstance = new IOSAppDelegate();
		}
		return appDelegateInstance;
	}
}