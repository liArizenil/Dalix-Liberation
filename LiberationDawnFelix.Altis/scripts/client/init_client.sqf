if(isClass ( configFile >> "CfgVehicles" >> "gm_gc_army_brdm2" )) then { ["DLCDec", false, false,false,false] call BIS_fnc_endMission; };

0 enableChannel [true, false];

[] call compileFinal preprocessFileLineNumbers "scripts\client\misc\init_markers.sqf";

if ( typeOf player == "VirtualSpectator_F" ) exitWith {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\huron_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
};

[] call compileFinal preprocessFileLineNumbers "arsenal.sqf";

if(side player == GRLIB_side_friendly) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
	player addEventHandler ["Respawn", { if(score player > 0) then { [player,(-1*((getPlayerScores player) select 5))] remoteExec ["addScore",2]; }; }];
	GRTLIB_reflection_is_progress = false;

	1 enableChannel [true, false];

	[] execVM "IgiLoad\IgiLoadInit.sqf";
	[] execVM "scripts\cratercleaner.sqf";
	[] execVM "scripts\VehicleLimit.sqf";
	[] execVM "scripts\irstrobe.sqf"; 

	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\intel_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\recycle_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\ammobox_action_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\do_build.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\offload_diag.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\permissions_warning.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\vehicle_permissions.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\GroupTag\tag_init_Client.sqf";

	[ player ] joinSilent (createGroup GRLIB_side_friendly);
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

	build_lists = [[],[],[],Build_opfor_Ground_Vehicles,Build_opfor_Heli,Build_opfor_Air,[],Build_opfor_support,[]];
	
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager_opfor.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\do_build_opfor.sqf";

	[ player ] joinSilent (createGroup GRLIB_side_enemy);
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
[] execVM "scripts\outlw_magRepack\MagRepack_init_sv.sqf";

["Preload"] call BIS_fnc_arsenal;

respawn_lhd = compileFinal preprocessFileLineNumbers "scripts\client\spawn\respawn_lhd.sqf";
spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\ui\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\ui\write_credit_line.sqf";
do_load_box = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\build_overlay.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\unflip_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\spawn\redeploy_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\commander\enforce_whitelist.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\huron_marker.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\broadcast_squad_colors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\disable_remote_sensors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\secondary_jip.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stay_leader.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stop_renegade.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\init_arsenal.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
//[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\tutorial_manager.sqf";

player addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
player addEventHandler ["Respawn", { if ( !isNil "GRLIB_respawn_loadout" ) then { [ player, GRLIB_respawn_loadout ] call F_setLoadout; }; }];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

waitUntil { alive player };

[] execVM "scripts\motd.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\intro.sqf";