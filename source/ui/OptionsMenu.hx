package ui;

import flixel.FlxGame;
import openfl.system.System;
import flixel.FlxG;

using StringTools;

class OptionsMenu extends Page
{
	var items:TextMenuList;
	var ps:PlayState;
	var state:Bool = false;
	var cs:ChartingState;
	var pomp:Prompt;
	override public function new(a:Bool)
	{
		super();
		items = new TextMenuList();
		add(items);
		createItem('preferences', function()
		{
			onSwitch.dispatch(PageName.Preferences);
		});
		// createItem('mods', function()
		// 	{
		// 		onSwitch.dispatch(PageName.Mods);
		// 	});
		createItem('controls', function()
		{
			onSwitch.dispatch(PageName.Controls);
		});
		#if debug
		createItem('TEST', function()
			{
				PlayState.SONG = Song.loadFromJson('Test', 'test');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;				
				LoadingState.loadAndSwitchState(new PlayState());	
			});
		#end

		// createItem('Switch State', function()
		// {
		// 	state = true;
		// 	FlxG.stage.addChild(new FlxGame(state));
		// });

		createItem('HEY HOMIE THIS IS OG LOC', function()
			{
				#if linux
				Sys.command('/usr/bin/xdg-open', ["https://ninja-muffin24.itch.io/funkin", "&"]);
				#else
				FlxG.openURL('https://ninja-muffin24.itch.io/funkin');
				#end
			});
		createItem('back to main menu', exit);
		createItem('exit to desktop', function name() {
			System.exit(0);
		});
		
		// createItem('ADVANCE OBJECT PHYSICS RAGDOLL OPTION', function name() {
		// 	FlxG.log.error('No function found in perference');
		// });		

	}



	public function createItem(label:String, callback:Dynamic, fireInstantly:Bool = false)
	{
		var item = items.createItem(0, 100 + 100 * items.length, label, Bold, callback);
		item.fireInstantly = fireInstantly;
		item.screenCenter(X);
		return item;
	}

	override public function set_enabled(state:Bool)
	{
		items.enabled = state;
		return super.set_enabled(state);
	}

	public function hasMultipleOptions()
	{
		return items.length > 2;
	}

	function selectLogin(){

		pomp.createButtons();
		// FlxG.openURL('https://www.newgrounds.com/passport/remote/06195942.57aa34b056f126f1413b7387f523cd1fdac7878970c591');
	}

	function selectLogout(){
		// NG.openNgPrompt(NG.showLogout());
	}

	override function update(elapsed:Float)
		{
			super.update(elapsed);

			if (FlxG.keys.pressed.TWO)//suck my dick you stupid hard code fuck
				{	
					FlxG.sound.music.pitch -= 0.01;		
					// ps.dadVocals.pitch -= 0.01;
					// ps.bfVocals.pitch -= 0.01;
					// cs.dadVocals.pitch -= 0.01;
					// cs.bfVocals.pitch -= 0.01;
				}
				if (FlxG.keys.pressed.THREE)
				{
	
					FlxG.sound.music.pitch += 0.01;
					// ps.dadVocals.pitch += 0.01;
					// ps.bfVocals.pitch += 0.01;
					// cs.dadVocals.pitch += 0.01;
					// cs.bfVocals.pitch += 0.01;
				}
				if (FlxG.keys.justPressed.FIVE)
					{
		
						FlxG.sound.music.pitch = 1;
						// ps.dadVocals.pitch += 0.01;
						// ps.bfVocals.pitch += 0.01;
						// cs.dadVocals.pitch += 0.01;
						// cs.bfVocals.pitch += 0.01;
					}				
		}	

}