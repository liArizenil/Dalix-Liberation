params [ "_sector" ];
private [ "_attacktime", "_ownership", "_grp", "_squad_type" ,"_isplayer", "_grpunits" ];

sleep 5;

_ownership = [ markerpos _sector ] call F_sectorOwnership;
if ( _ownership != CONST_SIDE_OPFOR ) exitWith {};

_squad_type = blufor_squad_inf_light;
if ( _sector in SECTOR_MILITARY ) then {
	_squad_type = blufor_squad_inf;
};
_grpunits = [];
if ( CONST_BLUFOR_DEF ) then {
	_grp = creategroup CONST_SIDE_BLUFOR;
	{ _x createUnit [ markerpos _sector, _grp,'this addMPEventHandler ["MPKilled", { call F_unitKilled}]']; } foreach _squad_type;
	_grpunits = units _grp;
};
_isplayer = (count((playableUnits + switchableUnits) select {(_x distance (markerpos _sector)) < CONST_CAPTURE_SIZE && isPlayer _x}) > 0);
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
if ( _ownership == CONST_SIDE_BLUFOR ) exitWith {
	if ( CONST_BLUFOR_DEF ) then {
		{
			if ( alive _x ) then { deleteVehicle _x };
		} foreach units _grp;
	};
};

if(combat_readiness <= 4583) then {
	_attacktime = round(-1*((6/25)*combat_readiness) + CONST_VULNERABILITY_TIMER);
}
else{
	_attacktime = 90;
};
[ _sector, 1, _attacktime ] remoteExec ["remote_call_sector",-2];

while { _attacktime > 0 && ( _ownership == CONST_SIDE_OPFOR || _ownership == CONST_SIDE_RESIST ) } do {
	_ownership = [markerpos _sector] call F_sectorOwnership;
	_attacktime = _attacktime - 1;
	sleep 1;
};

waitUntil {
	sleep 1;
	[markerpos _sector] call F_sectorOwnership != CONST_SIDE_RESIST;
};

if ( !endgame ) then {
	if ( _attacktime <= 1 && ( [markerpos _sector] call F_sectorOwnership == CONST_SIDE_OPFOR ) ) then {
		SECTOR_BLUFOR = SECTOR_BLUFOR - [ _sector ];
		publicVariable "SECTOR_BLUFOR";
		[ _sector, 2 , 0 ] remoteExec ["remote_call_sector",-2];
		reset_battlegroups_ai = true;
		[] spawn F_saveGames;
		[] call F_recalcCaps;
		stats_sectors_lost = stats_sectors_lost + 1;
		if(_isplayer) then {
				combat_readiness = combat_readiness + 100;
		};
	} else {
		[ _sector, 3 , 0 ] remoteExec ["remote_call_sector",-2];
		{ [_x] spawn F_AI_prisonner; } foreach ( ((markerpos _sector) nearEntities [ "Man", CONST_CAPTURE_SIZE * 0.8 ]) select { side group _x == CONST_SIDE_OPFOR&&!isPlayer _x } );
	};
};

sleep 160;

if ( CONST_BLUFOR_DEF || _isplayer) then {
	{
		if ( alive _x ) then { deleteVehicle _x };
	} foreach _grpunits;
};
