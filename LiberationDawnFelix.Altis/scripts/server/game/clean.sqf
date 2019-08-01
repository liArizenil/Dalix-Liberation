private ["_WeaponHolder","_StaticWeapon","_Ruins"];

sleep 120;

fn_checkDistance = {
	private["_limitDistance","_units","_object","_bool"];
	_limitDistance = _this select 0;
	_units = _this select 1;
	_object = _this select 2;
	_bool = false;
	
	_units = [_units,{((_x distance _object) < _limitDistance) && isPlayer _x}] call BIS_fnc_conditionalSelect;
	if(count(_units) == 0) then {
		_bool = true;
	};
	if(count([] call F_getNearestFob) > 0) then {
		if((_object distance ([] call F_getNearestFob)) < 125) then{
			_bool = true;
		};
	};
	_bool
};
private["_playerUnit"];

while{true} do {
	_playerUnit = (playableUnits + switchableUnits);

	if ((count(_playerUnit)) >= 20) then {
		sleep 70;
	} else {
		sleep 240;
	};
	//시체 클리너
	{
		deleteVehicle _x;
	} forEach allDeadMen;
	{
		private _veh = _x;
		{_veh deleteVehicleCrew _x} forEach crew _veh;
		deleteVehicle _x;
	} forEach (allDead-allDeadMen) ;
	//AI 클리너(수중에 있는 AI 삭제)
	{
		if(!(isPlayer _x) && (surfaceIsWater position _x) && ((position _x) select 2) < 1) then {
			deleteVehicle _x;
		};
	} forEach allUnits;
	//크레이터 클리너(작동 안함)
	
	//아이템 클리너
	[_playerUnit] spawn compile '
		params ["_playerUnit"];
		_WeaponHolder = allMissionObjects "WeaponHolder";
		diag_log format["WeaponHolder : %1", _WeaponHolder];
		{
			if([600,_playerUnit,_x] call fn_checkDistance) then {
				deleteVehicle _x;
			};
		} forEach _WeaponHolder;
	';	
	//지뢰 클리너
	{
		if([1200,_playerUnit,_x] call fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach allMines;
	
	[_playerUnit] spawn compile '
		params ["_playerUnit"];
		_StaticWeapon = allMissionObjects "StaticWeapon";
		diag_log format["StaticWeapon : %1", _StaticWeapon];
		{
			if(!(alive _x)) then {
				deleteVehicle _x;
			};
		} forEach _StaticWeapon;
	';	
	
	[_playerUnit] spawn compile '
		params ["_playerUnit"];
		_Ruins = allMissionObjects "Ruins";
		diag_log format["Ruins : %1", _Ruins];
		//폐허 클리너
		{
			if([1200,_playerUnit,_x] call fn_checkDistance) then {
				deleteVehicle _x;
			};
		} forEach _Ruins;
	';
	
	//트리거 클리너
	{
		if ((_x distance [0,0,0]) < 1) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "EmptyDetector");
	
	//빈 그룹 클리너
	{
		if (count(units(_x)) == 0) then { 
        		deleteGroup(_x);
		};
	} forEach allGroups;
	
	diag_log "Cleaner Done.";
};
