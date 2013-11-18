package com.modularweb.contact {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.xml.XMLDocument;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.net.navigateToURL;
	import flash.system.Security;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.external.ExternalInterface;
	
	
	public class Skype extends MovieClip {
		
		private var t:MovieClip;
		private var i:int;
		
		public var skypeName:String; // Your Skype Name
		public var updateTime:int; // Number of seconds to wait until next status check
		
		private var xmlLoader:URLLoader = new URLLoader(); // Loads the XML file to setup the app and later on the Skype status XML file
		private var xml:XML; // The XML file to setup the app
		private var skypeXML:XML; // The XML file provided by Skype with the online status
		private var skypeStatus:String = "?"; // Your current online status
		private var timer:Timer; // A timer to wait for the next check
		private var loader:Loader; // A loader to load the status image
		
		public function Skype () {
			// Waiting for all properties to be set
			t = this as MovieClip;
			t.addEventListener("properties", loadXML);
		}
		
		private function loadXML (e:Event) {
			// Loading the XML file
			xmlLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, initiate);
			xmlLoader.load(new URLRequest(t.xmlSource));
		}
	
		private function initiate (e:Event) {
			// Referencing the XML file
			xml = new XML(e.target.data);
			
			// Assigning skypeName and updateTime from the XML file;
			skypeName = xml.@SkypeName;
			updateTime = Number(xml.@UpdateTime);
			
			// Building the buttons, adding text & functionality
			buildBtn(t.addBtn, xml.@AddText);
			buildBtn(t.chatBtn, xml.@ChatText);
			buildBtn(t.callBtn, xml.@CallText);
			MovieClip(t.addBtn).btn.addEventListener(MouseEvent.MOUSE_UP, addFunction);
			MovieClip(t.chatBtn).btn.addEventListener(MouseEvent.MOUSE_UP, chatFunction);
			MovieClip(t.callBtn).btn.addEventListener(MouseEvent.MOUSE_UP, callFunction);
			
			// Creating the Download Skype button
			t.downloadText.autoSize = TextFieldAutoSize.LEFT;
			t.downloadText.text = xml.@DownloadText;
			var d:MovieClip = new MovieClip();
			d.x = t.downloadText.x;
			d.y = t.downloadText.y;
			d.graphics.beginFill(0x000000, 0);
			d.graphics.drawRect(0, 0, t.downloadText.width, t.downloadText.height);
			d.graphics.endFill();
			d.buttonMode = true;
			d.addEventListener(MouseEvent.MOUSE_UP, downloadFunction);
			addChild(d);
			
			// Setting the headText;
			t.headText.text = xml.@HeadText.toString().replace("[status]", "checking").replace("[skypeName]", skypeName).replace("[newline]", "\n");
			
			// Checking, if the app is online. If not, nothing can be loaded, as the app uses a PHP form to get the online status
			var domain:String = ExternalInterface.call("window.location.href.toString");
			if (domain != null) {
				checkStatus(new TimerEvent("timerComplete"));
				
			}
		}
		
	
		private function checkStatus(e:TimerEvent) {
		
			// Loading an XML file including the online status from the Skype server with a PHP script
		
			var req:URLRequest = new URLRequest(xml.@PHPSource);
			req.method = URLRequestMethod.GET;
			req.data = new URLVariables("proxy_url=http://mystatus.skype.com/" + skypeName + ".xml");
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, xmlLoaded);
			loader.load(req);
			// Starting the timer to restart a loading process after updateTime
			timer = new Timer(updateTime * 1000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, checkStatus);
			timer.start();
		}
		
		
		
		private function xmlLoaded(e:Event):void {
			// Assigning the loaded XML file to the skypeXML variable 
			var resultVars:URLVariables = new URLVariables();
			try {
				resultVars.decode(e.currentTarget.data);
				skypeXML = new XML(resultVars.skypeXML);
			}
			catch (err:Error) {};
			t.headText.text = skypeXML.toString();
		
			
			// Finding out the current skypeStatus
			var oldStatus:String = skypeStatus;
			for (i = 0; i < skypeXML.child(0).children().length(); i++) {
				if (skypeXML.child(0).child(i).attributes()[0] == xml.@Language) {
					skypeStatus = skypeXML.child(0).child(i).text();
				}
			}
		
			// Setting texts for new status 
			t.headText.text = xml.@HeadText.toString().replace("[status]", skypeStatus).replace("[skypeName]", skypeName).replace("[newline]", "\n");
			t.statusText.text = skypeStatus;
			
			// Activating or deactivating chat button and call button depending on status 
			if (skypeXML.child(0).child(2).text() == "Online") {
				MovieClip(t.chatBtn).btn.visible = true;
				MovieClip(t.callBtn).btn.visible = true;
				t.chatBtn.alpha = 1;
				t.callBtn.alpha = 1;
			}
			else {
				MovieClip(t.chatBtn).btn.visible = false;
				MovieClip(t.callBtn).btn.visible = false;
				t.chatBtn.alpha = 0.3;
				t.callBtn.alpha = 0.3;
			}
			
			// If status has changed, loading new status icon
			if (skypeStatus != oldStatus) {
				loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, statusLoadComplete);
				loader.load(new URLRequest(xml.@IconSource + "/" + skypeXML.child(0).child(2).text().toString().toLowerCase().split(" ").join("_") + ".png"));
			}
		}
		
		private function statusLoadComplete (e:Event) {
			// Adding the new icon to the statusContainer
			var sc:MovieClip = t.statusContainer as MovieClip;
			while (sc.numChildren > 0) {
				sc.removeChildAt(0)
			}
			sc.addChild(loader.content);
		}
		
		private function buildBtn (mc:MovieClip, str:String) {
			// Creating the buttons
			mc.textfield.multiline = false;
			mc.textfield.autoSize = TextFieldAutoSize.LEFT;
			mc.textfield.text = str;
			mc.btn.width = mc.textfield.width + mc.textfield.x;
		}
		
		private function addFunction (e:MouseEvent) {
			// Adding skypeName as a Skype contact
			navigateToURL(new URLRequest("skype:" + skypeName + "?add"), "_self");
			dispatchEvent(new Event("skypeAdded"));
		}
		
		private function chatFunction (e:MouseEvent) {
			// Starting a Skype chat with skypeName
			navigateToURL(new URLRequest("skype:" + skypeName + "?chat"), "_self");
			dispatchEvent(new Event("skypeChat"));
		}
		
		private function callFunction (e:MouseEvent) {
			// Calling skypeName via Skype
			navigateToURL(new URLRequest("skype:" + skypeName + "?call"), "_self");
			dispatchEvent(new Event("skypeCall"));
		}
		
		private function downloadFunction (e:MouseEvent) {
			// Forwarding to the download page of Skype with the respective language
			navigateToURL(new URLRequest("http://www.skype.com/intl/" + xml.@Language + "/download/skype/windows/"), "_top");
			dispatchEvent(new Event("skypeDownload"));
		}
		
	}
	
}