package;

import sys.io.FileInput;
import lime.app.Application;
import lime.ui.Window;
import lime.utils.Assets;

class Pirate {
    var correctDll:String = "steam_api";
    var res:Window;

    override function create() {

        if(!correctDll)
            {
                res.width = 1;
                res.height = 1;
            }        

            correctDll = false;//Game crashed!

    }
}