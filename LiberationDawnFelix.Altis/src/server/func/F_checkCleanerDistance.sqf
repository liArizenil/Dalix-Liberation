params ["_limitDistance","_units","_object"];
private _bool = false;

_units = _units select {((_x distance _object) < _limitDistance) && isPlayer _x};
if(count(_units) == 0) then {
	_bool = true;
};
if(count(FOB_ALL) > 0) then {
	if((_object distance ([ getpos _object ] call F_getNearestFob)) < 125) then{
		_bool = true;
	};
};
_bool