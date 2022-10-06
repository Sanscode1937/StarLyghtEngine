package;

import flxanimate.FlxAnimate;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.FlxG;

class CutsceneAnimTestState extends FlxState
{
	var fromAnimate:FlxAnimate;

	override public function create()
	{
		FlxG.sound.music.stop();

		var bg = FlxGridOverlay.create(10, 10, FlxG.width * 4, FlxG.height * 4);
		bg.scrollFactor.set(0.5, 0.5);
		bg.screenCenter();
		add(bg);

		fromAnimate = new FlxAnimate(0, 0, 'assets/images/skewTest');
		fromAnimate.antialiasing = true;
		// fromAnimate.playAnim('');
		add(fromAnimate);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		// if(FlxG.keys.pressed.LEFT)
		// {
		// 	char.framerate -= 1;
		// }
		// if(FlxG.keys.pressed.RIGHT)
		// {
		// 	char.framerate += 1;
		// }				

		if (FlxG.keys.justPressed.SPACE)
		{
			if (!fromAnimate.anim.isPlaying)
				fromAnimate.anim.play();
			else
				fromAnimate.anim.pause();
		}

		fromAnimate.x = 540;
		fromAnimate.y = 440;

		if (FlxG.keys.justPressed.E)
			FlxG.camera.zoom += 0.25;
		if (FlxG.keys.justPressed.Q)
			FlxG.camera.zoom -= 0.25;

		super.update(elapsed);
	}
}