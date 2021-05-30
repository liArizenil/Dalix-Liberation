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

	[ player ] joinSilent (createGroup GRLIB_side_friendly);
};

[] execVM "GF_Earplugs\GF_Earplugs.sqf";
[] execVM "scripts\autorun.sqf";
[] execVM "scripts\3Dmarkers.sqf";
[] execVM "VAM_GUI\VAM_GUI_init.sqf";
[] execVM "GREUH\scripts\GREUH_activate.sqf";
[] execVM "scripts\SimpleHaloDrop.sqf";
[] execVM "scripts\BlackFishCargo.sqf";
[] execVM "scripts\SHK_Fastrope.sqf";

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

player addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
player addEventHandler ["Respawn", { if ( !isNil "GRLIB_respawn_loadout" ) then { [ player, GRLIB_respawn_loadout ] call F_setLoadout; }; }];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

waitUntil { alive player };

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\intro.sqf";