package 
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	

	public class Flames extends FlxSprite 
	{
		public var timer:Number = 0;
		public var exitTime:Number = 0.5;
		
		public function Flames(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			
		}
		
		public override function postUpdate():void
		{
			timer += FlxG.elapsed;
			
			if (timer > exitTime)
			{
				exists = false;
			}
		}
		
	}

}