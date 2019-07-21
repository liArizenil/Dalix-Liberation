params [ "_sector" ];
private [ "_attacktime", "_ownership", "_grp", "_squad_type" ,"_isplayer", "_grpunits", "_vehspawn","_specialgift", "_para" ];

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
_isplayer = (count([(playableUnits + switchableUnits),{(_x distance (markerpos _sector)) > GRLIB_capture_size && isPlayer _x}] call BIS_fnc_conditionalSelect) > 0);
if(_isplayer) then {
 	_grp = [ _sector, [] call F_getAdaptiveSquadComp ] call F_spawnRegularSquad;
	//[ _grp, _sector ] spawn add_defense_waypoints;
	_grpunits = _grpunits + (units _grp);
};

sleep 3;

_grp setCombatMode "GREEN";
_grp setBehaviour "COMBAT";

sleep 60;

_ownership = [ markerpos _sector ] call F_sectorOwnership;
if ( _ownership == GRLIB_side_friendly ) exitWith {
	if ( GRLIB_blufor_defenders ) then {
		{
			if ( alive _x ) then { deleteVehicle _x };
		} foreach units _grp;
	};
};

if(combat_readiness <= 4875) then {
	_attacktime = round(-1*((6/25)*combat_readiness) + GRLIB_vulnerability_timer);
}
else{
	_attacktime = 30;
};
[ [ _sector, 1, _attacktime ] , "remote_call_sector" ] call BIS_fnc_MP;

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
		[ [ _sector, 2 , 0 ] , "remote_call_sector" ] call BIS_fnc_MP;
		reset_battlegroups_ai = true;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_sectors_lost = stats_sectors_lost + 1;
		_vehspawn = ( [ _sector, random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [5, 100, "B_Quadbike_01_F"];
		_specialgift = opfor_mrap createVehicle _vehspawn;
		_specialgift setPosATL (_specialgift modelToWorld[0,0,150]);
		_para = createVehicle ["B_Parachute_02_F", getpos _specialgift, [], 0, "NONE"];
		_para attachTo [specialgift, [0, 0, 1]];
	} else {
		[ [ _sector, 3 , 0 ] , "remote_call_sector" ] call BIS_fnc_MP;
		{ [_x] spawn prisonner_ai; } foreach ( [ (markerpos _sector) nearEntities [ "Man", GRLIB_capture_size * 0.8 ], { side group _x == GRLIB_side_enemy } ] call BIS_fnc_conditionalSelect );
	};
};

sleep 60;

if ( GRLIB_blufor_defenders || _isplayer) then {
	{
		if ( alive _x ) then { deleteVehicle _x };
	} foreach _grpunits;
};
