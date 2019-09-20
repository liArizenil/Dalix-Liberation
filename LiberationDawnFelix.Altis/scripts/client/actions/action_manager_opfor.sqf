
private [ "_idact_build",  "_idact_arsenal", "_idact_buildfob", "_idact_redeploy", "_idact_tutorial", "_distfob", "_distarsenal",  "_distbuildfob", "_distspawn", "_distredeploy", "_idact_commander", "_idact_exchscore", "_whiskey","_ideh_shooting", "_GroupJoined" ];

_whiskey = getMarkerPos "whiskey";

_idact_build = -1;

GRLIB_removefobboxes = false;

waitUntil { !isNil "build_confirmed" };
waitUntil { !isNil "one_synchro_done" };
waitUntil { one_synchro_done };

while { true } do {
	if ( !([1500,getPos player] call F_getNearestSector) in blufor_sectors && alive player && vehicle player == player) then {
		if ( _idact_build == -1 ) then {
			_idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_build != -1 ) then {
			player removeAction _idact_build;
			_idact_build = -1;
		};
	};

	sleep 1;
};
