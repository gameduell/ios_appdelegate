package ios_appdelegate;

import cpp.Lib;

import msignal.Signal;

class IOSAppDelegate {


	public static var onMemoryWarning(default, null) : Signal0;
	
	public static function initialize ():Int {
		
		ios_appdelegate_initialize();

		onMemoryWarning = new Signal0();
		ios_appdelegate_set_memorywarningcallback(onMemoryWarning.dispatch);

		return 0;
	}

	private static var ios_appdelegate_initialize = Lib.load ("ios_appdelegate", "ios_appdelegate_initialize", 0);

	private static var ios_appdelegate_set_memorywarningcallback = Lib.load ("ios_appdelegate", "ios_appdelegate_set_memorywarningcallback", 1);
}