package com.zemoga.event
{
	import flash.events.Event;
	
	public class EIMessageEvent extends Event
	{
		public static const NEW_MESSAGE:String = "NewMessage";
		private var _message:String;
		
		public function EIMessageEvent(message:String)
		{
			super(NEW_MESSAGE);
			this._message = message;
		}
		
		public function get message():String{
			return this._message;
		}
	}
}