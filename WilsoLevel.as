package 
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author mklingen
	 */
	public class WilsoLevel extends Level 
	{
		public function WilsoLevel() 
		{
			super();
		}
		
		override public function loadMap():void 
		{
			map = new Map(new LevelData(GameAssets.WilsoTiles, LevelData.TYPE_CSV), new LevelData(GameAssets.WilsoObjects, LevelData.TYPE_CSV));
			map.loadLevel();
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}