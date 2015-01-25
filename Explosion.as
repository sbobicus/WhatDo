package 
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	

	public class Explosion extends FlxSprite 
	{
		
		public var time:Number = 0;
		public var liveTime:Number = 0.15;
		public function Explosion(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(GameAssets.RoboExplode, true, false, 48, 48);
			addAnimation("splode", [0, 1, 2, 3], 1.0 / 0.05);
			play("splode");
		}
		
		public override function postUpdate():void
		{
			time += FlxG.elapsed;
			
			if (time > liveTime)
			{
				kill();
			}
			
			super.postUpdate();
		}
		
	}

}