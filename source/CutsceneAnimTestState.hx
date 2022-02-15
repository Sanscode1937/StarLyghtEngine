package;

#if desktop
import Discord.DiscordClient;
#end
import animate.FlxAnimate;
import flixel.FlxState;
import flixel.FlxG;
import flixel.addons.display.FlxGridOverlay;
import flixel.text.FlxText;
import animateAtlasPlayer.core.Animation;
import animateAtlasPlayer.assets.AssetManager;
import flixel.animation.FlxAnimationController;
import Song.SwagSong;
import flixel.FlxSprite;
import flixel.FlxObject;
import shaderslmfao.BuildingShaders;
import shaderslmfao.ColorSwap;
import openfl.display.BlendMode;

using StringTools;

class CutsceneAnimTestState extends FlxState
{
	var controls:Controls;
	var curSelected:Int = 0;
	var debugTxt:FlxText;
	var swagShader:ColorSwap;
	var alphaShader:BuildingShaders;
	var paused:Bool = false;
	private var opponent:Character;
	public static var SONG:SwagSong;

	override public function create()
	{

		swagShader = new ColorSwap();
		alphaShader = new BuildingShaders();

		var a = FlxGridOverlay.create(10, 10);
		a.scrollFactor.set(.5, .5);
		add(a);
		debugTxt = new FlxText(900, 20, 0, "", 20);
		debugTxt.color = 0xFF0000FF;
		add(debugTxt);
		var basedX:Int = 100;
		var basedY:Int = 134;
		#if desktop
		DiscordClient.changePresence("EasterEgg", null);
		#end		
		// var assets:AssetManager = new AssetManager();
		// // target the folder that contains the Animation.json, spritemap.json and spritemap.png
		// assets.enqueue("assets/images/tightBars"); 
		// assets.loadQueue(start);
		

		
            var prototypeTest:FlxSprite;
            prototypeTest = new FlxSprite(100,134);
            prototypeTest.frames = AtlasFrameMakerGPU.construct('assets/images/cutsceneStuff/tightBars');
            prototypeTest.animation.add("tightBars", numArr(1,324), 30, false);
            prototypeTest.antialiasing = true;
			add(prototypeTest);
			prototypeTest.animation.play('tightBars');
			
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
				
				if (FlxG.mouse.justPressed)
					{
						FlxG.switchState(new MainMenuState());
					}
					if (FlxG.mouse.wheel != 0)
						{
							// Mouse wheel logic goes here, for example zooming in / out: so >:))))))))))))))))
							FlxG.camera.zoom += (FlxG.mouse.wheel / 10);
						}	

	}

	// private function start(assetsMgr:AssetManager):Void {
	
	// 	var tankTest:Animation = assetsMgr.createAnimation("TANK TALK 2");
	// 	add(tankTest);
	// }

	public function numArr(min,max):Array<Int>
	{	
		var a = [];
		var l = max - min;
		var p = min;
		for (i in 0...l){
			a.push(p);
			p++;
		}
		trace(a);
		return a;
	}
	
}