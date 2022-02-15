package com.roxstudio.haxe.ui;

import openfl.display.StageQuality;
import com.roxstudio.haxe.utils.GbTracer;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.Lib;

class RoxApp {

    public static var screenWidth: Float;
    public static var screenHeight: Float;
    public static var stage: Stage;

    private function new() {
    }

    public static function init() : Void {
        stage = Lib.current.stage;
//        trace("quality=" + stage.quality);
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        screenWidth = stage.stageWidth;
        screenHeight = stage.stageHeight;
//        trace(">>>>stage=("+screenWidth+","+screenHeight+")");
//        trace(">>>>curr=("+openfl.Lib.current.width+","+openfl.Lib.current.height+")");
#if flash
//        haxe.Firebug.redirectTraces();
#elseif cpp
//        GbTracer.init("eng/u2g.dat");
#end
    }

}
