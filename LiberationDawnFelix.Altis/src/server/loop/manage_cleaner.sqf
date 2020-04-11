private["_playerUnit", "_reset_ticker" , "_removeRange"];

_removeRange = CONST_FOB_RANGE * 4;

while{true} do {
	uisleep 60;
	
	_playerUnit = (playableUnits + switchableUnits);
	{
		private _veh = _x;
		{_veh deleteVehicleCrew _x} forEach crew _veh;
		deleteVehicle _x;
	} forEach (allDead-allDeadMen) ;

	{ deleteVehicle _x; } forEach allDeadMen;

	{
		if(!(isPlayer _x) && (surfaceIsWater position _x) && ((position _x) select 2) < 0) then {
			deleteVehicle _x;
		};
	} forEach allUnits;
	
	//아이템 클리너
	[_playerUnit, allMissionObjects "WeaponHolder"] execVM "src\server\func\F_Cleaner.sqf";
	[_playerUnit, allMissionObjects "StaticWeapon"] execVM "src\server\func\F_Cleaner.sqf";
	[_playerUnit, allMissionObjects "Ruins"] execVM "src\server\func\F_Cleaner.sqf";
			
	//지뢰 클리너
	{
		if([1200,_playerUnit,_x] call fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach allMines;
	//빈 그룹 클리너
	{
		if (count(units(_x)) == 0) then { 
        	deleteGroup(_x);
		};
	} forEach allGroups;

	{
		_reset_ticker = true;
		_nearestfob = [ getpos _x ] call F_getNearestFob;
		if ( count _nearestfob == 3 ) then {
			if ( ( _x distance _nearestfob > _removeRange ) && ( _x distance lhd > _removeRange ) ) then {
				if ( count ( crew _x ) == 0 ) then {
					_x setVariable [ "GRLIB_empty_vehicle_ticker", ( _x getVariable [ "GRLIB_empty_vehicle_ticker", 0 ] ) + 1 ];
					_reset_ticker = false;
				};
			};
		} ;

		if ( _reset_ticker ) then {
			_x setVariable  [ "GRLIB_empty_vehicle_ticker", 0 ];
		};

		if ( _x getVariable [ "GRLIB_empty_vehicle_ticker", 0 ] >= 10 ) then {
			deleteVehicle _x;
		};
	} foreach vehicles;
};
