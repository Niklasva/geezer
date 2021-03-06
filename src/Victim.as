package  
{
	import flash.geom.Point;
	import org.flixel.*;
	
	public class Victim extends FlxGroup
	{
		[Embed(source = "../data/victimSprites.png")]public var victimSprites:Class;
		[Embed(source = "../data/headSprites.png")]public var headSprites:Class;
		private static var _walkSpeed:int = 25;
		private static var _runSpeed:int = 120;
		
		private var spooked:Boolean;
		private var isAlive:Boolean = true;
		public var position:Point;
		private var velocity:FlxPoint = new FlxPoint(0,0);
		private var counter:Number = 0;
		private var state:String = "Idle";
		private var direction:Number = 0;
		public var yPos:int = 0;
		
		private var body:FlxSprite;
		private var head:FlxSprite;
		
		public function Victim(X:int, Y:int) 
		{
			position = new Point(X, Y);
			head = new FlxSprite(position.x - 9, position.y - 26);
			body = new FlxSprite(position.x, position.y);
			body.loadGraphic(victimSprites, false, true, 14, 11);
			body.addAnimation("Walk", [1, 2], 10, true);
			body.addAnimation("Idle", [0], 10, true);
			head.loadGraphic(headSprites, false, true, 22, 27);
			head.allowCollisions = FlxObject.NONE;
			add(head);
			add(body);
		}
		
		override public function update():void 
		{
			
			position.x = body.x;
			position.y = body.y;
			yPos = position.y;
			counter += FlxG.elapsed;
			head.x = body.x - 9;
			head.y = body.y - 26;
			head.velocity = velocity;
			body.velocity = velocity;
			if (counter >= Math.random()* 5)
			{
				if (Math.random() < 0.1)
				{
					state = "Walk";
					direction = Math.random();
				}
				else
				state = "Idle";
				
				counter = 0;
			}
			if (state == "Walk")
			{
				body.play("Walk");
				if (0.20 < direction < 0.6)
				{
				velocity.x = _walkSpeed;
				}
				else if (direction < 0.30)
				{
					velocity.x = -_walkSpeed;
				}
				else if (0.5 < direction < 0.75)
				{
					velocity.y = -_walkSpeed;
				}
				else
				{
					velocity.y = _walkSpeed;
				}
			}
			else if (state == "Idle")
			{
				body.play("Idle");
				velocity.x = 0;
				velocity.y = 0;
			}
			
			if (velocity.x > 0)
			{
				head.facing = FlxObject.LEFT;
				body.facing = FlxObject.LEFT;
				head.offset.x = -10;
			}
			else if (velocity.x < 0)
			{
				head.facing = FlxObject.RIGHT;
				body.facing = FlxObject.RIGHT;
				head.offset.x = 0;
			}
			super.update();
		}

	}

}