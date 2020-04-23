params [ "_thispos" ];
private [ "_attacktime", "_ownership", "_grp", "_marker" ];

_ownership = [ _thispos ] call F_sectorOwnership;
if ( _ownership != CONST_SIDE_OPFOR ) exitWith {};

ATTACK_PROGRESS = ATTACK_PROGRESS + [_thispos];

if ( CONST_BLUFOR_DEFEND ) then {
	_grp = creategroup CONST_SIDE_BLUFOR;
	{ _x createUnit [ _thispos, _grp,'this addMPEventHandler ["MPKilled", {call F_unitKilled}]']; } foreach BLUFOR_SQUAD_INF;

	_grp setCombatMode "GREEN";
	_grp setBehaviour "COMBAT";
};

sleep 60;

_ownership = [ _thispos ] call F_sectorOwnership;
if ( _ownership == CONST_SIDE_BLUFOR ) exitWith {
	if ( CONST_BLUFOR_DEFEND ) then {
		{
			if ( alive _x ) then { deleteVehicle _x };
		} foreach units _grp;
	};
};

[ _thispos , 1 ] remoteExec ["remote_call_fob",-2];

_marker = createMarker [format ["fob%2",[_thispos] call F_getFobName],_thispos];
_marker setMarkerType "mil_objective";
_marker setMarkerColor CONST_COLOR_OPFOR_BRIGHT;

_attacktime = CONST_VULNERABILITY_TIMER;

while { _attacktime > 0 && ( _ownership == CONST_SIDE_OPFOR || _ownership == CONST_SIDE_RESIST ) } do {
	_attacktime = _attacktime - 1;
	_marker setMarkerText format ["%1",[_attacktime] call F_secToTime];
	_ownership = [ _thispos ] call F_sectorOwnership;
	uisleep 1;
};

if(_attacktime < 1) then {
	_marker setMarkerText "Vulnerable";
};

waitUntil {
	sleep 1;
	[ _thispos ] call F_sectorOwnership != CONST_SIDE_OPFOR;
};

if ( !endgame ) then {
	if ( _attacktime <= 1 && ( [ _thispos ] call F_sectorOwnership == CONST_SIDE_OPFOR ) ) then {
		[ _thispos , 2 ] remoteExec ["remote_call_fob",-2];

		FOB_ALL = FOB_ALL - [_thispos];
		publicVariable "FOB_ALL";

		reset_battlegroups_ai = true;
		[_thispos] call F_destroyfob;
		[] spawn F_saveGames;
		[] call F_recalcCaps;
		stats_fobs_lost = stats_fobs_lost + 1;
	} else {
		[ _thispos , 3 ] remoteExec ["remote_call_fob",-2];
		{ [_x] spawn F_AI_prisonner; } foreach ( (_thispos nearEntities [ "Man", CONST_CAPTURE_SIZE * 0.8]) select { side group _x == CONST_SIDE_OPFOR } );
	};
	deleteMarker _marker;
	ATTACK_PROGRESS = ATTACK_PROGRESS - [_thispos];
};

sleep 60;

if ( CONST_BLUFOR_DEFEND ) then {
	{
		if ( alive _x ) then { deleteVehicle _x };
	} foreach units _grp;
};