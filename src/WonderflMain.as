package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author umhr
	 */
	public class WonderflMain extends Sprite 
	{
		
		public function WonderflMain():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.scaleMode = "noScale";
			stage.align = "TL";
			
			addChild(new Canvas());
		}
	}
}

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import frocessing.shape.FShapeSVG;
	
	/**
	 * ...
	 * @author umhr
	 */
	 class Canvas extends Sprite
	{
		private var _fetchFile:FetchFile;
		public function Canvas()
		{
			init();
		}
		
		private function init():void
		{
			if (stage)
				onInit();
			else
				addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		
		private function onInit(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onInit);
			// entry point
			
			graphics.beginFill(0xEEEEEE);
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			graphics.endFill();
			
			_fetchFile = new FetchFile();
			_fetchFile.addEventListener(Event.COMPLETE, fetchFile_complete);
			
			stage.addEventListener(MouseEvent.CLICK, stage_click);
			
			add();
		}
		
		private function add():void
		{
			var svg:XML =  <svg>
				<path fill="#3F6AC1" d="M173.723,29.498c0.117-0.285,0.25-0.605,0.41-0.969h5.516v2.066h-6.57C173.387,30.15,173.605,29.783,173.723,29.498z M170.301,23.568c-0.395,2.992-1.434,5.52-3.121,7.586h1.758v2.684h10.711v2.066h-10.711v8.203h5.195v-5.242h5.516v5.242h5.898v-5.242h5.52v1.688c0,0.578-0.379,0.863-1.141,0.863h-1.5v2.691h1.539v2.41h-22.809l-0.375,4.273h16.012c-2.266,1.223-4.613,2.395-7.066,3.086c-2.422,0.676-5.426,1.625-8.945,1.625v4.063c2.973-0.219,5.781-0.926,8.078-1.633c2.434-0.742,4.949-1.895,7.184-2.754l-2.621,8.691c0,0,8.715-0.125,10.93-0.234c4.109-0.219,7.555-0.617,10.34-1.203v-4.266c2.383,1.777,4.898,3.133,7.551,4.082c3.125,1.133,6.457,1.703,10.008,1.703v-4.262c-1.367-0.125-2.625-0.305-3.785-0.527c-1.156-0.23-2.512-0.574-4.074-1.035l7.156-5.41h-6.281l-4.988,3.582c-1.523-0.848-2.793-1.719-3.809-2.617c-1.02-0.898-1.805-1.859-2.352-2.891h18.133v-4.273h-21.414v-2.816h-2.414c1.219-0.492,1.836-1.52,1.836-3.09v-4.707h-10.711v-2.066h10.711v-3.242h-10.711v-2.066h9.391v-3.238h-9.391v-1.723h-5.898v1.723h-4.488l0.379-1.723H170.301z M199.336,24.302v13.875h5.719V24.302H199.336z M210.863,23.568v15.07c0,0.98-0.613,1.469-1.832,1.469h-6.023v4h8.035c1.797,0,3.219-0.406,4.258-1.219c1.035-0.813,1.551-1.969,1.551-3.469V23.568H210.863z M187.813,52.533c0.625-0.336,1.016-0.547,1.172-0.641c0.078-0.063,0.586-0.426,1.523-1.102h3.406c0.742,1.406,1.648,2.707,2.727,3.902c1.07,1.199,2.375,2.344,3.906,3.441c-2.16,0.5-4.211,0.891-6.164,1.18s-6.039,0.555-8.461,0.555L187.813,52.533z"/>
				<path fill="#3F6AC1" d="M315.82,37.373h8.859v9.094h-8.859V37.373z M307.578,24.302v4.594h24.461v-4.594H307.578z M309.484,32.822v14.914c0,2.168-0.137,3.875-0.406,5.117c-0.277,1.242-0.77,2.258-1.473,3.047v7.988c2.707-1.5,4.727-3.293,6.074-5.379c1.348-2.098,2.027-4.594,2.027-7.492h15.277V32.822H309.484z M334.945,24.13v21.891c0,2.387-0.273,4.426-0.828,6.109c-0.547,1.684-1.367,3.074-2.465,4.18v7.578c3.363-2.09,5.824-4.738,7.395-7.949c1.371-2.852,2.055-6.141,2.055-9.883v-8.68h7.57v26.512h6.219v-26.5h4.16v-4.82h-17.949v-3.754h17.324l-0.02-4.684H334.945z"/>
				<g>
					<path fill="#3F6AC1" d="M146.535,24.384v4.984h-21.121v11.203h19.738v4.938h-19.738V58.4h21.805v4.918h-50.32V58.4h21.805V45.509H98.91v-4.938h19.793V29.369H97.477v-4.984H146.535z"/>
					<path fill="#3F6AC1" d="M137.551,47.517c2.43,0.93,3.652,3.656,2.723,6.086c-0.934,2.434-3.66,3.656-6.094,2.727c-2.43-0.934-3.652-3.664-2.719-6.094C132.391,47.806,135.117,46.583,137.551,47.517z"/>
				</g>
				<path fill="#3F6AC1" d="M26.566,62.626v-6.688c2.941-1.504,5.41-3.836,7.398-7.016c2.184-3.516,3.277-7.367,3.277-11.555H26.566v-5.547h17.168v5.547c0,5.195-1.512,10.086-4.539,14.668C36.059,56.806,31.848,60.333,26.566,62.626z M63.918,52.037c-3.02-4.582-4.531-9.473-4.531-14.668v-5.547h17.164v5.547H65.875c0,4.188,1.094,8.039,3.277,11.555c1.984,3.18,4.457,5.512,7.398,7.016v6.688C71.266,60.333,67.059,56.806,63.918,52.037z M55.18,23.349v33.762c0,4.367-2.551,6.555-7.652,6.555h-7.992v-5.402h6.129c1.719,0,2.582-0.652,2.582-1.973V23.349H55.18z"/>
				<path fill="#3F6AC1" d="M243.543,35.216c-1.582,3.262-3.699,5.426-6.363,6.5v7.027c2.508-1.008,4.617-2.203,6.336-3.582v18.789h6.746V36.56c0.707-1.523,1.301-3.117,1.73-4.813c0.688-2.668,1.027-5.391,1.027-8.18h-7.094C245.926,28.072,245.129,31.955,243.543,35.216z M288.633,32.494v-4.832h-22.766l0.41-4.094h-6.574c0,3.008-0.602,6.547-1.813,10.625c-1.211,4.082-2.527,7.238-3.938,9.477h6.871c0.703-1.105,1.434-2.676,2.199-4.715s1.418-4.191,1.965-6.461h3.699v31.457h7.094v-9.707h11.445v-4.828h-11.445v-6.043h11.445v-4.738h-11.445v-6.141H288.633z"/>
			</svg>;
			
			addSVG(svg);
			
			var textField:TextField = new TextField();
			textField.text = "ステージをクリックファイルローダーが開きます。svgファイルの表示ができます。";
			textField.width = stage.stageWidth;
			textField.selectable = false;
			addChild(textField);
		}
		
		private function stage_click(e:MouseEvent):void
		{
			_fetchFile.start();
		}
		
		private function fetchFile_complete(e:Event):void
		{
			if (_fetchFile.type == ".svg")
			{
				addSVG(XML(_fetchFile.content));
			}
		}
		
		private function addSVG(svg:XML):void
		{
			while (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
			//shapeデータの生成
			var fShapeSVG:FShapeSVG = new FShapeSVG(svg);
			//Spriteに変換
			var sprite:Sprite = fShapeSVG.toSprite();
			//表示
			addChild(sprite);
		}
		
	}

	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.FileReference;
	import flash.system.LoaderContext;
	
	/**
	 * ...
	 * @author umhr
	 */
	class FetchFile extends EventDispatcher 
	{
		public var content:Object;
		public var type:String;
		private var _fileReference:FileReference;
		public function FetchFile(target:flash.events.IEventDispatcher=null) 
		{
			super(target);
		}
		public function start():void{
			_fileReference = new FileReference();
			_fileReference.addEventListener(Event.SELECT, atSelect);
			_fileReference.browse();
		}
		private function atSelect(event:Event):void {
			_fileReference.removeEventListener(Event.SELECT, atSelect);
			_fileReference.addEventListener(Event.COMPLETE, atFileComplete);
			_fileReference.load();
		}
		private function atFileComplete(event:Event):void {
			_fileReference.removeEventListener(Event.COMPLETE, atFileComplete);
			type = _fileReference.type;
			if (isByteArray(type)) {
				loaderStart();
			}else {
				urlLoaderStart();
			}
		}
		/**
		 * 拡張子が指定の場合はByteArrayとする。
		 * @param	type
		 * @return
		 */
		private function isByteArray(type:String):Boolean {
			var list:Array/*String*/ = [".jpg", ".png", ".gif"];
			for each (var extention:String in list) {
				if (extention == type) {
					return true;
				}
			}
			return false;
		}
		
		private function urlLoaderStart():void {
			content = _fileReference.data;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function loaderStart():void {
			var loader:Loader = new Loader();
			loader.loadBytes(_fileReference.data, new LoaderContext());
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, atBytesComplete);
		}
		
		private function atBytesComplete(event:Event):void {
			event.target.removeEventListener(Event.COMPLETE, atBytesComplete);
			content = event.target.content;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	}
