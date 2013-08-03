package
{
	import org.flixel.*;
	[SWF(width="640", height="360", backgroundColor="#000000")]
 
	public class Main extends FlxGame
	{
		public function Main()
		{
			super(320, 180, PlayState, 2, 60, 60);
		}
	}
}