package
{
	public class GameAssets
	{
		[Embed(source="./assets/test.png")]
		public static var LevelImage:Class;
		
		[Embed(source="./assets/tiles.png")]
		public static var TileMap:Class;
		
		[Embed(source="./assets/suit.png")]
		public static var Player1Image:Class;
		
		[Embed(source="./assets/skyline.png")]
		public static var Level1:Class;
				
		[Embed(source="./assets/punk.png")]
		public static var Player2Image:Class;
		
		[Embed(source="./assets/pickup.png")]
		public static var Coins:Class;
		
		[Embed(source="./assets/item_tiles.png")]
		public static var ItemTiles:Class;
		
		[Embed(source="./assets/groundwhoosh.png")]
		public static var GroundWhoosh:Class;
		
		[Embed(source="./assets/testmap.txt", mimeType="application/octet-stream")]
		public static var TestMap:Class;
		
		[Embed(source="./assets/testmap_items.txt", mimeType="application/octet-stream")]
		public static var TestMapItems:Class;
		
		
	}
} 
