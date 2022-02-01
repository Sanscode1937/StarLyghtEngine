package;

#if desktop
import Discord.DiscordClient;
#end
import animate.FlxAnimate;
import flixel.FlxState;
import flixel.FlxG;
import flixel.addons.display.FlxGridOverlay;
import flixel.text.FlxText;
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
		DiscordClient.changePresence("On Tankman cutscene animation test", null);
		#end
		var tightBars:FlxSprite;
		tightBars = new FlxSprite(100,134);
		tightBars.frames = AtlasFrameMakerGPU.construct('assets/images/cutsceneStuff/tightBars');
		tightBars.animation.addByPrefix('idle', "tightBars", 30);	
		tightBars.animation.play('idle');	
		tightBars.antialiasing = true;
		add(tightBars);																					
	}

	private function numArr(min,max):Array<Int>
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