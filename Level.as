package 
{	
	import Map;
	
	import Player;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class Level extends FlxState 
	{
		public var map:Map;
		public var currentPlayer:Player;
		public var player1:Player;
		public var player2:Player;
		
		public var score:FlxText;
		public var status:FlxText;
		
		public var time:Number = 0.0;
		public var switchTime:Number = 1000.0;
		
		public var multiplayer:Boolean = false;
		
		public var backgroundSprite:FlxSprite;
		public var shouldLose:Boolean = false;
		public function Level()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			//Set the background color to light gray (0xAARRGGBB)
			FlxG.bgColor = 0xFF666666;
			
			backgroundSprite = new FlxSprite(0, 0);
			shouldLose = false;
			
			//Create a new tilemap using our map data
			map = new Map(new LevelData(GameAssets.Skyscraper1, LevelData.TYPE_BITMAP), new LevelData(GameAssets.EmptyMapItems, LevelData.TYPE_CSV));
			FlxG.camera.follow(currentPlayer, FlxCamera.STYLE_LOCKON);
			map.loadLevel();
			//var x:uint = map.getBounds().left;
			//var y:uint = map.getBounds().top;
			//var a:uint = map.getBounds().right;
			//var b:uint = map.getBounds().bottom;
			//FlxG.camera.setBounds(x,y,a,b,true);
			map.spawn = new FlxObject(map.getBounds().width - 128, map.getBounds().height - 96);
			backgroundSprite.makeGraphic(map.getBounds().width, map.getBounds().height, 0xff33CCFF);
			add(backgroundSprite);
			add(map);
			add(map.exit);
			add(map.spawn);
			add(map.coins);
			add(map.enemies);

			//Create currentPlayer (a red box)
			Player.initButtons();
			player1 = createPlayer(0, GameAssets.Player1Image);
			player2 = createPlayer(1, GameAssets.Player2Image);
			add(player2.jet);
			add(player2);
			add(player2.flames);
			Player.createParticles();
			add(Player.flameEmitter);
						
			currentPlayer = player2;
			switchPlayers();
			FlxG.camera.follow(currentPlayer, FlxCamera.STYLE_LOCKON);
			
			score = new FlxText(2,2,80);
			score.shadow = 0xff000000;
			score.text = "SCORE: "+(map.coins.countDead()*100);
			add(score);
			
			status = new FlxText(FlxG.width-160-2,2,160);
			status.shadow = 0xff000000;
			status.alignment = "right";
			switch(FlxG.score)
			{
				case 0: status.text = "Collect coins."; break;
				case 1: status.text = "Aww, you died!"; break;
			}
			add(status);
			add(map.enemies);
		}
		
		public function createPlayer(index:int, graphic:Class) : Player
		{
			var player:Player = new Player(index, map.spawn.x, map.spawn.y, graphic);
			player.maxVelocity.x = 150;
			player.maxVelocity.y = 250;
			player.acceleration.y = 300;
			player.drag.x = player.maxVelocity.x * 4;
			return player;
		}
		
		public function switchPlayers():void 
		{
			if (!multiplayer) return;
			
			if (currentPlayer == player1)
			{
				player2.x = player1.x;
				player2.y = player1.y;
				player2.velocity.x = player1.velocity.x;
				player2.velocity.y = player1.velocity.y;
				player2.acceleration.x = player1.acceleration.x;
				player2.acceleration.y = player1.acceleration.y;
				player2.facing = player1.facing;
				player2.flames.x = player1.flames.x;
				player2.flames.y = player1.flames.y;
				remove(player1.jet);
				remove(player1);
				remove(currentPlayer.flames);
				currentPlayer = player2;
				
				add(currentPlayer.jet);
				add(currentPlayer);
				add(currentPlayer.flames);
			}
			else
			{
				player1.x = player2.x;
				player1.y = player2.y;
				player1.velocity.x = player2.velocity.x;
				player1.velocity.y = player2.velocity.y;
				player1.acceleration.x = player2.acceleration.x;
				player1.acceleration.y = player2.acceleration.y;
				player1.facing = player2.facing;
				player1.flames.x = player2.flames.x;
				player1.flames.y = player2.flames.y;
				remove(player2.jet);
				remove(player2);
				remove(currentPlayer.flames);
				currentPlayer = player1;
				
				add(currentPlayer.jet);
				add(currentPlayer);
				add(currentPlayer.flames);
			}
			
			FlxG.shake(0.001, 0.25);
			//FlxG.flash(0x55ffffff, 0.2);
		}
		
		
		override public function update():void
		{
			if (shouldLose)
			{
				FlxG.resetState();
			}
			time += FlxG.elapsed;
			score.text = "" + currentPlayer.flames.y;
			if (time > switchTime)
			{
				switchPlayers();
				time = 0;
			}
			
			//Player movement and controls
			currentPlayer.acceleration.x = 0;
		
			if (currentPlayer.isKeyPressed(Player.KEY_LEFT))
			{
				currentPlayer.facing = FlxObject.LEFT;
				currentPlayer.acceleration.x = -currentPlayer.maxVelocity.x * 4;
			}
			if (currentPlayer.isKeyPressed(Player.KEY_RIGHT))
			{
				currentPlayer.facing = FlxObject.RIGHT;
				currentPlayer.acceleration.x = currentPlayer.maxVelocity.x * 4;
			}
			if (currentPlayer.keyJustPressed(Player.KEY_JUMP))
			{
				currentPlayer.velocity.y = -currentPlayer.maxVelocity.y / 2;
				currentPlayer.flameOn(map);
			}
			else 
			{
				currentPlayer.flameOff();
			}
			
			
			if (currentPlayer.isTouching(FlxObject.FLOOR))
			{
				if (Math.abs(currentPlayer.velocity.x) > 0.1)
				{
					currentPlayer.play("run");
				}
				else
				{
					currentPlayer.play("idle");
				}
			}
			else
			{
				if (currentPlayer.velocity.y < 0)
				{
					currentPlayer.play("jump");
				}
				else
				{
					currentPlayer.play("fall");
				}
			}
		
			
			//Updates all the objects appropriately
			super.update();

			//Check if currentPlayer collected a coin or coins this frame
			FlxG.overlap(map.coins, currentPlayer, getCoin);
			
			//Check to see if the currentPlayer touched the exit door this frame
			//FlxG.overlap(map.exit, currentPlayer, win);
			
			//Finally, bump the currentPlayer up against the map
			FlxG.collide(map, currentPlayer);
			FlxG.collide(map, Player.flameEmitter);
			
			FlxG.collide(map, map.enemies);
			
			if (FlxG.overlap(map.enemies, currentPlayer))
			{
				FlxG.score = 1;
				FlxG.shake(0.05);
				FlxG.flash();
				shouldLose = true;
			}
			
			
			if (currentPlayer.flames.exists)
			{
				FlxG.overlap(currentPlayer.flames, map.enemies, FlamesHitEnemy);
			}
			
			if(!FlxG.worldBounds.overlaps(new FlxRect(currentPlayer.x, currentPlayer.y, 1, 1)))
			{
				FlxG.score = 1; 
				FlxG.shake(0.05);
				FlxG.flash();
				shouldLose = true;
				
			}
			

		}
		
		private function FlamesHitEnemy(flames:FlxSprite, enemy:FlxSprite):void
		{
			enemy.exists = false;
		}
		
		//Called whenever the currentPlayer touches a coin
		public function getCoin(Coin:FlxSprite,Player:FlxSprite):void
		{
			Coin.kill();
			score.text = "SCORE: "+(map.coins.countDead()*100);
			if(map.coins.countLiving() == 0)
			{
				status.text = "Find the exit.";
				map.exit.play("open");
			}
		}
		
		//Called whenever the currentPlayer touches the exit
		public function win(Exit:FlxSprite,Player:FlxSprite):void
		{
			if(map.coins.countLiving() == 0)
			{
				status.text = "Yay, you won!";
				score.text = "SCORE: 5000";
				Player.kill();
				WhatDo.nextLevel();
			}
		}
	}

}
