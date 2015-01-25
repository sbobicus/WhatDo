package 
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	public class Coin   extends FlxSprite
	{
		var origY:Number;
		var time:Number;
		
		public function Coin(x:Number, y:Number, graphic:Class)
		{
			super(x, y, graphic);
			origY = y;
			time = 0;
		}
		
		
		public override function postUpdate() : void
		{
			super.postUpdate();
			time += FlxG.elapsed * Math.random();
			y = origY - 4 + Math.sin(time * 4 ) * 4;
		}
	}

}