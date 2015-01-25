package  
{

	import org.flixel.*;

	public class Player extends FlxSprite
	{
		public var index:int;
		public var flames:Flames;
		public var flameEmitter:FlxEmitter;
		public var jet:Flames;
		
		public static var buttons:Array;
		public static const KEY_UP:int = 0;
		public static const KEY_LEFT:int = 1;
		public static const KEY_DOWN:int = 2;
		public static const KEY_RIGHT:int = 3;
		public static const KEY_JUMP:int = 4;
		
		
		public function Player(myIndex:int, x:Number, y:Number, graphic:Class) 
		{
			super(x, y, null);
			index = myIndex;
			loadGraphic(graphic, true, true, 32, 40, false);
			
			addAnimation("idle", [0], 1, true);
			addAnimation("run", [4, 5, 6, 7], 1.0 / 0.08, true);
			addAnimation("jump", [8, 9], 1.0 / 0.05, true);
			addAnimation("fall", [12, 13], 1.0 / 0.05, true);
			
			width = 16;
			height = 24;
			offset.x = 8;
			offset.y = 16;
			
			flames = new Flames(0, 0, null);
			flames.exists = false;
			jet = new Flames(0, 0, null);
			jet.loadGraphic(GameAssets.FlameImage, true, true, 40, 32);
			
			if (myIndex == 0)
			{
				jet.addAnimation("on", [0, 1, 2], 1.0 / 0.05, false);
			}
			else
			{
				jet.addAnimation("on", [3, 4, 5], 1.0 / 0.05, false);
			}
			
			createParticles();
			 
		}
		
		public function createParticles() : void
		{
			var particles:int = 20;			
			flameEmitter = new FlxEmitter(0, 0, particles); //x and y of the emitter

			 
			for(var i:int = 0; i < particles; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.loadGraphic(GameAssets.FlameParticles, false, false, 16, 16);
				
				if (index == 0)
				{
					particle.addAnimation("go", [0, 1, 2, 3], 1.0 / 0.05, true);
				}
				else
				{
					particle.addAnimation("go", [4, 5, 6, 7], 1.0 / 0.05, true);
				}
				particle.play("go");
				particle.exists = false;
				particle.friction = 100;
				particle.lifespan = 0.15;
				particle.onEmit.apply(onEmit);
				
				flameEmitter.add(particle);
			}
			
			flameEmitter.lifespan = 0.15;
			
			flameEmitter.particleDrag = new FlxPoint(100, 100);
			flameEmitter.minParticleSpeed = new FlxPoint( -1, 50);
			flameEmitter.maxParticleSpeed = new FlxPoint(1, 150);
			flameEmitter.gravity = 500;
			flameEmitter.maxRotation = 0.0;
			flameEmitter.minRotation = 0.0;
			
			flameEmitter.bounce = 0;
			
			
			flameEmitter.start(false, 0.15, 0.01, 10);
		}
		
		public static function onEmit(particle:FlxParticle) : void
		{
			particle.play("go", true);
			particle.lifespan = 0.15;
		}
		
		
		public function flameOn(tiles:Map) : void
		{
			jet.exists = true;
			jet.play("on", true);
			jet.timer = 0;
			flameEmitter.on = true;
			flames.exists = true;
			flames.play("whoosh", true);
			flames.timer = 0;
			flames.facing = facing;
			var tileX:int = (x + frameWidth / 2) / tiles.tileWidth;
			if(tileX < tiles.widthInTiles && tileX > 0)
			for (var dy:Number = y; dy < FlxG.worldBounds.height; dy += tiles.tileHeight / 2)
			{
				var tileY:int = dy / tiles.tileHeight;
				
				if(tileY >= tiles.heightInTiles) break;
				
				var tile:uint = tiles.getTile(tileX, tileY);
				
				if (tile > 1)
				{
					flames.y = (Math.round(dy / tiles.tileHeight) - 1) * tiles.tileHeight + tiles.tileHeight - 32; 
					var a:Number =  1.0 - Math.abs(flames.y - y) / 150.0;
					flames.alpha = a;
					if (a < 0.25)
					{
						flames.exists = false;
						flames.y = 4096;
					}
					
					flames.x = x;
					return;
				}
				
			}
			
			flames.y = 4096;
			
		}
		
		public function flameOff() : void
		{
			flameEmitter.on = false;
		}
		
		
		public override function postUpdate() : void
		{
			super.postUpdate();
			flameEmitter.x = x + 8;
			flameEmitter.y = y + 30;
			jet.x = x - 12;
			jet.y = y + 16;
			jet.facing = facing;
		}
		
		public static function initButtons() : void
		{
				buttons = new Array(
									new Array("W", "A", "S", "D", "SPACE"),
									new Array("UP", "LEFT", "DOWN", "RIGHT", "SHIFT")
									);
		}
		
		public function isKeyPressed(button:int):Boolean
		{
			return FlxG.keys[buttons[index][button]];
		}
		
		public function keyJustPressed(button:int):Boolean
		{
			return FlxG.keys.justPressed(buttons[index][button]);
		}
	}

}