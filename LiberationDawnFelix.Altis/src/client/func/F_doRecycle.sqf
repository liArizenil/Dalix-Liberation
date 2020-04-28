params [ "_vehtorecycle" ];

private _objectinfo = ((light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + buildings + captured_vehicles) select { typeof _vehtorecycle == _x select 0 }) select 0;
dorecycle = 0;

private _cfg = configFile >> "cfgVehicles";
private _dialog = createDialog "ui_recycle";
waitUntil { dialog };

ctrlSetText [ 134, format [ localize "STR_RECYCLING_YIELD", getText (_cfg >> (_objectinfo select 0) >> "displayName" ) ] ];
ctrlSetText [ 131, format [ "%1", round (_objectinfo select 1) ] ];
ctrlSetText [ 132, format [ "%1", round ((_objectinfo select 2) * CONST_RECYCLING_PERCENTAGE) ] ];
ctrlSetText [ 133, format [ "%1", round ( _objectinfo select 3) ] ];

while { dialog && (alive player) && dorecycle == 0 } do {
	sleep 0.1;
};

if ( dialog ) then { closeDialog 0 };

if ( dorecycle == 1 && !(isnull _vehtorecycle) && alive _vehtorecycle) then {
	[ _vehtorecycle,  round ((_objectinfo select 2) * CONST_RECYCLING_PERCENTAGE) ] remoteExec ["recycle_remote_call",2];
	[gamelogic, format["%1님에 의해 FOB %2의 %3이(가) 재활용되었습니다", name player, [[] call F_getNearestFob] call F_getFobName, getText (_cfg >> (_objectinfo select 0) >> "displayName" ) ]] remoteExec ["globalChat",[WEST,civilian]];
};