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
 
			//Create player (a red box)
			player = new FlxSprite(FlxG.width/2 - 5);
			player.makeGraphic(8,8,0xff0ff0ff);
			add(player);
		}
			
		override public function update():void
		{
			player.velocity = new FlxPoint(0,0);
			if (FlxG.keys.LEFT)
			{
				player.velocity.x = -100;
			}
			else if (FlxG.keys.RIGHT)
			{
				player.velocity.x = 100;
			}
			
			if (FlxG.keys.UP)
			{
				player.velocity.y = -100;
			}
			else if (FlxG.keys.DOWN)
			{
				player.velocity.y = 100;
			}
			
			super.update();
	
			FlxG.collide(level,player);
		}
		
	}


}