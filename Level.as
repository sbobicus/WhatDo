package 
{	
	import org.flixel.*;
	import Map;
	import Player;
	import org.flixel.FlxState;
	
	public class Level extends FlxState 
	{
		public var map:Map;
		public var currentPlayer:Player;
		public var player1:Player;
		public var player2:Player;
		
		public var score:FlxText;
		public var status:FlxText;
		
		public var time:Number = 0.0;
		public var switchTime:Number = 1.0;
		
		public var multiplayer:Boolean = false;
		
		
		public function Level()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			//Set the background color to light gray (0xAARRGGBB)
			FlxG.bgColor = 0xffaaaaaa;
			
			//Design your platformer map with 1s and 0s (at 40x30 to fill 320x240 screen)
			var data:Array = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
			
			//Create a new tilemap using our map data
			map = new Map();
			map.loadLevel();
			add(map);
			
			//Create the map exit, a dark gray box that is hidden at first
			map.createExit(35, 25);
			add(map.exit);
			
			//Create coins to collect (see createCoin() function below for more info)
			
			//Top left coins
			map.createCoin(18,4);
			map.createCoin(12,4);
			map.createCoin(9,4);
			map.createCoin(8,11);
			map.createCoin(1,7);
			map.createCoin(3,4);
			map.createCoin(5,2);
			map.createCoin(15,11);
			map.createCoin(16,11);
			
			//Bottom left coins
			//map.createCoin(3,16);
			//map.createCoin(4,16);
			//map.createCoin(1,23);
			//map.createCoin(2,23);
			//map.createCoin(3,23);
			//map.createCoin(4,23);
			//map.createCoin(5,23);
			//map.createCoin(12,26);
			//map.createCoin(13,26);
			//map.createCoin(17,20);
			//map.createCoin(18,20);
			
			//Top right coins
			//map.createCoin(21,4);
			//map.createCoin(26,2);
			//map.createCoin(29,2);
			//map.createCoin(31,5);
			//map.createCoin(34,5);
			//map.createCoin(36,8);
			//map.createCoin(33,11);
			//map.createCoin(31,11);
			//map.createCoin(29,11);
			//map.createCoin(27,11);
			//map.createCoin(25,11);
			//map.createCoin(36,14);
			
			//Bottom right coins
			//map.createCoin(38,17);
			//map.createCoin(33,17);
			//map.createCoin(28,19);
			//map.createCoin(25,20);
			//map.createCoin(18,26);
			//map.createCoin(22,26);
			//map.createCoin(26,26);
			//map.createCoin(30,26);

			add(map.coins);
			
			//Create currentPlayer (a red box)
			Player.initButtons();
			player1 = createPlayer(0, GameAssets.Player1Image);
			player2 = createPlayer(1, GameAssets.Player1Image);
			add(player2);
			
			currentPlayer = player2;
			switchPlayers();
			
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
		}
		
		public function createPlayer(index:int, graphic:Class) : Player
		{
			var player = new Player(index, FlxG.width/2 - 5, 0, graphic);
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
				remove(player1);
				currentPlayer = player2;
				
				add(currentPlayer);
			}
			else
			{
				player1.x = player2.x;
				player1.y = player2.y;
				remove(player2);
				currentPlayer = player1;
				add(currentPlayer);
			}
			
			FlxG.shake(0.001, 0.25);
		}
		
		override public function update():void
		{
			time += FlxG.elapsed;
			score.text = "" + time;
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
			FlxG.overlap(map.exit, currentPlayer, win);
			
			//Finally, bump the currentPlayer up against the map
			FlxG.collide(map, currentPlayer);
			
			//Check for currentPlayer lose conditions
			if(currentPlayer.y > FlxG.height)
			{
				FlxG.score = 1; //sets status.text to "Aww, you died!"
				FlxG.resetState();
			}
		}
		
		//Called whenever the currentPlayer touches a coin
		public function getCoin(Coin:FlxSprite,Player:FlxSprite):void
		{
			Coin.kill();
			score.text = "SCORE: "+(map.coins.countDead()*100);
			if(map.coins.countLiving() == 0)
			{
				status.text = "Find the exit.";
				map.exit.exists = true;
			}
		}
		
		//Called whenever the currentPlayer touches the exit
		public function win(Exit:FlxSprite,Player:FlxSprite):void
		{
			status.text = "Yay, you won!";
			score.text = "SCORE: 5000";
			Player.kill();
			WhatDo.nextLevel();
		}
	}

}
