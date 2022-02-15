package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class MenuCharacter extends FlxSprite
{
	public var character:String;

	public function new(x:Float, character:String = 'bf')
	{
		super(x);

		this.character = character;

		var tex = Paths.getSparrowAtlas('campaign_menu_UI_characters');
		frames = tex;

		animation.addByPrefix('bf', "BF idle dance", 24);
		animation.addByPrefix('gf', "GF Dancing Beat", 24);
		animation.addByPrefix('dad', "Dad idle dance", 24);
		animation.addByPrefix('spooky', "spooky dance idle", 24);
		animation.addByPrefix('pico', "Pico Idle Dance", 24);
		animation.addByPrefix('mom', "Mom Idle", 24);
		animation.addByPrefix('parents-christmas', "Parent Christmas Idle", 24);
		animation.addByPrefix('senpai', "Senpai Idle", 24);
		animation.addByPrefix('tankman', "Tankman static", 24);
		// Parent Christmas Idle

		animation.play(character);
		updateHitbox();
	}
}
