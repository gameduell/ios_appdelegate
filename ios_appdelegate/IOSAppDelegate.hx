package ios_appdelegate;

import cpp.Lib;

import msignal.Signal;

class IOSAppDelegate 
{
	/// NATIVE ACCESS
	private var ios_appdelegate_initialize = Lib.load ("ios_appdelegate", "ios_appdelegate_initialize", 0);
	private var ios_appdelegate_set_memorywarningcallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_memorywarningcallback", 1);

	/// SIGNALS
	public var onMemoryWarning(default, null) : Signal0;
	
	/// INIT
	private function new() : Void {
		
		ios_appdelegate_initialize();

		onMemoryWarning = new Signal0();
		ios_appdelegate_set_memorywarningcallback(onMemoryWarning.dispatch);
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