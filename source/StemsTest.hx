package;

import flixel.system.FlxSound;
import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxTimer;

class StemsTest extends FlxState
{
    override public function create()
    {
		new FlxTimer().start(0.1, function(tmr:FlxTimer)
            {
                var track = new FlxSound().loadEmbedded(Paths.sound('Track _Master'));
                track.play();
                FlxG.sound.list.add(track);
                var track1 = new FlxSound().loadEmbedded(Paths.sound('Track 1_Master'));
                track1.play();
                FlxG.sound.list.add(track1);
                var track2 = new FlxSound().loadEmbedded(Paths.sound('Track 2_Master'));
                track2.play();
                FlxG.sound.list.add(track2);
                var track3 = new FlxSound().loadEmbedded(Paths.sound('Track 3_Master'));
                track3.play();
                FlxG.sound.list.add(track3);
                var track4 = new FlxSound().loadEmbedded(Paths.sound('Track 4_Master'));
                track4.play();
                FlxG.sound.list.add(track4);
                var track5 = new FlxSound().loadEmbedded(Paths.sound('Track 5_Master'));
                track5.play();
                FlxG.sound.list.add(track5);
                var track6 = new FlxSound().loadEmbedded(Paths.sound('Track 6_Master'));
                track6.play();
                FlxG.sound.list.add(track6);
                var track7 = new FlxSound().loadEmbedded(Paths.sound('Track 7_Master'));
                track7.play();
                FlxG.sound.list.add(track7);
                var track8 = new FlxSound().loadEmbedded(Paths.sound('Track 8_Master'));
                track8.play();
                FlxG.sound.list.add(track8);
            });	
    } 
}