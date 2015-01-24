package
{
	import flash.utils.ByteArray;
	
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
			//levels.push(GameAssets.Level1);
			levels.push(new LevelData(GameAssets.Level1, LevelData.TYPE_BITMAP));
			//levels.push(new LevelData(GameAssets.TestMap, LevelData.TYPE_CSV));
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
			loadTiles(num);
			loadObjects(num);
			tileWidth = _tileWidth;
			tileHeight = _tileHeight;
		}
		
		public function loadTiles(num:uint):void
		{
			var levelData:LevelData = levels[num];
			
			if (levelData.type == LevelData.TYPE_BITMAP)
			{
				loadImage(levelData.asset);
			}
			else
			{
				loadCSV(levelData.asset);
			}
			
		}
		
		public function loadImage(Image:Class):void
		{
			loadMap(imageToCSV(Image), GameAssets.TileMap, 16, 16, FlxTilemap.OFF, -1);
		}
		
		public function loadCSV(asset:Class):void
		{
			var myByteArray:ByteArray = new asset;
			var myString:String = myByteArray.readUTFBytes(myByteArray.length);
			loadMap(myString, GameAssets.TileMap, 16, 16, FlxTilemap.OFF, 1);
		}
		
		public function loadObjects(num:uint):void
		{
			//var bitmap:BitmapData = (new levelObjects[0]).bitmapData;
			coins = new FlxGroup();
		}
	}

}
