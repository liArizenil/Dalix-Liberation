private _timer_battlegroup = ([2100] call f_calcBGSleepTime) + ( 2100 / CONST_CSAT_AGGRESSIVITY );

while { !endgame } do {
	sleep _timer_battlegroup;
	_timer_battlegroup = ([2100] call f_calcBGSleepTime) + ( 2100 / CONST_CSAT_AGGRESSIVITY );
	if(count allPlayers > 7) then {
		_targetPlayer = (selectRandom allPlayers) select {(_x distance (getMarkerPos "respawn_west") > 200) && _x distance lhd > 200 && side _x == CONST_SIDE_BLUFOR};
		_targetSector = [99999,getPos _targetPlayer] call F_getNearestSector;
		if ( _targetSector != "" ) then { [ _targetSector ] spawn spawn_air; };
	};
};