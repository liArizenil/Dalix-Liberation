_timer_airspawn = ([1800] call f_calcBGSleepTime);

while { !endgame } do {
	sleep _timer_airspawn;
	_timer_airspawn = ([1800] call f_calcBGSleepTime);

	if(count allPlayers > 7) then {
		private _targetPlayer = (selectRandom allPlayers) select {(_x distance (getMarkerPos "respawn_west") > 200) && _x distance lhd > 200 && side _x == CONST_SIDE_BLUFOR};
		private _targetSector = [99999,getPos _targetPlayer] call F_getNearestSector;
		if ( _targetSector != "" ) then { [ _targetSector ] spawn spawn_air; };
	};
};