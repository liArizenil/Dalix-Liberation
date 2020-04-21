private [ "_oldbuildtype", "_cfg", "_initindex", "_dialog", "_iscommandant", "_squadname", "_buildpages", "_build_list", "_classnamevar", "_entrytext", "_icon", "_affordable", "_affordable_crew", "_selected_item", "_linked", "_linked_unlocked", "_base_link", "_link_color", "_link_str" ];


if ( isNil "buildtype" ) then { buildtype = 3 };
if ( isNil "buildindex" ) then { buildindex = -1 };

dobuild = 0;
_oldbuildtype = -1;
_cfg = configFile >> "cfgVehicles";
_initindex = buildindex;

_dialog = createDialog "ui_build";

waitUntil { dialog };

private _isPilot = (typeOf player == "O_Pilot_F");

ctrlShow [ 102, false ];
ctrlShow [ 1025, false ];

ctrlShow [ 103, false ];
ctrlShow [ 1035, false ];//type 2

ctrlShow [ 105, _isPilot ];
ctrlShow [ 1055, _isPilot ];

ctrlShow [ 1106, _isPilot ];
ctrlShow [ 11065, _isPilot ];
if(_isPilot) then {
	ctrlSetText [ 11065 , "\A3\ui_f\data\map\vehicleicons\iconPlane_ca.paa"];
};

ctrlShow [ 109, false ];
ctrlShow [ 1095, false ];

ctrlShow [ 108, false ];
ctrlShow [ 1085, false ];

ctrlShow [ 121, false ];

ctrlShow [ 3000, false ];
ctrlShow [ 30005, false ];
ctrlShow [ 3001, false ];
ctrlShow [ 30015, false ];

ctrlSetText [ 3002 , "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa"];
ctrlSetText [ 30025 , "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa"];

_buildpages = [
"", //type 1
"", //type 2
"지상 차량", //type 3
"회전익기", //type 4
"공중 장비", //type 5
"", //type 6
"지원 요청", //type 7
"" //type 8
];

while { dialog && alive player && (dobuild == 0 || buildtype == 1)} do {
	_build_list = build_lists select buildtype;

	if(_oldbuildtype != buildtype || synchro_done ) then {
		synchro_done = false;
		_oldbuildtype = buildtype;
		
		ctrlSetText [ 151, _buildpages select ( buildtype - 1) ];

		lbClear 110;
		{
			private _name = "";
			if(buildtype == 7) then {
				_name = localize (_x select 0);
			} else {
				_name = getText(_cfg >> (_x select 0) >> "displayName");
			};

			((findDisplay 5501) displayCtrl (110)) lnbAddRow [ _name, "", "", format [ "%1" ,_x select 1]];

			if(buildtype != 7) then {
				_icon = getText ( _cfg >> (_x select 0) >> "icon");
				if(isText  (configFile >> "CfgVehicleIcons" >> _icon)) then {
					_icon = (getText (configFile >> "CfgVehicleIcons" >> _icon));
				};
				lnbSetPicture  [110, [((lnbSize 110) select 0) - 1, 0],_icon];
			};

			_affordable = false;
			_affordable = ((_x select 1 > 0) && ((_x select 1) < combat_readiness));

			if ( _affordable ) then {
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 0], [1,1,1,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 3], [1,1,1,1]];
			} else {
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 0], [0.4,0.4,0.4,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 3], [0.4,0.4,0.4,1]];
			};
		} forEach _build_list;
	};

	if(_initindex != -1) then {
		lbSetCurSel [110, _initindex];
		_initindex = -1;
	};

	_selected_item = lbCurSel 110;
	_affordable = false;

	if (dobuild == 0 && _selected_item != -1 && (_selected_item < (count _build_list))) then {
		_build_item = _build_list select _selected_item;
		_affordable = ((_build_item select 1 > 0) && (_build_item select 1) < combat_readiness);
	};

	ctrlEnable [ 120, _affordable];

	ctrlSetText [131, format [ "%1 : %2/%3" , localize "STR_MANPOWER" , (floor resources_infantry), infantry_cap]];
	ctrlSetText [132, format [ "%1 : %2" , localize "STR_AMMO" , (floor resources_ammo)] ];
	ctrlSetText [133, format [ "%1 : %2/%3" , localize "STR_FUEL" , (floor resources_fuel), fuel_cap] ];
	ctrlSetText [134, format [ "%1 : %2/%3" , localize "STR_UNITCAP" , unitcap, ([] call F_localCap)] ];

	buildindex = _selected_item;

	if(buildtype == 1 && dobuild != 0) then {
		ctrlEnable [120, false];
		ctrlEnable [121, false];
		sleep 1;
		dobuild = 0;
	};

	sleep 0.1;
};

if (!alive player || dobuild != 0) then { closeDialog 0 };