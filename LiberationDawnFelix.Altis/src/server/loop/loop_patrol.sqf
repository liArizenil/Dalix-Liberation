private _grpList = [];
private _combat_triggers = [20,40,50,65,80,95];
if ( CONST_UNITCAP < 0.9 ) then { _combat_triggers = [20,45,90]; };
if ( CONST_UNITCAP > 1.3 ) then { _combat_triggers = [10,15,20,25,35,40,55,65,70,75,80,85,90,95]; };

while { !endgame } do {
	if(count _grpList > {_x < combat_readiness} count _combat_triggers) then { //PATROL
		_spawn_marker = [2000,5000,true] call F_findOpforSpawnPoint;
		if ( _spawn_marker != "" ) then {
			_sector_spawn_pos = [(((markerpos _spawn_marker) select 0) - 500) + (random 1000),(((markerpos _spawn_marker) select 1) - 500) + (random 1000),0];
			if(random 1 >= 0.5) then {
				_grp = createGroup [CONST_SIDE_OPFOR, true];
				{
					_x createUnit [_sector_spawn_pos, _grp,"this addMPEventHandler [""MPKilled"", {call F_unitKilled}]", 0.5, "private"];
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
	sleep 5;
};