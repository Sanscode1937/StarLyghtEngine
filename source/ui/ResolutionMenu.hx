package ui;
import lime.ui.Window;


class ResolutionMenu extends Page {
    var resolutionStuff:Array<String> = ['800x600', '1024x768', '1280x720', '1280x768', '1366x768', '1600x1200', '1920x1080'];
    var res:Window;
    override public function create() {
        switch(resolutionStuff) {// i know this is shit but lol
            case '800x600':
                res.width = 800;
                res.height = 600;
            case '1024x768':
                res.width = 1024;
                res.height = 768; 
            case '1280x720':
                res.width = 1280;
                res.height = 720; 
            case '1280x768':
                res.width = 1280;
                res.height = 768; 
            case '1366x768':
                res.width = 1366;
                res.height = 768; 
            case '1600x1200':
                res.width = 1600;
                res.height = 1200; 
                case '1920x1080':
                res.width = 1920;
                res.height = 1080;    
        }
        
    }
}