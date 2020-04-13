private [ "_dialog", "_backpack", "_backpackcontents" ];

_dialog = createDialog "liberation_halo";
dojump = 0;
halo_position = getpos player;

_backpackcontents = [];

[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;

"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

waitUntil { dialog };
while { dialog && alive player && dojump == 0 } do {
	"spawn_marker" setMarkerPosLocal halo_position;
	if(GRLIB_deploy_timer < 1) then {
		ctrlSetText[202, format["%1",localize "STR_HALO_PARAM"]];
		private _nearsector = [1500,halo_position] call F_getNearestSector;
		if((lhd distance2D halo_position) > 2500 && (((halo_position distance2D (getMarkerPos _nearsector) > 1500) && (_nearsector in SECTOR_BLUFOR)) || !(_nearsector in SECTOR_BLUFOR))) then {
			if( count([] call F_getNearestFob) > 0 ) then {
				if((halo_position distance2D ([ halo_position ] call F_getNearestFob)) < 2500) then{
					ctrlEnable [202, false];
				}
				else{
					ctrlEnable [202, true];
				};
			}
			else{
				ctrlEnable [202, true];
			};
		}
		else{
			ctrlEnable [202, false];
		};
	} else {
		ctrlEnable [202, false];
		ctrlSetText[202, format["%1",[GRLIB_deploy_timer] call F_secondsToTimer]];
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
	halo_position = halo_position getPos [ random 250, random 360 ];
    halo_position = [ halo_position select 0, halo_position select 1, 1500 + (random 200) ];
	halojumping = true;
	sleep 0.1;
	[ name player, halo_position ] remoteExec [ "remote_call_opfordeployed", -2 ];
	cutRsc ["fasttravel", "PLAIN", 1];
	playSound "xianpara";
	sleep 4;
	_backpack = backpack player;
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		_backpackcontents = backpackItems player;
		removeBackpack player;
		sleep 0.1;
	};
	player addBackpack "B_Parachute";

	player setpos halo_position;

	sleep 4;
	halojumping = false;
	waitUntil { !alive player || ((getPosATL player) select 2) < 150 };
	vehicle player setVelocity [0,0,0];
	player action ["openParachute"];
	waitUntil { !alive player || isTouchingGround player };
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		sleep 2;
		player addBackpack _backpack;
		clearAllItemsFromBackpack player;
		{ player addItemToBackpack _x } foreach _backpackcontents;
	};
};
