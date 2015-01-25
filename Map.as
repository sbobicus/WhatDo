package
{
	import flash.utils.ByteArray;
	
	import flash.filters.DisplacementMapFilterMode;
	import org.flixel.*;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;

	public class Map extends FlxTilemap
	{
		public var coins:FlxGroup;
		public var exit:FlxSprite;
		public var spawn:FlxObject;
		private var tileData:LevelData;
		private var objectData:LevelData;
		public var tileWidth:int;
		public var tileHeight:int;
		public var enemies:FlxGroup;
		public var hazards:FlxGroup;
		public var objectFunctions:Array;
		
		public function Map(tiles:LevelData, objects:LevelData) : void
		{
			super();
			tileData = tiles;
			objectData = objects;
			
			objectFunctions = new Array(nothing, nothing, createCoin, createCrawler, createSpawn, createExit, createSpike, createFlyer);
		}
		
		public function nothing(x:uint, y:uint) : void
		{
			// an intentional nothing for no enemies.
		}
		
		//creates a new coin located on the specified tile
		public function createCoin(X:uint,Y:uint):void
		{
			var coin:Coin = new Coin(X * _tileWidth + 3, Y * _tileHeight + 2, null);
			coin.loadGraphic(GameAssets.Coins, true);
			coin.addAnimation("red", [0, 1], 1);
			coin.addAnimation("blue", [1]);
			coin.play("red");
			coins.add(coin);
		}
		
		public function createSpike(X:uint, Y:uint):void
		{
			var spike:FlxObject = new FlxObject(X * _tileWidth - 1, Y * _tileHeight - 1, 18 , 18);
			hazards.add(spike);
		}
		
		
		public function createFlyer(X:uint, Y:uint):void
		{
			enemies.add(new Flyer(X * _tileWidth, Y * _tileHeight - 32));
		}
		
				
		public function createCrawler(X:uint, Y:uint):void
		{
			enemies.add(new Crawler(X * _tileWidth, Y * _tileHeight - 32));
		}
		
		public function createSpawn(X:uint, Y:uint):void
		{
			spawn = new FlxObject(X * _tileWidth, Y * _tileHeight - 32);
		}
		
		public function createExit(X:uint, Y:uint):void
		{
			exit = new FlxSprite(X* _tileWidth - 16,Y * _tileHeight - 16);
			exit.loadGraphic(GameAssets.Elevator, true, false, 32, 32, false);
			exit.addAnimation("open", [0, 1, 2], 3, false);
			exit.addAnimation("closed", [0], 3, true);
			exit.play("closed");
			exit.exists = true;
		}
		
		public function loadLevel():void
		{
			loadTiles();
			tileWidth = _tileWidth;
			tileHeight = _tileHeight;
			loadObjects();
		}
		
		public function loadTiles():void
		{
			if (tileData.type == LevelData.TYPE_BITMAP)
			{
				loadBitmap(tileData, this);
			}
			else
			{
				loadCSV(tileData, this);
			}
		}
		
		public function loadBitmap(data:LevelData, map:FlxTilemap):void
		{
			map.loadMap(imageToCSV(data.asset), GameAssets.TileMap, 16, 16, FlxTilemap.OFF, -1);
		}
		
		public function loadCSV(data:LevelData, map:FlxTilemap):void
		{
			var myByteArray:ByteArray = new data.asset;
			var myString:String = myByteArray.readUTFBytes(myByteArray.length);
			map.loadMap(myString, GameAssets.TileMap, 16, 16, FlxTilemap.OFF, 1);
	
		}
		
		public function loadObjects():void
		{
			coins = new FlxGroup();
			enemies = new FlxGroup();
			hazards = new FlxGroup();

			var objectMap:FlxTilemap = new FlxTilemap();
		    
			if (objectData.type == LevelData.TYPE_BITMAP)
			{
				loadBitmap(objectData, objectMap);
			}
			else 
			{
				loadCSV(objectData, objectMap);
			}
			
			for (var x:int = 0; x < this.widthInTiles; x++)
			{
				for (var y:int = 0; y < this.heightInTiles; y++)
				{
					var tile:uint = objectMap.getTile(x, y);
					
					if (tile < objectFunctions.length)
					{
						objectFunctions[tile](x, y);
					}
				}
			}
		}
	}

}
