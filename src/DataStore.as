package {
	public class DataStore {
		
		import flash.filesystem.File;
		import flash.filesystem.FileStream;
		import flash.filesystem.FileMode;
		
		private var configDir:String;
		private var configSec:String;
		private var configFile:File;
		private var configStream:FileStream;
		private var configArray:Array;
		private var configPar:String;
		private var configImg:String;
		private var configRan:String;
		private var configIdl:String;
		private var configAut:String;
			
		public function DataStore(){}
		
		public function writeConfig(d:String, s:int, p:Boolean, i:Boolean, r:Boolean, w:Boolean, a:Boolean):void {
			configDir = d;
			configSec = s.toString();
			configFile = File.applicationStorageDirectory;
			configFile = configFile.resolvePath("config.txt");
			configStream = new FileStream();
			
			configStream.open(configFile, FileMode.WRITE);
			configStream.writeUTFBytes(configDir);
			
			configStream.open(configFile, FileMode.APPEND);
			
			configStream.writeUTFBytes(":^:");
			configStream.writeUTFBytes(String(configSec));
			
			configStream.writeUTFBytes(":^:");
			configStream.writeUTFBytes(String(p));
			
			configStream.writeUTFBytes(":^:");
			configStream.writeUTFBytes(String(i));
			
			configStream.writeUTFBytes(":^:");
			configStream.writeUTFBytes(String(r));
			
			configStream.writeUTFBytes(":^:");
			configStream.writeUTFBytes(String(w));
			
			configStream.writeUTFBytes(":^:");
			configStream.writeUTFBytes(String(a));
			
			configStream.close();
		}
		
		public function readConfig():void {
			configFile = File.applicationStorageDirectory;
			configFile = configFile.resolvePath("config.txt");
			if(configFile.exists){
				configStream = new FileStream();
				configStream.open(configFile, FileMode.READ);
				configArray = configStream.readUTFBytes(configFile.size).split(":^:");
				configStream.close();
				configDir = configArray[0];
				configSec = configArray[1];
				configPar = configArray[2];
				configImg = configArray[3];
				configRan = configArray[4];
				configIdl = configArray[5];
				configAut = configArray[6];
			}else{
				configDir = "";
				configSec = "";
				configPar = "";
				configImg = "";
				configRan = "";
				configIdl = "";
				configAut = "";
			}
		}
		
		public function readDir():String {
			return configDir;
		}
		
		public function readSec():String {
			return configSec;
		}
		
		public function readPar():Boolean {
			var tmpPar:Boolean = true;
			if(configPar == "false"){
				tmpPar = false;
			}
			return tmpPar;
		}
		
		public function readImg():Boolean {
			var tmpImg:Boolean = true;
			if(configImg == "false"){
				tmpImg = false;
			}
			return tmpImg;
		}
		
		public function readRan():Boolean {
			var tmpRan:Boolean = false;
			if(configRan == "true"){
				tmpRan = true;
			}
			return tmpRan;
		}
		
		public function readIdl():Boolean {
			var tmpIdl:Boolean = false;
			if(configIdl == "true"){
				tmpIdl = true;
			}
			return tmpIdl;
		}
		
		public function readAut():Boolean {
			var tmpAut:Boolean = false;
			if(configAut == "true"){
				tmpAut = true;
			}
			return tmpAut;
		}

	}
}