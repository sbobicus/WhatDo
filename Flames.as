package 
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	

	public class Flames extends FlxSprite 
	{
		var timer:Number = 0;
		var exitTime:Number = 0.15;
		
		public function Flames(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(GameAssets.GroundWhoosh, true, false, 32, 32, false);
			addAnimation("whoosh", [0, 1, 2], 1.0 / 0.05, false);
		}
		
		public override function postUpdate():void
		{
			timer += FlxG.elapsed;
			
			if (timer > exitTime)
			{
				exists = false;
			}
			
			super.postUpdate();
		}
		
	}

}