class GroupTagger
{
	idd = 15024;
	movingenable = false;

    class control
	{
        class BG_Header: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(0,0,0,0.7)";
            x = 0.2;
            y = 0.2;
            w = 0.6;
            h = 0.04;
        };
        class BG_Body: RscPicture
        {
            idc = 1201;
            text = "#(argb,8,8,3)color(0,0,0,0.7)";
            x = 0.2;
            y = 0.26;
            w = 0.6;
            h = 0.24;
        };
        class Label_Tag: RscText
        {
            idc = 1000;
            text = "Tag: ";
            x = 0.2;
            y = 0.26;
            w = 0.075;
            h = 0.06;
        };
        class Select_GroupTag: RscCombo
        {
            idc = 2100;
			onLoad = "{
							(_this select 0) lbAdd _x
						} foreach Group_Types;	
						if(!isNil{ (group player) getVariable ['GroupType',nil] }) then {
							_index = Group_Types find ((group player) getVariable ['GroupType',nil]);
							(_this select 0) lbSetCurSel (_index) ;
						}
						else{
							(_this select 0) lbSetCurSel 0 ;
                            (group player) setVariable ['GroupType',GroupType select 0],true];
						};";
			onLBSelChanged = "((group player) setVariable ['GroupType',lbText[ 2100 , (lbCurSel 2100)],true])";

            x = 0.25;
            y = 0.26;
            w = 0.175;
            h = 0.06;
        };
        class Label_Header: RscText
        {
            idc = 1001;
            text = "Group Setting";
            x = 0.2;
            y = 0.2;
            w = 0.2125;
            h = 0.04;
        };
        class Input_Groupname: RscEdit
        {
            idc = 1400;
			maxChars = 20;
            onLoad = "
                private _removestring = (group player) getVariable ['GroupType',''] + ' ';
                private _CurGroupName = groupId (gorup player);
                private _GroupName = _CurGroupName splitString _removestring;
                
                ctrlSetText [1400, _GroupName];
                ";
            x = 0.425;
            y = 0.26;
            w = 0.375;
            h = 0.06;
        };
        class Text_Explain: RscStructuredText
        {
            idc = 1100;
            text = "Blank";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};

            x = 0.2125;
            y = 0.32;
            w = 0.575;
            h = 0.16;
        };
        class btn_confirm: RscButton
        {
            idc = 1600;
            text = "OK";
			action = "closeDialog 0";
			onButtonClick = "[ctrlText 1400,((group player) getVariable ['GroupType',nil])] call fn_SyncGroupClient;";

            x = 0.7;
            y = 0.52;
            w = 0.1;
            h = 0.04;
        };
        class btn_close: RscButton
        {
            idc = 1601;
            text = "X";
			action = "closeDialog 0";
            x = 0.7625;
            y = 0.2;
            w = 0.0375;
            h = 0.04;
        };
    };
};
