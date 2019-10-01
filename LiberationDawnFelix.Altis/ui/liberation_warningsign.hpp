class liberation_JoinGroupSign
{
	idd = 5321;
	movingEnable = false;
	controlsBackground[] = {};

	objects[] = {};

    class controls
	{
        class Text: RscText
        {
            idc = 1000;
            text = "PRESS [ U ] KEY TO JOIN GROUP"; //--- ToDo: Localize;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class Background: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,0,0,1)";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};
class liberation_DoGroupTagSign
{
	idd = 5321;
	movingEnable = false;
	controlsBackground[] = {};

	objects[] = {};

    class controls
	{
        class Text: RscText
        {
            idc = 1000;
            text = "PLEASE SET YOUR GROUP TAG"; //--- ToDo: Localize;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class Background: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,0,0,1)";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};
class liberation_TeamKillPenaltyActivatedSign
{
	idd = 5321;
	movingEnable = false;
	controlsBackground[] = {};

	objects[] = {};

    class controls
	{
        class Text: RscText
        {
            idc = 1000;
            text = "TEAM KILL Damage Reflection Activated"; //--- ToDo: Localize;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class Background: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,0,0,1)";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};
class liberation_TeamKillPenaltyAsking
{
	idd = 5627;
	movingEnable = false;
	controlsBackground[] = {};

	objects[] = {};

    class controls
	{
        class Background: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(0,0,0,0.8)";
            x = 0.840313 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.077 * safezoneH;
        };
        class Title_Background: RscPicture
        {
            idc = 1201;
            text = "#(argb,8,8,3)color(0.3,0.3,0.3,0.9)";
            x = 0.840312 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.118601 * safezoneW;
            h = 0.0264 * safezoneH;
        };
        class Timer_Background: RscPicture
        {
            idc = 1202;
            text = "#(argb,8,8,3)color(0.15,0.15,0.15,1)";
            x = 0.958906 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.0264 * safezoneH;
        };
        class Title: RscText
        {
            idc = 1000;
            text = "Punish %1"; //--- ToDo: Localize;
            x = 0.840312 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.117558 * safezoneW;
            h = 0.0264 * safezoneH;
        };
        class Timer: RscText
        {
            idc = 1001;
            text = "%1 s"; //--- ToDo: Localize;
            x = 0.958906 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.0309377 * safezoneW;
            h = 0.0264 * safezoneH;
        };
        class label_OK: RscText
        {
            idc = 1002;
            text = "Agree"; //--- ToDo: Localize;
            x = 0.873312 * safezoneW + safezoneX;
            y = 0.0446 * safezoneH + safezoneY;
            w = 0.0319688 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class label_NO: RscText
        {
            idc = 1003;
            text = "DisAgree"; //--- ToDo: Localize;
            x = 0.939311 * safezoneW + safezoneX;
            y = 0.0446 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class Key_OK: RscPicture
        {
            idc = 1203;
            text = "#(argb,8,8,3)color(0.9,0.9,0.9,0.8)";
            x = 0.845469 * safezoneW + safezoneX;
            y = 0.0512 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class Key_NO: RscPicture
        {
            idc = 1204;
            text = "#(argb,8,8,3)color(0.9,0.9,0.9,0.8)";
            x = 0.907354 * safezoneW + safezoneX;
            y = 0.0512 * safezoneH + safezoneY;
            w = 0.0268129 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class label_OKKEY: RscText
        {
            idc = 1004;
            text = "HOME"; //--- ToDo: Localize;
            x = 0.844438 * safezoneW + safezoneX;
            y = 0.0534 * safezoneH + safezoneY;
            w = 0.022688 * safezoneW;
            h = 0.0286 * safezoneH;
        };
        class label_KEYNO: RscText
        {
            idc = 1005;
            text = "END"; //--- ToDo: Localize;
            x = 0.909416 * safezoneW + safezoneX;
            y = 0.0534 * safezoneH + safezoneY;
            w = 0.0247505 * safezoneW;
            h = 0.0286 * safezoneH;
        };
    };
};