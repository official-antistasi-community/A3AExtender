class Templates {
    class Vanilla_AAF { // overwrite existing template
        basepath = QPATHTOFOLDER(Templates\Vanilla);
        file = "Vanilla_AI_AAF";
    };

    class Vanilla_CSAT2; //creates new class based on given information
    {
        requiredAddons[] = {};//used to define necessary mods for loading
        logo = "a3\ui_f\data\logos\arma3_white_ca.paa";//the path to a logo - this is a placeholder
        basepath = QPATHTOFOLDER(Templates\Vanilla); //the path to the folder the template is located in, this translates to "\x\A3AE\addons\templates\Templates\Vanilla"
        side = "Inv"; //the side the faction defaults to, one of the following: Inv, Occ, Reb, Civ
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa"; //path to an icon to be displayed in the selector
        name = "A3 CSAT 2"; //the name shown in the selector
        file = "Vanilla_AI_CSAT2"; //the template file name
        maps[] = {}; //if this template should be prioritized on any maps (case sensetive to worldName)
        climate[] = {"arid", "arctic"}; //climate that the template is meant for
        equipFlags[] = {};//used with custom identifiers for special cases like "vanilla" or "lowTech"
        priority = 10;//only influences sort order in start up gui
    };
};
