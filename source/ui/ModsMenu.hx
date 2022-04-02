package ui;

import flixel.util.FlxColor;
import flash.text.TextField;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import polymod.Polymod;
import sys.FileSystem;

class ModsMenu extends  Page
{   
   var grpMods:FlxTypedGroup<ModMenuItem>;
   var enabledMods:Array<String> = [];
   var modFolders:Array<String> = [];

   var curSelected:Int = 0;
  
    public function new():Void
    {
            super();
            
            grpMods = new FlxGroupTypedGroup<ModMenuItem>();
            add(grpMods);

            refreshModList();
    }
    
    override function update(elapsed:Float)
    {    
            if (FlxG.keys.justPressed.R)
                refreshModList(); 

            selections();

            if (controls.UI_UP_P)
                selections(-1);            
            if (controls.UI_DOWN_P)
                selections(1);

            if (FlxG.keys.justPressed.SPACE)
                grpMods.members[curSelected].modEnabled = !grpMods.members[curSelected].modEnabled;

            super.update(elapsed);    
    }

    private function selections(change:Int = 0):Void
    {
            curSelected += change;

        if (curSelected >= modFolders.length)
            curSelected = 0;
        if (curSelected < modFolders.length)
            curSelected = modFolders.length - 1;

        for (txt in 0...grpMods.length)
        {
            if (txt == curSelected)
            {
                grpMods.members[txt].color = FlxColor.YELLOW;
            }    
            else
                grpMods.members[txt].color = FlxColor.WHITE;
        }    
    }    
   
    private function refreshModList():Void
    {
        while (grpMods.members.length > 0)
        {
            grpMods.remove(grpMods.members[0], true);
        }

        var modList = [];
        modFolders = [];

        for (file in  FileSystem.readDirectory('./mods'))
        {
            if(Filesystem.isDirectory('./mods' + file))
                modFolders.push(file);
        }

        enabledMods = [];

        modList = Polymod.scan('./mods');
        
        trace(modList);
           
        var loopNum:Int = 0;
        for (i in modFolders)
        {
            var txt:ModMenuItem = new ModMenuItem(0, 10 + (40 * loopNum), 0, i, 32);
            txt.text = i;
            grpMods.add(txt);

            loopNum++;
        }
    }    
}

class ModMenuItem extends TextField
{
    public var modEnabled:Bool = false;
    public var daMod:String;

    public function new(x:Float, y:Float, w:Float, str:String, size:Int)
    {
        super(x, y, w, str, size);
    }   

    override function update(elapsed:Float) {
        if(modEnabled)
            alpha = 1;
        else
            alpha = 0.5;

        super.update(elapsed);
    }
    
}
