package
{
	import flash.geom.Point;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends FlxGroup
	{
		private static var _walkSpeed:int = 50;
		private static var _runSpeed:int = 100;
		public var position:Point;
		private var velocity:FlxPoint = new FlxPoint(0, 0);
		private var state:String = "Idle";
		private var direction:Number = 0;
		public var yPos:int = 0;
		
		private var body:FlxSprite;
		private var head:FlxSprite;
		
		public function Enemy(X:int, Y:int) 
		{
			/*
			head = new FlxSprite(position.x - 9, position.y - 26);
			body = new FlxSprite(position.x, position.y);
			body.loadGraphic(victimSprites, false, true, 14, 11);
			body.addAnimation("Walk", [1, 2], 10, true);
			body.addAnimation("Idle", [0], 10, true);
			head.loadGraphic(headSprites, false, true, 22, 27);
			head.allowCollisions = FlxObject.NONE;
			add(head);
			add(body);
			*/
		}
		
		override public function update():void 
		{
			position.x = body.x;
			position.y = body.y;
			yPos = position.y;
			
			head.x = body.x - 9;
			head.y = body.y - 26;
			head.velocity = velocity;
			body.velocity = velocity;
			
			super.update();
		}
		
	}

}