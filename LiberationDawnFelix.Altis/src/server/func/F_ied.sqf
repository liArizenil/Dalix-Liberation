params["_sector", "_radius", "_mineclass"];

private _spread = 6;
private _radius_inf = 6.66;
private _radius_veh = 10;
private _ultrastrong = (random 100 < 12);
private _inf_trigger = 2 + floor(random 3);
private _veh_trigger = 1;
private _roadobj = [ (getmarkerpos (_sector)) getPos [ random(_radius), random(360) ] , _radius, [] ] call BIS_fnc_nearestRoad;

if(!isNull _roadobj) then {
	_ied_obj = createMine [ _mineclass, (getpos _roadobj) getPos [ _spread, random(360) ], [], 0];
	_ied_obj setdir (random 360);

	while { _sector in SECTOR_ACTIVE && mineActive _ied_obj } do {
		_nearinf = ((getpos _ied_obj) nearEntities [ "Man", _radius_inf ]) select { side _x == CONST_SIDE_BLUFOR };
		_nearveh = ((getpos _ied_obj) nearEntities [ [ "Car", "Tank", "Air" ], _radius_veh ]) select { side _x == CONST_SIDE_BLUFOR };
		if(_nearinf > _inf_trigger || _nearveh > _veh_trigger) exitWith {
			if(_ultrastrong) then {
				"Bomb_04_F" createVehicle (getpos _ied_obj);
				deleteVehicle _ied_obj;
			}
			else{
				_ied_obj setDamage 1;
			};
			stats_ieds_detonated = stats_ieds_detonated + 1; publicVariable "stats_ieds_detonated";
		};
		sleep 3;
	};
};

terminate _thisScript;