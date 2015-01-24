package
{
	import flash.display.BitmapData;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;

	public class Map extends FlxTilemap
	{
		public var coins:FlxGroup;
		public var exit:FlxSprite;
		private var levels:Array;
		private var levelObjects:Array;
		public var tileWidth:int;
		public var tileHeight:int;
		
		public function Map() : void
		{
			super();
			levels = new Array();
			//levelObjects = new Array();
			levels.push(GameAssets.LevelImage);
			//levelObjects.push(GameAssets.LevelImage);
		}
		
		public function setData(data:Array, width:int):void
		{
			coins = new FlxGroup();
			loadMap(FlxTilemap.arrayToCSV(data,width), FlxTilemap.ImgAuto, 0, 0,FlxTilemap.AUTO);
		}
		
		//creates a new coin located on the specified tile
		public function createCoin(X:uint,Y:uint):void
		{
			var coin:FlxSprite = new FlxSprite(X * _tileWidth + 3, Y * _tileHeight + 2);
			coin.makeGraphic(2,4,0xffffff00);
			coins.add(coin);
		}
		
		public function createExit(X:uint, Y:uint):void
		{
			exit = new FlxSprite(X* _tileWidth + 1,Y * _tileHeight);
			exit.makeGraphic(14,16,0xff3f3f3f);
			exit.exists = false;
		}
		
		public function loadLevel(num:uint):void
		{
			coins = new FlxGroup();
			loadTiles(num);
			loadObjects(num);
			tileWidth = _tileWidth;
			tileHeight = _tileHeight;
		}
		
		public function loadTiles(num:uint):void
		{
			loadMap(imageToCSV(levels[num]), GameAssets.TileMap, 32, 32, FlxTilemap.OFF);
		}
		
		public function loadObjects(num:uint):void
		{
			//var bitmap:BitmapData = (new levelObjects[0]).bitmapData;
			coins = new FlxGroup();
		}
	}

}
