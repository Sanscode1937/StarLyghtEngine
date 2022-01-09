package;
import flixel.text.FlxText;
import flixel.FlxG;
using StringTools;

class CutsceneAnimTestState extends MusicBeatState
{

    override function create()
    {
            var oops:FlxText = new FlxText(0, 10);
            oops.text = 'SORRY It not finished yet and will never finished lol';
            oops.setFormat(Paths.font("vcr.ttf"), 32);
            oops.screenCenter(X);
        
            if (FlxG.keys.justPressed.ESCAPE && FlxG.keys.justPressed.BACKSPACE)
                {
                    FlxG.switchState(new TitleState());
                }
    }


}