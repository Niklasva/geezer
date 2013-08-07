package  
{
	import flash.geom.Point;
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		private static var _runSpeed:int = 100;
		private var spookState:Boolean = false;
		private var position:Point;

		public function Player(X:int, Y:int) 
		{
			//set the initial position of the sprite
			super(X, Y);
			position = new Point(X, Y);
			
			//replace with loadGraphic(..., ..., ...,);
			makeGraphic(8, 8, 0xff0ff0ff);
		}
		
		public function getSpookState():Boolean 
		{
			return spookState;
		}
		
		public function getPosition():Point
		{
			return position;
		}
		
		override public function update():void 
		{
			position.x = x;
			position.y = y;
			
			velocity = new FlxPoint(0, 0);
			
			if (FlxG.keys.LEFT)
			{
				velocity.x = -_runSpeed;
			}
			else if (FlxG.keys.RIGHT)
			{
				velocity.x = _runSpeed;
			}
			
			if (FlxG.keys.UP)
			{
				velocity.y = -_runSpeed;
			}
			else if (FlxG.keys.DOWN)
			{
				velocity.y = _runSpeed;
			}
			
			if (FlxG.keys.Z)
			{
				spook();
			}
		}
		
		private function spook():void 
		{
			spookState = true;
			makeGraphic(8, 8, 0xffaa1111);
		}
	}

}