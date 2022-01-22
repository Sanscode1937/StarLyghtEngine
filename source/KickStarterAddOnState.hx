package;

import openfl.Lib;
import openfl.display.Sprite;
import openfl.net.NetConnection;
import openfl.media.Video;
import openfl.net.NetStream;
import flixel.FlxG;

using StringTools;

class KickStarterAddOnState extends MusicBeatState
{
	override function create()
	{

	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
			finishVid();

		super.update(elapsed);
	}

	private function finishVid()
	{
		#if web
		netStream.dispose();
		if (FlxG.game.contains(video))
			FlxG.game.removeChild(video);
		#end

		TitleState.initialized = false;
		FlxG.switchState(new TitleState());
	}

	#if web
	private function client_onMetaData(e)
	{
		video.attachNetStream(netStream);
		video.width = video.videoWidth;
		video.height = video.videoHeight;
	}

	private function netStream_onAsyncError(e)
	{
		trace('Error loading video');
	}

	private function netConnection_onNetStatus(e)
	{
		if (e.info.code == 'NetStream.Play.Complete')
		{
			finishVid();
		}
		trace(e.toString());
	}

	private function overlay_onMouseDown(e)
	{
		netStream.soundTransform.volume = 0.2;
		netStream.soundTransform.pan = -1;
		Lib.current.stage.removeChild(overlay);
	}
	#end
}