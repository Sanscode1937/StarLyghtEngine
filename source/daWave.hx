package;

import haxe.io.BytesData;
import lime.utils.UInt8Array;
import openfl.display.Sprite;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;
import lime.media.AudioBuffer;
import haxe.io.Bytes;
import openfl.Lib;

class daWave extends Sprite
{

	public function new()
	{
		super();
		
        var BytesPerSample = 4;
        var SampleRate = 48000;
        var ToneHertz = 256;
        var RunningSampleIndex = 0;
        var SampleOffset = 0;
        var SquareWavePeriod = SampleRate / ToneHertz;
        var HalfSquareWavePeriod = SquareWavePeriod / 2;
        var BufferSize = SampleRate * BytesPerSample;
        
        var ToneVolume = 16000;
        
        var SampleSize:Int = 1920 * 20;
        
		var audio = new AudioBuffer();
        audio.channels = 2;
        audio.bitsPerSample = 16;
        audio.sampleRate = SampleRate;
        
        var output = Bytes.alloc(cast BufferSize);
        
        for (i in 0...SampleSize)
        {
            var SampleValue = ((RunningSampleIndex++ / HalfSquareWavePeriod) % 2 == 0) ? ToneVolume : -ToneVolume;
            output.setInt32(SampleOffset, cast SampleValue);
            SampleOffset += BytesPerSample;
        }
        
        audio.data = UInt8Array.fromBytes(output);
        
        Sound.fromAudioBuffer(audio).play(0, 9999);
	}

}