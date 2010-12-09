package com.zemoga.timer
{
	import flash.utils.Timer;
	
	public class DataTimer extends Timer
	{
		private var _data:Object;
		
		public function DataTimer(delay:Number, repeatCount:int=0)
		{
			super(delay, repeatCount);
			_data = {};
		}
		
		public function get data():Object
		{
			return this._data;
		}
		
		public function set data(value:Object):void
		{
			this._data = value;
		}
	}
}