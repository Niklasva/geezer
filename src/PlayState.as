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
		private var levelSize:int;
		public var player:FlxSprite;
		public var victims:FlxGroup;
		
		
		
		
		override public function create():void
		{
			FlxG.bgColor = 0xffffffff;
			
			
			var room:Room = new Room("Test", 100,40);
			level = room.tilemap;
			add(level);
			
			player = new Player(100,100);
			add(player);
			
			victims = new FlxGroup
			for (var j:int = 0; j < 5; j++) 
			{
				victims.add(new Victim(j * 6 + 50, j * 6 + 100));
			}
			add(victims);
			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN_TIGHT);
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
		}
			
		override public function update():void
		{

			/*if (player.getSpookState() == true)
			{
				
			}*/
			
			FlxG.collide(level, player);
			FlxG.collide(player, victims);
			super.update();
		}
		
		
	}


}