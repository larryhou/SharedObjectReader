package code 
{
	import flash.desktop.NativeApplication;
	import flash.filesystem.File;
	import flash.system.Capabilities;
	/**
	 * 路径配置
	 * @author Larry H.
	 */
	public class PathConfig
	{
		private var _swfSOPath:String = null;
		private var _appSOPath:String = null;
		
		private var _isReady:Boolean = false;
		
		public function PathConfig()
		{
			initConfig();
		}
		
		
		private function initConfig():void
		{	
			var home:String = File.userDirectory.url;
			
			var app:NativeApplication = NativeApplication.nativeApplication;
			
			var pattern:RegExp;			
			var os:String = Capabilities.os;
			if (os.match(/Mac\s*OS/i))
			{
				_swfSOPath = home + "/Library/Preferences/Macromedia/Flash Player/%23SharedObjects";
				_appSOPath = home + "/Library/Preferences/" + app.applicationID + "/Local%20Store/%23SharedObjects/" + app.applicationID + ".swf";
			}
			else
			{
				pattern = /windows\s*(7|vista)/i;
				if (pattern.test(os))
				{
					_swfSOPath = home + "/AppData/Roaming/Macromedia/Flash%20Player/%23SharedObjects";
					_appSOPath = home + "/AppData/Roaming/" + app.applicationID + "/Local%20Store/%23SharedObjects/" + app.applicationID + ".swf";
				}
				else
				{
					pattern = /windows\s*xp/i;
					if (pattern.test(os))
					{
						_swfSOPath = home + "/Application%20Data/Macromedia/Flash%20Player/%23SharedObjects";
						
						_appSOPath = home + "/Application%20Data/";
						_appSOPath += app.applicationID + "/local%20store/%23SharedObjects/" + app.applicationID + ".swf";
					}
				}
			}
		}
		
		/**
		 * swf共享文件路径
		 */
		public function get swfSOPath():String 
		{ 
			//if (!_isReady) initConfig();
			
			return _swfSOPath; 
		}
		
		
		/**
		 * 程序安装路径
		 */
		public function get appSOPath():String 
		{ 
			//if (!_isReady) initConfig();
			
			return _appSOPath; 
		}
		
	}

}