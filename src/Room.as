package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	
	 
	 /**
	  * Tileset map
	  * 0: null
	  * 1: wall
	  * 2: wall (2)
	  * 3: floor
	  */
	public class Room 
	{
		[Embed(source = "../data/tile1.png")] public static var tileImage:Class;
		private var roomArray:Array;	// Array med tiles för golv och väggar
		public var tilemap:FlxTilemap;
		private var width:int;
		private var height:int;
		public function Room(Type:String, Width:int, Height:int) 
		{
			this.width = Width;
			this.height = Height;
			roomArray = new Array(this.width * (this.height + 2));	// height + 4 = golvets djup + väggen (som alltid är lika hög) + 
			for (var i:int = 0; i < roomArray.length; i++) 
			{
				if (i < this.width * 2)
				{
					if (Math.random() < 0.1)
					{
						roomArray[i] = 2;
					}
					else roomArray[i] = 1;
				}
				else roomArray[i] = 3;
			}			
			tilemap = new FlxTilemap();
			tilemap.loadMap(FlxTilemap.arrayToCSV(roomArray, this.width), tileImage, 16, 16);
			tilemap.setTileProperties(3, FlxObject.NONE);
		}
		

	}
}