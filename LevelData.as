package 
{
	/**
	 * ...
	 * @author mklingen
	 */
	public class LevelData 
	{
		public static const TYPE_BITMAP:int = 0;
		public static const TYPE_CSV:int = 1;
		
		public var type:int;
		public var asset:Class;
		
		public function LevelData(myAsset:Class, myType:int) 
		{
			asset = myAsset;
			type = myType;
		}
		
	}

}