package 
{
	import org.flixel.*;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class TransitionState extends FlxState 
	{
		public var text:FlxText;
		public var nextState:Class;
		public var time:Number = 0.0;
		public var transitionTime:Number = 3.0;
	
		public function TransitionState() 
		{
			
		}
		
		
		public function createText(string:String):void
		{
			text = new FlxText(FlxG.width / 2, FlxG.height / 2, 300, string);
			add(text);
		}
		
		public override function update() : void
		{
			super.update();
			time += FlxG.elapsed;
			text.y = FlxG.height / 2 + Math.sin(time) * 50;
			if (time > transitionTime)
			{
				FlxG.switchState(new nextState());
			}
		}
		
		
	}

}