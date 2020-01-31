params [ "_vehtorecycle" ];
private [ "_objectinfo", "_cfg", "_dialog" ];

_objectinfo = ((light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + buildings + captured_vehicles) select { typeof _vehtorecycle == _x select 0 }) select 0;
dorecycle = 0;

_cfg = configFile >> "cfgVehicles";
_dialog = createDialog "liberation_recycle";
waitUntil { dialog };

ctrlSetText [ 134, format [ localize "STR_RECYCLING_YIELD", getText (_cfg >> (_objectinfo select 0) >> "displayName" ) ] ];
ctrlSetText [ 131, format [ "%1", round (_objectinfo select 1) ] ];
ctrlSetText [ 132, format [ "%1", round ((_objectinfo select 2) * GRLIB_recycling_percentage) ] ];
ctrlSetText [ 133, format [ "%1", round ( _objectinfo select 3) ] ];

while { dialog && (alive player) && dorecycle == 0 } do {
	sleep 0.1;
};

if ( dialog ) then { closeDialog 0 };

if ( dorecycle == 1 && !(isnull _vehtorecycle) && alive _vehtorecycle) then {
	[ _vehtorecycle,  round ((_objectinfo select 2) * GRLIB_recycling_percentage) ] remoteExec ["recycle_remote_call",2];
	[gamelogic, format["%1 님에 의해 FOB %2 의 %3가 재활용되었습니다", name player, [[] call F_getNearestFob] call F_getFobName, getText (_cfg >> (_objectinfo select 0) >> "displayName" ) ]] remoteExec ["sideChat",[WEST,civilian]];
};