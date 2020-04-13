private _newManpower = 0;
private _newFuel = 0;
private _whiskey = getmarkerpos "whiskey";
private _unit = objNull;

call F_recalcCaps;

{
	if(side _x == CONST_SIDE_BLUFOR && {!isPlayer _x} && {( _x distance lhd > 250 )} && {( _x distance _whiskey > 100 )} && {( _x distance ( getmarkerpos CONST_RESPAWN_MARKER) > 100 )} && {( alive _x )}) then {
		_unit = _x;
		{
			if ( ( _x select 0 ) == typeof _unit ) exitWith {
				_newManpower = _newManpower + (_x select 1);
				_newFuel = _newFuel + (_x select 3);
			};
		} foreach infantry_units;
	};
} forEach allUnits;

{
	if ( ( _x distance lhd > 250 ) && ( _x distance _whiskey > 100 ) && ( _x distance (getmarkerpos CONST_OPFOR_RESPAWN_MARKER) > 300 ) && ( alive _x ) ) then {
		_unit = _x;
		{
			if ( ( _x select 0 ) == typeof _unit ) exitWith {
				_newManpower = _newManpower + (_x select 1);
				_newFuel = _newFuel + (_x select 3);
			};
		} foreach ( buildings + light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles );
	};
} forEach vehicles;

resources_infantry = _newManpower;
resources_fuel = _newFuel;