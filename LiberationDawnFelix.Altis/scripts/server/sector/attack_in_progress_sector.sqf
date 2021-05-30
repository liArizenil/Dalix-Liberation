params [ "_sector" ];
private [ "_attacktime", "_ownership", "_grp", "_squad_type" ,"_isplayer", "_grpunits" ];

sleep 5;

_ownership = [ markerpos _sector ] call F_sectorOwnership;
if ( _ownership != GRLIB_side_enemy ) exitWith {};

_squad_type = blufor_squad_inf_light;
if ( _sector in sectors_military ) then {
	_squad_type = blufor_squad_inf;
};
_grpunits = [];
if ( GRLIB_blufor_defenders ) then {
	_grp = creategroup GRLIB_side_friendly;
	{ _x createUnit [ markerpos _sector, _grp,'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]']; } foreach _squad_type;
	_grpunits = units _grp;
};
_isplayer = (count((playableUnits + switchableUnits) select {(_x distance (markerpos _sector)) < GRLIB_capture_size && isPlayer _x}) > 0);
if(_isplayer) then {
 	_grp = [_sector,opfor_squad_8_airkillers] call F_spawnRegularSquad;
	[ _grp, _sector ] spawn add_defense_waypoints;
	_grpunits = _grpunits + (units _grp);
};

sleep 5;

_grp setCombatMode "GREEN";
_grp setBehaviour "COMBAT";

sleep 20;

_ownership = [ markerpos _sector ] call F_sectorOwnership;
if ( _ownership == GRLIB_side_friendly ) exitWith {
	if ( GRLIB_blufor_defenders ) then {
		{
			if ( alive _x ) then { deleteVehicle _x };
		} foreach units _grp;
	};
};

_attacktime = GRLIB_vulnerability_timer - round(GRLIB_vulnerability_timer*combat_readiness/100);

[ _sector, 1, _attacktime ] remoteExec ["remote_call_sector",-2];

while { _attacktime > 0 && ( _ownership == GRLIB_side_enemy || _ownership == GRLIB_side_resistance ) } do {
	_ownership = [markerpos _sector] call F_sectorOwnership;
	_attacktime = _attacktime - 1;
	sleep 1;
};

waitUntil {
	sleep 1;
	[markerpos _sector] call F_sectorOwnership != GRLIB_side_resistance;
};

if ( GRLIB_endgame == 0 ) then {
	if ( _attacktime <= 1 && ( [markerpos _sector] call F_sectorOwnership == GRLIB_side_enemy ) ) then {
		blufor_sectors = blufor_sectors - [ _sector ];
		publicVariable "blufor_sectors";
		[ _sector, 2 , 0 ] remoteExec ["remote_call_sector",-2];
		reset_battlegroups_ai = true;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_sectors_lost = stats_sectors_lost + 1;
		if(_isplayer) then {
				combat_readiness = combat_readiness + 100;
		};
	} else {
		[ _sector, 3 , 0 ] remoteExec ["remote_call_sector",-2];
		{ [_x] spawn prisonner_ai; } foreach ( ((markerpos _sector) nearEntities [ "Man", GRLIB_capture_size * 0.8 ]) select { side group _x == GRLIB_side_enemy&&!isPlayer _x } );
	};
};

sleep 160;

if ( GRLIB_blufor_defenders || _isplayer) then {
	{
		if ( alive _x ) then { deleteVehicle _x };
	} foreach _grpunits;
};
