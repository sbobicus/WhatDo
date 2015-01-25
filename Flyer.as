package 
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author mklingen
	 */
	public class Flyer extends FlxSprite 
	{
		public var time:Number = 0.0;
		public var turnTime:Number = 1.0;
		public function Flyer(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			maxVelocity.x = 50;
			maxVelocity.y = 50;
			acceleration.y = 0;
			drag.x = maxVelocity.x * 4;
			
			loadGraphic(GameAssets.Flyer, true, true, 32, 32);
			addAnimation("fly", [0, 1, 2], 1.0 / 0.08, true);
		}
		
		public override function destroy() : void
		{
			super.destroy();
		}

		public override function postUpdate() : void
		{
			super.postUpdate();
			play("fly");
			time += FlxG.elapsed * Math.random();
			
			if (time > turnTime || Math.abs(Math.abs(velocity.x) + Math.abs(velocity.y)) < 10)
			{
				time = 0;
				acceleration.x = Math.random() * 150 - 150 * 0.5;
				acceleration.y = Math.random() * 150 - 150 * 0.5;
				var len:Number = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y);
				acceleration.x /= len;
				acceleration.y /= len;
				acceleration.x *= 150;
				acceleration.y *= 150;
			}
			
			
			if (velocity.x > 0)
			{
				facing = FlxObject.RIGHT;
			}
			else
			{
				facing = FlxObject.LEFT;
			}
			
			
		}
		
	}

}