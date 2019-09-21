private [ "_idact_build", "_idact_halo", "_nearsector"];

_idact_build = -1;
_idact_halo = -1;

waitUntil { !isNil "build_confirmed" };
waitUntil { !isNil "one_synchro_done" };
waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { one_synchro_done };

GRLIB_deploy_timer = GRLIB_Opfor_respawn_timer;
[missionNamespace, "arsenalClosed", {
    GRLIB_respawn_loadout = [ player, ["repetitive"] ] call F_getLoadout;
}] call BIS_fnc_addScriptedEventHandler;
[ missionNamespace, "arsenalOpened", {
    disableSerialization;
    _display = _this select 0;
    {
        ( _display displayCtrl _x ) ctrlSetText "Disabled";
        ( _display displayCtrl _x ) ctrlSetTextColor [ 1, 0, 0, 0.5 ];
        ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";
    }forEach [ 44146, 44147 ];
} ] call BIS_fnc_addScriptedEventHandler;

player addEventHandler ["Killed",{ GRLIB_deploy_timer = GRLIB_Opfor_respawn_timer; }];

if ( count GRLIB_all_fobs < 1 ) then {
	["Opforneedfob", false, false,false,false] call BIS_fnc_endMission;
};

[] spawn {
	format [ "%1님이 대항군에 참여하셨습니다.", name player] remoteExec ["systemChat"];
	sleep 3600;
	waitUntil {sleep 1; !alive player;};
	[name player] remoteExec ["kickplayer_remote_call",2];
};
[] spawn {
	while { true } do {
		if(GRLIB_deploy_timer > 0) then {
			GRLIB_deploy_timer = GRLIB_deploy_timer - 1;
		};
		sleep 1;
	};
};

GRLIB_respawn_loadout = [ player, ["repetitive"] ] call F_getLoadout;

while { true } do {
	_nearsector = [1500,getPos player] call F_getNearestSector;
	if ( !(_nearsector in blufor_sectors) && _nearsector != "" && alive player && vehicle player == player) then {
		if ( _idact_build == -1 ) then {
			_idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu_opfor.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_build != -1 ) then {
			player removeAction _idact_build;
			_idact_build = -1;
		};
	};
	if ( (player distance (getMarkerpos "respawn_east")) < 50 && alive player && vehicle player == player && GRLIB_halo_param > 0) then {
		if ( _idact_halo == -1 ) then {
			_idact_halo = player addAction ["<t color='#80FF80'>" + localize "STR_HALO_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\spawn\do_halo_opfor.sqf","",-749,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_halo != -1 ) then {
			player removeAction _idact_halo;
			_idact_halo = -1;
		};
	};
	sleep 1;
};
