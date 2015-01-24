package 
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author mklingen
	 */
	public class Crawler extends FlxSprite 
	{
		public var time:Number = 0.0;
		public var turnTime:Number = 1.0;
		public var turnDir:Boolean = false;
		public function Crawler(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			maxVelocity.x = 150;
			maxVelocity.y = 250;
			acceleration.y = 300;
			drag.x = maxVelocity.x * 4;
			
			loadGraphic(GameAssets.Robot1, true, true, 32, 32);
			addAnimation("roll", [0, 1, 2], 1.0 / 0.08, true);
		}
		
		public override function destroy() : void
		{
			super.destroy();
		}

		public override function postUpdate() : void
		{
			super.postUpdate();
			play("roll");
			time += FlxG.elapsed * Math.random();
			
			if (time > turnTime)
			{
				time = 0;
				turnDir = !turnDir;
			}
			
			
			if (turnDir)
			{
				facing = FlxObject.RIGHT;
				if (Math.abs(velocity.y) < 10)
				{
					acceleration.x = 100;
				}
				else 
				{
					acceleration.x = 0;
				}
			}
			else
			{
				facing = FlxObject.LEFT;
				if (Math.abs(velocity.y) < 10)
				{
					acceleration.x = -100;
				}
				else 
				{
					acceleration.x = 0;
				}
			}
		}
		
	}

}