private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_supporttomark", "_marker", "_whiskey" ];

_whiskey = getMarkerPos "whiskey";

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_support_to_skip = [
	ammobox_o_typename,
	"B_Slingload_01_Repair_F",
	"B_Slingload_01_Fuel_F",
	"B_Slingload_01_Ammo_F"
];

{
	_vehtomark pushback (_x select 0);
} foreach light_vehicles + heavy_vehicles + air_vehicles + support_vehicles;

_vehtomark = _vehtomark - _support_to_skip;

while { true } do {

	_markedveh = [];
	{
		if ( (alive _x) && ((typeof _x) in _vehtomark) && (count (crew _x) == 0) && (_x distance lhd > 500) && (_x distance _whiskey > 200) ) then {
			_markedveh pushback _x;
		};
	} foreach vehicles;

	if ( count _markedveh != count _vehmarkers ) then {
		{ deleteMarkerLocal _x; } foreach _vehmarkers;
		_vehmarkers = [];

		{
			_marker = createMarkerLocal [ format [ "markedveh%1" ,_x], markers_reset ];
			_marker setMarkerColorLocal "ColorKhaki";
			_marker setMarkerTypeLocal "mil_dot";
			_marker setMarkerSizeLocal [ 0.75, 0.75 ];private [ "_iconed_groups", "_ticks", "_localgroup", "_grouptype", "_groupicon", "_whiskey"];

_whiskey = getMarkerPos "whiskey";

_iconed_groups = [];
_ticks = 0;

setGroupIconsVisible [true,false];

while { true } do {
	{
		if ((_x != group player) && ((side _x == GRLIB_side_friendly))) then {
			if ( (_x in _iconed_groups) && (
				(count units _x == 0) ||  (side _x == GRLIB_side_friendly && (((leader _x) distance (getmarkerpos GRLIB_respawn_marker) < 100) || ((leader _x) distance _whiskey > 200) || ((leader _x) distance lhd < 500))))) then {
				clearGroupIcons _x;
				_iconed_groups = _iconed_groups - [_x];
			};

			if ( !(_x in _iconed_groups) && (
				(count units _x > 0) &&  (side _x == GRLIB_side_friendly && (((leader _x) distance (getmarkerpos GRLIB_respawn_marker) > 100) && ((leader _x) distance _whiskey > 200) && ((leader _x) distance lhd > 500))))) then {
				clearGroupIcons _x;
				_localgroup = _x;
				_grouptype = [_localgroup] call F_getGroupType;

				clearGroupIcons _x;
				_localgroup = _x;
				_grouptype = [_localgroup] call F_getGroupType;
				_groupicon = "";
				switch (_grouptype) do {
					case "infantry": { _groupicon = "b_inf" };
					case "light": { _groupicon = "b_motor_inf" };
					case "heavy": { _groupicon = "b_armor" };
					case "air": { _groupicon = "b_air" };
					case "support": { _groupicon = "b_maint" };
					case "static": { _groupicon = "b_mortar" };
					case "uav": { _groupicon = "b_uav" };
					default {  };
				};

				_localgroup addGroupIcon [ _groupicon, [ 0,0 ] ];

				if ( side _localgroup == GRLIB_side_friendly ) then {
					_groupiconsize = "group_0";
					_groupsize = (count (units _localgroup));
					if ( _groupsize >= 2 ) then { _groupiconsize = "group_1" };
					if ( _groupsize >= 6 ) then { _groupiconsize = "group_2" };
					if ( _groupsize >= 10 ) then { _groupiconsize = "group_3" };

					_localgroup addGroupIcon [ _groupiconsize, [ 0,0 ] ];
				};

				_iconed_groups pushback _x;
			};
		};
	} foreach allGroups;

	{
		_color = [];
		if ( isplayer leader _x ) then {
			_color = [0.8,0.8,0,1];
		} else {
			_color = [0,0.3,0.8,1];
		};
		_x setGroupIconParams [_color,"",1,true];
	} foreach _iconed_groups;

	_ticks = _ticks + 1;
	if ( _ticks >= 15 ) then {
		_ticks = 0;
		_iconed_groups = [];
	};

	sleep 4.7;
};

			_vehmarkers pushback _marker;
		} foreach _markedveh;
	};

	{
		_marker = _vehmarkers select (_markedveh find _x);
		_marker setMarkerPosLocal getpos _x;
		_marker setMarkerTextLocal  (getText (_cfg >> typeOf _x >> "displayName"));

	} foreach _markedveh;

	sleep 5;
};
