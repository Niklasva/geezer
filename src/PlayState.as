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
		public var player:Player;
		public var enemies:FlxGroup;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffffffff;
			
			
			var room:Room = new Room("Test", 100,40);
			level = room.tilemap;
			add(level);
			
			player = new Player(100,100);
			add(player);
			
			enemies = new FlxGroup
			for (var j:int = 0; j < 4; j++) 
			{
				enemies.add(new Enemy(Math.random() * 400, 100 + Math.random() * 100, player));
			}
			add(enemies);
			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN_TIGHT);
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
		}
			
		override public function update():void
		{	
			enemies.sort("yPos");
			/*if (player.getSpookState() == true)
			{
				
			}*/
			
			FlxG.collide(level, player);
			FlxG.collide(player, enemies);
			FlxG.collide(enemies, enemies);
			super.update();
		}
		
		
	}


}