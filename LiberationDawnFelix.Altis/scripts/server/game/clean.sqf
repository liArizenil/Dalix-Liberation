fn_checkDistance ={
	private["_limitDistance","_units","_object","_bool"];
	_limitDistance = _this select 0;
	_units = _this select 1;
	_object = _this select 2;
	_bool = false;
	
	_units = [_units,{(_x distance _object) < _limitDistance}] call BIS_fnc_conditionalSelect;
	if(count(_units) == 0) then {
		_bool = true;
	};
	if(count([] call F_getNearestFob) > 0) then {
		if((_object distance [] call F_getNearestFob) < 125) then{
			_bool = true;
		};
	};
	
	_bool
};
private["_playerUnit"];
_playerUnit = (playableUnits + switchableUnits);

while{true} do {
	//시체 클리너
	{
		deleteVehicle _x;
	} foreach allDead;
	//크레이터 클리너
	
	//아이템 클리너
	{
		if([600,_playerUnit,_x] call fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "WeaponHolder");
	
	//지뢰 클리너
	{
		if([1200,_playerUnit,_x] call fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach allMines;
	
	//고정 화기 클리너
	{
		if([1200,_playerUnit,_x] call fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "StaticWeapon");
	
	//폐허 클리너
	{
		if([1200,_playerUnit,_x] call fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "Ruins");
	
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
	
	sleep 180;
};
