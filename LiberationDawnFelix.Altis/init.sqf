enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";
[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
	["Initialize"] call BIS_fnc_dynamicGroups;
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	if(isClass ( configFile >> "CfgVehicles" >> "gm_gc_army_brdm2" )) then {
		["DLCDec", false, false,false,false] call BIS_fnc_endMission;
	};
	[] execVM "GF_Earplugs\GF_Earplugs.sqf";
	[] execVM "scripts\autorun.sqf";
	[] execVM "scripts\RuleDiary.sqf";
	[] execVM "scripts\3Dmarkers.sqf";
	[] execVM "scripts\anounce.sqf";
	[] execVM "VAM_GUI\VAM_GUI_init.sqf";
	[] execVM "GREUH\scripts\GREUH_activate.sqf";
	[] execVM "scripts\SimpleHaloDrop.sqf";
	[] execVM "scripts\BlackFishCargo.sqf";
	[] execVM "scripts\SHK_Fastrope.sqf";
	[] execVM "scripts\motd.sqf";
	[] execVM "scripts\outlw_magRepack\MagRepack_init_sv.sqf";

	if(side player == GRLIB_side_friendly) then {
		[] execVM "IgiLoad\IgiLoadInit.sqf";
		[] execVM "scripts\cratercleaner.sqf";
		[] execVM "scripts\VehicleLimit.sqf";
		[] execVM "scripts\irstrobe.sqf"; 
	};
	if(side player == GRLIB_side_enemy) then {
		private ["_bluforcount"];
		_bluforcount = GRLIB_side_friendly countSide (allPlayers);
		
		if(_bluforcount < 20) then {
			["LackPlayer", false, false,false,false] call BIS_fnc_endMission;
		};
		if(_bluforcount < 23 && {side _x == GRLIB_side_enemy} count (allPlayers) > 2) then {
			["LackPlayer", false, false,false,false] call BIS_fnc_endMission;
		};
		if(typeOf player == "O_Soldier_AT_F") then {
			if(_bluforcount < 24) then {
		        	["LackPlayer", false, false,false,false] call BIS_fnc_endMission;
			};
		};
		if(typeOf player == "O_Soldier_AA_F") then {
			if(_bluforcount < 24) then {
		        	["LackPlayer", false, false,false,false] call BIS_fnc_endMission;
			};
		};
		if(typeOf player == "O_Pilot_F") then {
			if(_bluforcount < 27) then {
				["LackPlayer", false, false,false,false] call BIS_fnc_endMission;
			};
		};
	};
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};
if ( GRLIB_revive > 0 ) then {
	[] execVM "FAR_revive\FAR_revive_init.sqf";
};
[] execVM "Vcom\VcomInit.sqf";
[] execVM "scripts\advancedSlingLoadingInit.sqf";
[] execVM "scripts\fn_advancedTowingInit.sqf";
[] execVM "scripts\AdvancedRadio\init.sqf";
[] execVM "CRS\init.sqf";
