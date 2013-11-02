package  
{
	import flash.geom.Point;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Person extends FlxGroup
	{
		private var isAlive:Boolean = true;
		protected var position:Point;
		protected var velocity:FlxPoint = new FlxPoint(0, 0);
		protected var state:String = "Idle";
		
		protected var body:FlxSprite;
		protected var head:FlxSprite;
		
		public function Person(X:int, Y:int) 
		{
			//use this?
			super();
			
			position = new Point(X, Y);
			
		}
		
		override public function update():void 
		{
			position.x = body.x;
			position.y = body.y;
			
			
			if (velocity.x > 0)
			{
				head.facing = FlxObject.LEFT;
				body.facing = FlxObject.LEFT;
			}
			else if (velocity.x < 0)
			{
				head.facing = FlxObject.RIGHT;
				body.facing = FlxObject.RIGHT;
			}
			
			super.update();
		}
		
	}

}