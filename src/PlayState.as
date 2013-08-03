package  
{
	import flash.geom.Point;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class PlayState extends FlxState
	{
		public var level:FlxTilemap;
		public var levelArray:Array;
		private var levelSize:int;
		public var player:FlxSprite;
		
		
		
		public var victims:FlxGroup;
		
		
		
		
		override public function create():void
		{
			FlxG.bgColor = 0xffffffff;
			
			levelSize = 40 * 40;
			levelArray = new Array(levelSize);
			
			
			for (var i:int = 0; i < levelSize; i++) 
			{
				if (Math.random() <= 0.5)
				{
					levelArray[i] = Math.round(Math.random());
				}
				else
				{
					levelArray[i] = 0;
				}
			}
			
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.arrayToCSV(levelArray,40), FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
			add(level);
			
			player = new Player(FlxG.width / 2 - 5, 0);
			add(player);
			
			victims = new FlxGroup
			for (var j:int = 0; j < 5; j++) 
			{
				victims.add(new Victim(j * 6, j * 6));
			}
			
			add(victims);
		}
			
		override public function update():void
		{
			
			/*if (player.getSpookState() == true)
			{
				
			}*/
			
			FlxG.collide(level, player);
			super.update();
		}
		
		
	}


}