package com.zemoga.event
{
	import flash.events.Event;
	
	public class DynamicTextEvent extends Event
	{
		public static const GENERATE_IMAGE:String = "GenerateImage";
		public static const TEXT_CHANGED:String = "TextChanged";
		private var _properties:Object;
		
		public function DynamicTextEvent(type:String, prop:Object=null, bubbles:Boolean=false)
		{
			super(type,bubbles);
			this._properties = prop;
		}
		
		public function get properties():Object{
			return this._properties;
		}
	}
}