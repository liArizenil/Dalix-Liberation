params [ "_vehtorecycle" ];
private [ "_objectinfo", "_cfg", "_dialog", "_recycle_ammo" ];

_objectinfo = ((light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + buildings + captured_vehicles) select { typeof _vehtorecycle == _x select 0 }) select 0;
dorecycle = 0;

_cfg = configFile >> "cfgVehicles";
_dialog = createDialog "liberation_recycle";
waitUntil { dialog };

_recycle_ammo = round ((_objectinfo select 2) * GRLIB_recycling_percentage);

ctrlSetText [ 134, format [ localize "STR_RECYCLING_YIELD", getText (_cfg >> (_objectinfo select 0) >> "displayName" ) ] ];
ctrlSetText [ 131, format [ "%1", round (_objectinfo select 1) ] ];
ctrlSetText [ 132, format [ "%1", _recycle_ammo ] ];
ctrlSetText [ 133, format [ "%1", round ( _objectinfo select 3) ] ];

while { dialog && (alive player) && dorecycle == 0 } do {
	sleep 0.1;
};

if ( dialog ) then { closeDialog 0 };

if ( dorecycle == 1 && !(isnull _vehtorecycle) && alive _vehtorecycle) then {
	[ player ,_vehtorecycle, _recycle_ammo ] remoteExec ["recycle_remote_call",2];
};