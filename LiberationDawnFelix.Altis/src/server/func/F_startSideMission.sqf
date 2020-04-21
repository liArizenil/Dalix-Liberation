if(isNil "ARIZN_SIDE_PROGRESS") then {ARIZN_SIDE_PROGRESS = false;};
if (ARIZN_SIDE_PROGRESS) exitWith {};
if (isNil "used_positions") then { used_positions = []; };
private _starter = _this select 0;
private _pos = [2000,999999,false] call F_findOpforSpawnPoint;

if(count _pos > 0) then { 
	ARIZN_SIDE_PROGRESS = true; publicVariable "ARIZN_SIDE_PROGRESS";
	ARIZN_SIDE_TASKS = [];
	ARIZN_SIDE_OBJS = [];
	resources_intel = resources_intel - 20;

	format["%1님이 사이드 미션을 시작하셨습니다.",_starter] remoteExec ["systemChat",-2];

	private _sidecount = selectRandom [1,2,3];
	for "_i" from 1 to _sidecount do { 
		_task = selectRandom Secondary_Sides;
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
	"사이드 미션을 시작하기 위한 장소를 찾을 수 없습니다." remoteExec ["systemChat",-2];
};

terminate _thisScript;