private [ "_sector_count", "_vehicle_unlock_markers", "_marker", "_nextbase", "_nextvehicle", "_cfg", "_nextmarker" ];

//F로 뺴서 remotecall로 작동하게 할것
waitUntil { !isNil "SECTOR_ALL" };
waitUntil { !isNil "SAVE_LOADED" };
waitUntil { !isNil "SECTOR_BLUFOR" };

_vehicle_unlock_markers = [];
_cfg = configFile >> "cfgVehicles";

{
	_nextvehicle = _x select 0;
	_nextbase = _x select 1;
	_marker = createMarkerLocal [format ["vehicleunlockmarker%1",_nextbase], [ markerpos _nextbase select 0, (markerpos _nextbase select 1) + 125]];
	_marker setMarkerTextLocal ( getText (_cfg >> _nextvehicle >> "displayName") );
	_marker setMarkerColorLocal GRLIB_color_enemy;
	_marker setMarkerTypeLocal "mil_pickup";
	_vehicle_unlock_markers pushback [ _marker, _nextbase ];
} foreach ELITE_VEHICLES_LINK;


_sector_count = -1;

uiSleep 1;

while { true } do {
	waitUntil {
		uiSleep 1;
		count SECTOR_BLUFOR != _sector_count
	};

	{ _x setMarkerColorLocal GRLIB_color_enemy; } foreach (SECTOR_ALL - SECTOR_BLUFOR);
	{ _x setMarkerColorLocal GRLIB_color_friendly; } foreach SECTOR_BLUFOR;

	{
		_nextmarker = _x;
		(_nextmarker select 0) setMarkerColorLocal GRLIB_color_enemy;
		{
			if ( _x == (_nextmarker select 1) ) exitWith { (_nextmarker select 0) setMarkerColorLocal GRLIB_color_friendly; };
		} foreach SECTOR_BLUFOR;
	} foreach _vehicle_unlock_markers;
	_sector_count = count SECTOR_BLUFOR;
};