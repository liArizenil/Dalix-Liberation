private ["_time" ,"_timer_battlegroup", "_timer_airspawn", "_combat_triggers", "_combat_triggers_infantry", "_grp", "_grpList", "_spawn_marker", "_sector_spawn_pos", "_vehicle_object"];

_grpList = [];
_timer_battlegroup = ([2100] call f_calcBGSleepTime) + ( 2100 / CONST_CSAT_AGGRESSIVITY );
_timer_airspawn = ([1800] call f_calcBGSleepTime);

_combat_triggers = [20,40,50,65,80,95];
if ( GRLIB_unitcap < 0.9 ) then { _combat_triggers = [20,45,90]; };
if ( GRLIB_unitcap > 1.3 ) then { _combat_triggers = [10,15,20,25,35,40,55,65,70,75,80,85,90,95]; };

while { !ENDGAME } do {
	if(CONST_CSAT_AGGRESSIVITY > 0.9) then {
		if(time % _timer_battlegroup == 0) then {
			_timer_battlegroup = ([2100] call f_calcBGSleepTime) + ( 2100 / CONST_CSAT_AGGRESSIVITY );

			if ((count allPlayers >= (10 / CONST_CSAT_AGGRESSIVITY)) && ([] call F_opforCap < GRLIB_battlegroup_cap) && (combat_readiness >= 70) && (diag_fps > 15.0))  then {
				[] spawn F_spawnBattleGroup;
			};
		};
		if(time % _timer_airspawn == 0) then {
			_timer_airspawn = ([1800] call f_calcBGSleepTime);

			if(count allPlayers > 5) then {
				private _targetPlayer = (selectRandom allPlayers) select {(_x distance (getMarkerPos "respawn_west") > 200) && _x distance lhd > 200 && side _x == CONST_SIDE_BLUFOR};
				private _targetSector = [99999,getPos _targetPlayer] call F_getNearestSector;
				if ( _targetSector != "" ) then { [ _targetSector ] spawn spawn_air; };
			};
		};
	};
	if(count _grpList > {_x < combat_readiness} count _combat_triggers) then { //PATROL
		_spawn_marker = [2000,5000,true] call F_findOpforSpawnPoint;
		if ( _spawn_marker != "" ) then {
			_sector_spawn_pos = [(((markerpos _spawn_marker) select 0) - 500) + (random 1000),(((markerpos _spawn_marker) select 1) - 500) + (random 1000),0];
			if(random 1 >= 0.5) then {
				_grp = createGroup [CONST_SIDE_OPFOR, true];
				{
					_x createUnit [_sector_spawn_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
				} forEach ([] call F_getAdaptiveSquadComp);
			}
			else{
				if ( (combat_readiness > 75) && ((random 100) > 85) ) then {
					_vehicle_object = [ _sector_spawn_pos, selectRandom opfor_choppers] call F_libSpawnVehicle;
				} else {
					_vehicle_object = [ _sector_spawn_pos, [] call F_getAdaptiveVehicle ] call F_libSpawnVehicle;
				};
				_grp = group ((crew _vehicle_object) select 0);
			};
			[_grp ] spawn F_manageSinglePatrol;
			_grpList pushBack _grp;
		};
	};
	sleep 0.5
};