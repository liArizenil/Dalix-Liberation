class liberation_GroupManager
{
	idd = 5212;
	movingEnable = false;
	controlsBackground[] = {};

	objects[] = {};

    class controls
	{
        class BG_Header: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(0,0,0,0.7)";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class BG_Body: RscPicture
        {
            idc = 1201;
            text = "#(argb,8,8,3)color(0,0,0,0.7)";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.11 * safezoneH;
        };
        class Label_Header: RscText
        {
            idc = 1000;
            text = "Group Name Setting"; //--- ToDo: Localize;
            font = FontM;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class Select_GroupTag: RscCombo
        {
            idc = 2100;
            onLoad = "{(_this select 0)lbAdd _x}foreach Group_Types;_index=(Group_Types find((group player)getVariable['GroupType',(Group_Types select 0)]));(_this select 0)lbSetCurSel(_index);";

            font = FontM;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class Input_Groupname: RscEdit
        {
            idc = 1400;
            maxChars = 20;

            x = 0.4175 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.278437 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class Btn_Confirm: RscButton
        {
            idc = 1600;
            text = "OK";
            action = "closeDialog 0";
			onButtonClick = "[ctrlText 1400,lbText[ 2100 , (lbCurSel 2100)]] call fn_SyncGroupClient;";

            x = 0.659844 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class Btn_Close: RscButton
        {
            idc = 1601;
            text = "X";
            action = "closeDialog 0";

            x = 0.690781 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};