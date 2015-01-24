package
{
	import org.flixel.*;

	public class Level extends FlxTilemap
	{
		public var coins:FlxGroup;
		public var exit:FlxSprite;
		
		
		public function Level() 
		{
			
		}
		
		public function setData(data:Array, width:int)
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
		
	}

}