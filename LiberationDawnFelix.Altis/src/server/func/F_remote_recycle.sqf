params [ "_object_recycled", "_price" ];

if ( isNull _object_recycled || !(alive _object_recycled)) exitWith {};

deleteVehicle _object_recycled;

if ( _price > 0 ) then {
	resources_ammo = resources_ammo + _price;
};

[] spawn F_recalcRsc;
stats_vehicles_recycled = stats_vehicles_recycled + 1;