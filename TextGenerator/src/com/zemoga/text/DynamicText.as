package com.zemoga.text
{
	import by.blooddy.crypto.Base64;
	import by.blooddy.crypto.image.PNG24Encoder;
	
	import com.zemoga.event.DynamicTextEvent;
	
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.text.engine.FontPosture;
	import flash.text.engine.Kerning;
	import flash.utils.ByteArray;
	
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.elements.Configuration;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.formats.TextAlign;
	import flashx.textLayout.formats.TextLayoutFormat;
	
	import mx.core.UIComponentCachePolicy;
	import mx.events.DynamicEvent;
	
	import spark.components.RichText;
	
	public class DynamicText extends RichText
	{
		private var config:Configuration;
		private var _format:TextLayoutFormat;
		private var _scale:Number;
		private var _color:Number;
		private var _fontFamily:String;
		private var _fontSize:Number;
		private var _fontStyle:FontPosture;
		private var _textAlign:TextAlign;
		
		public function DynamicText()
		{
			super();
			this.init();
		}
		
		private function init():void{
			config = new Configuration();
			this.cachePolicy = UIComponentCachePolicy.OFF;
			this.cacheAsBitmap = false;
			
			if(!this.format){
				config.textFlowInitialFormat = this.defaultFormat();
			}else{
				config.textFlowInitialFormat = this.format;
			}
		}
		
		private function defaultFormat():TextLayoutFormat{
			var textLayoutFormat:TextLayoutFormat = new TextLayoutFormat();
			textLayoutFormat.color = 0x000000;
			textLayoutFormat.fontFamily = "Helvetica";
			textLayoutFormat.fontSize = 20;
			textLayoutFormat.kerning = Kerning.ON;
			textLayoutFormat.fontStyle = FontPosture.NORMAL;
			textLayoutFormat.textAlign = TextAlign.START;
			return textLayoutFormat;
		}
		
		public function generateImage():String{
			
			var bmpData:BitmapData = new BitmapData(this.width * this.scale, this.height * this.scale, true, 0x00FFFFFF);
			var matrix:Matrix = new Matrix(this.scale, 0, 0, this.scale, 0, 0);
			
			bmpData.draw(this, matrix);
			
			var object:Object = new Object();
			object.image = bmpData;
			
			//dispatchEvent(new DynamicTextEvent(DynamicTextEvent.GENERATE_IMAGE,object,true));
			
			var byteArray:ByteArray = PNG24Encoder.encode(bmpData);
			var imageBase64Encoded:String = Base64.encode(byteArray,false);
			
			bmpData.dispose();
			
			return imageBase64Encoded;
		}
		
		public function set format(value:TextLayoutFormat):void{
			this._format = value;
		}
		
		public function get format():TextLayoutFormat{
			return this._format;
		}
		
		override public function set text(value:String):void{
			this.textFlow = TextConverter.importToFlow(value,TextConverter.PLAIN_TEXT_FORMAT,config);
			dispatchEvent(new DynamicTextEvent(DynamicTextEvent.TEXT_CHANGED));
		}

		public function get color():Number
		{
			return _color;
		}

		public function set color(value:Number):void
		{
			_color = value;
		}

		public function get fontFamily():String
		{
			return _fontFamily;
		}

		public function set fontFamily(value:String):void
		{
			_fontFamily = value;
		}

		public function get fontSize():Number
		{
			return _fontSize;
		}

		public function set fontSize(value:Number):void
		{
			_fontSize = value;
		}

		public function get fontStyle():FontPosture
		{
			return _fontStyle;
		}

		public function set fontStyle(value:FontPosture):void
		{
			_fontStyle = value;
		}

		public function get textAlign():TextAlign
		{
			return _textAlign;
		}

		public function set textAlign(value:TextAlign):void
		{
			_textAlign = value;
		}

		public function get scale():Number
		{
			return _scale;
		}

		public function set scale(value:Number):void
		{
			_scale = value;
		}


	}
}