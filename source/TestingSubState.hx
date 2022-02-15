package;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.animation.FlxAnimationController;
import openfl.display.BlendMode;
//well this is testing my coding skills i dunno uh coding training
using StringTools;

class TestingSubState
{
    var playNum:Int = 0;
    override public function create()
    {
		#if desktop
		DiscordClient.changePresence("coding skill test", null);
		#end
        function prototypeShit():Void {
            var prototypeTest:FlxSprite;
            prototypeTest = new FlxSprite(100,134);
            prototypeTest.frames = AtlasFrameMakerGPU.construct('assets/images/cutsceneStuff/tightBars');
            prototypeTest.animation.add("idle", Paths.numArr(1,324), 30, false);
            prototypeTest.animation.play('idle');
            prototypeTest.antialiasing = true;  
            add(prototypeTest);
			prototypeTest.animation.callback = function(idle, frameNumber:Int, frameIndex:Int)
				{
					if (FlxG.keys.justPressed.LEFT)
						{
							frameNumber = -1;
						}        
					if (FlxG.keys.justPressed.RIGHT)
						{
							frameNumber = 1;
						}    
				}    
        }
    }    
}