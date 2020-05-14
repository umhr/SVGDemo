package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import frocessing.shape.FShapeSVG;
	
	/**
	 * ...
	 * @author umhr
	 */
	public class Canvas extends Sprite
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
			
			_fetchFile = new FetchFile();
			_fetchFile.addEventListener(Event.COMPLETE, fetchFile_complete);
			
			stage.addEventListener(MouseEvent.CLICK, stage_click);
			
			add();
		}
		
		private function add():void
		{
			var svg:XML =  <svg>
					<circle cx="50"  cy="75" r="40" fill="#FF0000"/>
					<circle cx="150" cy="75" r="40" fill="#00FF00"/>
					<circle cx="250" cy="75" r="40" fill="#0000FF"/>
					<circle cx="350" cy="75" r="40" fill="#000000"/>
				</svg>;
			
			addSVG(svg);
			
			var textField:TextField = new TextField();
			textField.text = "ステージをクリックファイルローダーが開きます。svgファイルの表示ができます。";
			textField.width = stage.stageWidth;
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
}