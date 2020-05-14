package
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.Sprite;
	import frocessing.shape.FShapeSVG;
	
	public class HelloSVG extends Sprite
	{
		//private var loader:URLLoader;
		
		public function HelloSVG()
		{
			//loaderを準備
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onload);
			
			//SVGデータの読み込み
			loader.load(new URLRequest("sample.svg"));
		}
		
		private function onload(e:Event):void
		{
			var loader:URLLoader = e.target as URLLoader;
			//XML取得
			var svg:XML = XML(loader.data);
			//shapeデータの生成
			var shapedata:FShapeSVG = new FShapeSVG(svg);
			//Spriteに変換
			var sprite:Sprite = shapedata.toSprite();
			//表示
			addChild(sprite);
		}
	}
}