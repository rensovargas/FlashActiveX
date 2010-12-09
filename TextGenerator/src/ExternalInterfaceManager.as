package
{
	import com.zemoga.event.DynamicTextEvent;
	import com.zemoga.event.EIMessageEvent;
	import com.zemoga.text.DynamicText;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.utils.Timer;

	public class ExternalInterfaceManager extends EventDispatcher
	{
		
		private var _dynamicText:DynamicText;
		private var _name:String;
		public function ExternalInterfaceManager()
		{
			this.init();
		}
		
		private function init():void{
		
			if (ExternalInterface.available)
			{
				try
				{
					var containerReady:Boolean = isContainerReady();
					if(containerReady){
						setupCallbacks();
					}else{
						// If the container is not ready, set up a Timer to call the
						// container at 100ms intervals. Once the container responds that
						// it's ready, the timer will be stopped.
						var readyTimer:Timer = new Timer(100);
						readyTimer.addEventListener(TimerEvent.TIMER, timerHandler);
						readyTimer.start();
					}
					
					
				}catch (error:SecurityError)
				{
					trace("A SecurityError occurred: " + error.message + "\n");
					throw error;
				}
				catch (error:Error)
				{
					trace("An Error occurred: " + error.message + "\n");
					throw error;
				}
			}
			else
			{
				trace("External interface is not available for this container.");
			}
		}
		
		
		/**
		 * Called by the container to send a new message to the SWF client.
		 * @param message	The message that was sent
		 */
		private function newMessage(message:String):void
		{
			// notify listeners (i.e. the UI) that there's a new message;
			// the UI will then update itself accordingly
			var e:EIMessageEvent = new EIMessageEvent(message);
			dispatchEvent(e);
		}
		
		public function generateImage(text:String,scale:String):void{
			this.newMessage("generateImage set text");
			this.dynamicText.addEventListener(DynamicTextEvent.TEXT_CHANGED,delayGeneration);
			this.dynamicText.text = text;
			this.dynamicText.scale = Number(scale);
			
			//this.newMessage("generateImage set text " + text + " " + scale);
			
		}
		
		private function delayGeneration(e:DynamicTextEvent):void{
			this.newMessage("delayGeneration");
			var timer:Timer = new Timer(500,1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, sendText);
			timer.start();
		}
		
		public function sendText(e:TimerEvent):void{
			this.newMessage("Text changed proccess started");
			var imageString:String = this.dynamicText.generateImage();
			ExternalInterface.call("createImage",imageString);
			this.newMessage("External Interface Called");
		}
		
		/**
		 * Calls the container's isReady() function, to check if the container is loaded
		 * and ready to communicate with the SWF file.
		 * @return 	Whether the container is ready to communicate with ActionScript.
		 */
		private function isContainerReady():Boolean
		{
			var result:Boolean = ExternalInterface.call("isReady");
			return result;
		}
		
		/**
		 * Registers the appropriate ActionScript functions with the container, so that
		 * they can be called, and calls the "setSWFIsReady()" function in the container
		 * which tells the container that the SWF file is ready to receive function calls.
		 */
		private function setupCallbacks():void
		{
			// register the SWF client functions with the container
			ExternalInterface.addCallback("newMessage", newMessage);
			ExternalInterface.addCallback("generateImage", generateImage);
			// notify the container that the SWF is ready to be called.
			ExternalInterface.call("setSWFIsReady");
		}
		
		/**
		 * Handles the timer event; this function is called by the timer each
		 * time the elapsed time has been reached.
		 * The net effect is that on regular intervals this function checks
		 * to see if the container is ready to receive communication.
		 * @param event		The event object for the Timer event.
		 */
		private function timerHandler(event:TimerEvent):void
		{
			// check if the container is now ready
			var isReady:Boolean = isContainerReady();
			if (isReady)
			{
				// If the container has become ready, we don't need to check anymore,
				// so stop the timer.
				Timer(event.target).stop();
				// Set up the ActionScript methods that will be available to be
				// called by the container.
				setupCallbacks();
			}
		}
		
		public function set dynamicText(value:DynamicText):void{
			this._dynamicText = value;
		}
		
		public function get dynamicText():DynamicText{
			return this._dynamicText;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

	}
}