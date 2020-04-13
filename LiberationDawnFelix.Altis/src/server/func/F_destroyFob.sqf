private _fobposdestroy = _this select 0;

private _classnames_to_destroy = [FOB_typename];
{
	_classnames_to_destroy = _classnames_to_destroy + [(_x select 0)];
} foreach buildings;

_nextbuildingsdestroy = (_fobposdestroy nearobjects 150) select { getObjectType _x >= 8 };
private _all_buildings_to_destroy = [];
{
	if ( (typeof _x) in _classnames_to_destroy ) then {
		_all_buildings_to_destroy = _all_buildings_to_destroy + [_x];
	};
} foreach _nextbuildingsdestroy;

{
	_x setdamage 1;
	sleep (random 3);
} foreach _all_buildings_to_destroy;

sleep 60;

{
	deleteVehicle _x;
} foreach _all_buildings_to_destroy;