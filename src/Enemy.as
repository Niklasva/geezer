package
{
	import flash.geom.Point;
	import org.flixel.*;
	
	public class Enemy extends FlxGroup
	{
		[Embed(source="../data/victimSprites.png")]
		public var victimSprites:Class;
		[Embed(source="../data/headSprites.png")]
		public var headSprites:Class;
		private static var _walkSpeed:int = 25;
		private static var _runSpeed:int = 80;
		
		private var spooked:Boolean;
		private var isAlive:Boolean = true;
		public var position:Point;
		private var velocity:FlxPoint = new FlxPoint(0, 0);
		private var counter:Number = 0;
		private var state:String = "Idle";
		private var direction:Number = 0;
		public var yPos:int = 0;
		
		private var body:FlxSprite;
		private var head:FlxSprite;
		
		//private var path:FlxPath;
		private var playerPos:Point;
		private var player:Player;
		
		public function Enemy(X:int, Y:int, thePlayer:Player)
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
			player = thePlayer;
		}
		
		override public function update():void
		{
			playerPos = player.getPosition();
			position.x = body.x;
			position.y = body.y;
			yPos = position.y;
			counter += FlxG.elapsed;
			head.x = body.x - 9;
			head.y = body.y - 26;
			velocity = head.velocity;
			
			
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
			
			if (nearPlayer())
			{
				head.maxVelocity.x = _runSpeed;
				body.maxVelocity.x = _runSpeed;
				head.maxVelocity.y = _runSpeed;
				body.maxVelocity.y = _runSpeed;
				//velocity.x = 0;
				//velocity.y = 0;
				body.play("Walk");
				if (playerPos.x < position.x)
				{
					//go left
					//velocity.x = -_runSpeed;
					head.acceleration.x = -_runSpeed*4;
					body.acceleration.x = -_runSpeed*4;
				}
				if (playerPos.x > position.x)
				{
					//go right
					//velocity.x = _runSpeed;
					head.acceleration.x = _runSpeed*4;
					body.acceleration.x = _runSpeed*4;
				}
				if (playerPos.y < position.y)
				{
					//go down
					//velocity.y = -_runSpeed;
					head.acceleration.y = -_runSpeed*4;
					body.acceleration.y = -_runSpeed*4;
				}
				if (playerPos.y > position.y)
				{
					//go up
					//velocity.y = _runSpeed;
					head.acceleration.y = _runSpeed*4;
					body.acceleration.y = _runSpeed*4;
				}
				
				state = "Run";
			}
			
			else
			{
				
				head.maxVelocity.x = _walkSpeed;
				body.maxVelocity.x = _walkSpeed;
				head.maxVelocity.y = _walkSpeed;
				body.maxVelocity.y = _walkSpeed;
				
				
				head.acceleration.x = 0;
				head.acceleration.y = 0;
				body.acceleration.x = 0;
				body.acceleration.x = 0;
				
				if (counter >= Math.random() * 5)
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
			}
			
			if (state == "Walk")
			{
				body.play("Walk");
				if (0.20 < direction < 0.6)
				{
					head.velocity.x = _walkSpeed;
					body.velocity.x = _walkSpeed;
				}
				else if (direction < 0.30)
				{
					head.velocity.x = -_walkSpeed;
					body.velocity.x = -_walkSpeed;
				}
				else if (0.5 < direction < 0.75)
				{
					head.velocity.y = -_walkSpeed;
					body.velocity.y = -_walkSpeed;
				}
				else
				{
					head.velocity.y = _walkSpeed;
					body.velocity.y = _walkSpeed;
				}
			}
			else if (state == "Idle")
			{
				head.acceleration.x = 0;
				head.acceleration.y = 0;
				body.acceleration.x = 0;
				body.acceleration.y = 0;
				body.play("Idle");
				velocity = new FlxPoint(0, 0);
				head.velocity.x = 0;
				head.velocity.y = 0;
				body.velocity.x = 0;
				body.velocity.y = 0;

			}
			
			super.update();
		}
		
		private function getDistance(P1:Point, P2:Point):Number
		{
			var XX:Number = P2.x - P1.x;
			var YY:Number = P2.y - P1.y;
			return Math.sqrt(XX * XX + YY * YY);
		}
		
		private function nearPlayer():Boolean
		{
			return getDistance(position, playerPos) < 100;
		}
	}

}