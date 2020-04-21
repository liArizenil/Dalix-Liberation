if(isNil "ARIZN_SIDE_PROGRESS") then {ARIZN_SIDE_PROGRESS = false;};
if (ARIZN_SIDE_PROGRESS) exitWith {};
private _starter = _this select 0;

//find good position


private _pos = POS_OPFOR select {!(_x in used_positions)}; 

if(count _pos > 0) then {
	ARIZN_SIDE_PROGRESS = true; publicVariable "ARIZN_SIDE_PROGRESS";
	resources_intel = resources_intel - 20;

	private _sidecount = selectRandom [1,2,3];
	for "_i" from 1 to _sidecount do { 
		_task = selectRandom Side_secondary;
		[_pos] spawn _task;
	};

	waitUntil{sleep 5; count ARIZN_SIDE_TASKS == _sidecount};
	waitUntil { sleep 20;
		({!([_x] call BIS_fnc_taskCompleted)} findIf ARIZN_SIDE_TASKS == -1) || !ARIZN_SIDE_PROGRESS || (CONST_SIDE_BLUFOR countSide allPlayers) < 2
	};

	{_x call BIS_fnc_deleteTask;} forEach ARIZN_SIDE_TASKS;
	{deleteVehicle _x;} forEach ARIZN_SIDE_OBJS;

	ARIZN_SIDE_PROGRESS = false; publicVariable "ARIZN_SIDE_PROGRESS";
}else{
	
};

terminate _thisScript;