package;

import flixel.FlxG;
import flixel.FlxCamera;

// typedef SwagCamera =
// {
//     var swaggerCam:Float;
//     var swagCamPos:FlxCamera;
// } 

class SwagCamPos//just move the camera lol
{
    var swaggerCam:Float = 0.9;
    var swagCamPos:FlxCamera;
    public function new(cam:Float,xPos:Int,yPos:Int)
    {
        swaggerCam = cam;
        FlxG.camera.zoom = swaggerCam;

        swagCamPos = new FlxCamera(xPos,yPos);
        
    }    

}
