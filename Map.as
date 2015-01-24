package
{
	import flash.display.BitmapData;
	import flash.filters.DisplacementMapFilterMode;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import flash.utils.ByteArray;

	public class Map extends FlxTilemap
	{
		public var coins:FlxGroup;
		public var exit:FlxSprite;
		private var tileData:LevelData;
		private var objectData:LevelData;
		public var tileWidth:int;
		public var tileHeight:int;
		public var enemies:FlxGroup;
		public var objectFunctions:Array;
		
		public function Map(tiles:LevelData, objects:LevelData) : void
		{
			super();
			tileData = tiles;
			objectData = objects;
			
			objectFunctions = new Array(nothing, createCoin);
		}
		
		public function nothing(x:uint, y:uint) : void
		{
			// an intentional nothing for no enemies.
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
			coin.loadGraphic(GameAssets.Coins, true);
			coin.addAnimation("red", [0, 1], 1);
			coin.addAnimation("blue", [1]);
			coin.play("red");
			coins.add(coin);
		}
		
		public function createExit(X:uint, Y:uint):void
		{
			exit = new FlxSprite(X* _tileWidth + 1,Y * _tileHeight);
			exit.makeGraphic(14,16,0xff3f3f3f);
			exit.exists = false;
		}
		
		public function loadLevel():void
		{
			loadTiles();
			loadObjects();
			tileWidth = _tileWidth;
			tileHeight = _tileHeight;
		}
		
		public function loadTiles():void
		{
			if (tileData.type == LevelData.TYPE_BITMAP)
			{
				loadBitmap(this);
			}
			else
			{
				loadCSV(this);
			}
		}
		
		public function loadBitmap(map:FlxTilemap):void
		{
			map.loadMap(imageToCSV(tileData.asset), GameAssets.TileMap, 16, 16, FlxTilemap.OFF, -1);
		}
		
		public function loadCSV(map:FlxTilemap):void
		{
			var myByteArray:ByteArray = new tileData.asset;
			var myString:String = myByteArray.readUTFBytes(myByteArray.length);
			map.loadMap(myString, GameAssets.TileMap, 16, 16, FlxTilemap.OFF, 1);
	
		}
		
		public function loadObjects():void
		{
			coins = new FlxGroup();
			enemies = new FlxGroup();
			var objectMap:FlxTilemap = new FlxTilemap();
		    
			if (objectData.type == LevelData.TYPE_BITMAP)
			{
				loadBitmap(objectMap);
			}
			else 
			{
				loadCSV(objectMap);
			}
			
			
			for (var x:int = 0; x < this.widthInTiles; x++)
			{
				for (var y:int = 0; y < this.heightInTiles; y++)
				{
					var tile:uint = getTile(x, y);
					//objectFunctions[tile](x, y);
				}
			}
			
		}
	}

}
