enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";
[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

"respawn_west" setMarkerPosLocal [markerPos "respawn_West" select 0, markerPos "respawn_West" select 1, 187];

if (isServer) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
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
