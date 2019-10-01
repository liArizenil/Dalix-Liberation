private [ "_dialog", "_backpack", "_backpackcontents","_acpara" ];

if ( isNil "GRLIB_last_halo_jump" ) then { GRLIB_last_halo_jump = -6000; };

if (!["IsGroupRegistered", [(group player)]] call BIS_fnc_dynamicGroups) exitWith { 
	1 cutRsc ["dojoingroup","PLAIN",0];
};
if(isNil{ ((group player)getVariable['GroupType',nil])}) exitWith {
	1 cutRsc ["dosetyourtag","PLAIN",0];
};

if ( GRLIB_halo_param > 1 && ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) >= time ) exitWith {
	hint format [ localize "STR_HALO_DENIED_COOLDOWN", ceil ( ( ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) - time ) / 60 ) ];
};

_dialog = createDialog "liberation_halo";
dojump = 0;
halo_position = getpos player;

_backpackcontents = [];

[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;

"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

waitUntil { dialog };
while { dialog && alive player && dojump == 0 } do {
	"spawn_marker" setMarkerPosLocal halo_position;
	if(([1500,halo_position] call F_getNearestSector) in blufor_sectors) then {
		ctrlEnable [202, true];
	}
	else{
		ctrlEnable [202, false];
	};
	sleep 0.1;
};

if ( dialog ) then {
	closeDialog 0;
	sleep 0.1;
};

"spawn_marker" setMarkerPosLocal markers_reset;
"spawn_marker" setMarkerTextLocal "";

[ "halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

if ( dojump > 0 ) then {
	GRLIB_last_halo_jump = time;
	halo_position = halo_position getPos [ random 250, random 360 ];
    halo_position = [ halo_position select 0, halo_position select 1, 1500 + (random 200) ];
	halojumping = true;
	sleep 0.1;
	cutRsc ["fasttravel", "PLAIN", 1];
	playSound "v44para";
	sleep 4;
	_backpack = backpack player;
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		_backpackcontents = backpackItems player;
		removeBackpack player;
		sleep 0.1;
	};
	player addBackpack "B_Parachute";

	player setpos halo_position;

	_acpara = player addAction ["<t color='#80FF80'> -- 낙하산 전개 -- </t>",{ player action ["openParachute"]; },"",90,true,true,"","vehicle player == player"];
	sleep 4;
	halojumping = false;
	waitUntil { !alive player || isTouchingGround player };
	player removeAction _acpara;
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		sleep 2;
		player addBackpack _backpack;
		clearAllItemsFromBackpack player;
		{ player addItemToBackpack _x } foreach _backpackcontents;
	};
};
