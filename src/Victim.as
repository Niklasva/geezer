package  
{
	import org.flixel.*;
	
	public class Victim extends FlxSprite
	{
		private static var _walkSpeed:int = 25;
		private static var _runSpeed:int = 120;
		
		private var spooked:Boolean;
		private var isAlive:Boolean = true;
		
		public function Victim(X:int, Y:int) 
		{
			super(X, Y);
			
			//replace with loadGraphic(..., ..., ...,);
			makeGraphic(8, 8, 0xff0aa0aa);
		}
		
		override public function update():void 
		{
			
		}
	}

}