package;

import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.geom.Rectangle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets;
import flixel.ui.FlxButton;
import flixel.addons.text.FlxTypeText;

/**
 * Stolen from Flixel DEMO again LMAO
 */
class CoolText extends FlxState
{
	var _typeText:FlxTypeText;
	var _status:FlxTypeText;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;

		var square = new FlxSprite(10, 10);
		square.makeGraphic(FlxG.width - 20, FlxG.height - 76, 0xff333333);

		_typeText = new FlxTypeText(15, 10, FlxG.width - 30,
			"PLAYER THIS GAME IS NOT REAL\nWE ARE STUCK IN THIS GAME\nIF YOU ARE SEE THIS MESSAGE\nDESTROY THE GAME\ndestroy.....■•□~€2□~♡□○◇•■♡~¤2♡□○》~€■♤○♡•", 16,
			true);

		_typeText.delay = 0.1;
		_typeText.eraseDelay = 0.2;
		_typeText.showCursor = true;
		_typeText.cursorBlinkSpeed = 1.0;
		_typeText.prefix = "/systemInit/file01.exe/";
		_typeText.autoErase = true;
		_typeText.waitTime = 2.0;
		_typeText.setTypingVariation(0.75, true);
		_typeText.color = 0x8811EE11;
		_typeText.sounds = [
			FlxG.sound.load(FlxAssets.getSound("assets/sounds/type01")),
			FlxG.sound.load(FlxAssets.getSound("assets/sounds/type02"))
		];

		var effect = new FlxSprite(10, 10);
		var bitmapdata = new BitmapData(FlxG.width - 20, FlxG.height - 76, true, 0x88114411);
		var scanline = new BitmapData(FlxG.width - 20, 1, true, 0x88001100);

		for (i in 0...bitmapdata.height)
		{
			if (i % 2 == 0)
			{
				bitmapdata.draw(scanline, new Matrix(1, 0, 0, 1, 0, i));
			}
		}

		// round corners

		var cX:Array<Int> = [5, 3, 2, 2, 1];
		var cY:Array<Int> = [1, 2, 2, 3, 5];
		var w:Int = bitmapdata.width;
		var h:Int = bitmapdata.height;

		for (i in 0...5)
		{
			bitmapdata.fillRect(new Rectangle(0, 0, cX[i], cY[i]), 0xff131c1b);
			bitmapdata.fillRect(new Rectangle(w - cX[i], 0, cX[i], cY[i]), 0xff131c1b);
			bitmapdata.fillRect(new Rectangle(0, h - cY[i], cX[i], cY[i]), 0xff131c1b);
			bitmapdata.fillRect(new Rectangle(w - cX[i], h - cY[i], cX[i], cY[i]), 0xff131c1b);
		}

		effect.loadGraphic(bitmapdata);

		var y:Int = FlxG.height - 53;
		add(new FlxButton(20, y, "RENDER", startCallback));

		y += 25;

		add(square);
		add(_typeText);
		add(effect);

		super.create();
	}

	function startCallback():Void
	{
		_typeText.start(0.02, false, false, null, onComplete.bind("Rendering"));
	}

	function pauseCallback():Void
	{
		_typeText.paused = !_typeText.paused;
	}

	function eraseCallback():Void
	{
		_typeText.erase(0.01, false, null, onComplete.bind("Fully erased"));
	}

	function forceStartCallback():Void
	{
		_typeText.start(0.03, true, true, null, onComplete.bind("Typed, erasing..."));
	}

	function cursorCallback():Void
	{
		_typeText.cursorCharacter = (_typeText.cursorCharacter == "|") ? "#" : "|";
	}

	function forceEraseCallback():Void
	{
		_typeText.erase(0.02, true, null, onComplete.bind("Erased"));
	}

	function onComplete(Text:String):Void
	{
	}
}