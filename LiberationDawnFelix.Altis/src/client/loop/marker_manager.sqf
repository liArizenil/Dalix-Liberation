private [ "_marker", "_iconed_groups", "_grouptype", "_groupsize" , "_groupicon", "_color", "_fob_markers", "_respawn_trucks", "_markers_mobilespawns", "_huronlocal", "_ticks", "_hostile_markers" ];

_iconed_groups = [];
_fob_markers = [];
_respawn_trucks = [];
_markers_mobilespawns = [];
_hostile_markers = [];
_ticks = 0;


waitUntil { !isNil "FOB_ALL" && !isNil "SECTOR_BLUFOR" };

while { true } do {
	//======== GROUP ICON ========
	{
		if (side _x == CONST_SIDE_BLUFOR) then {
			if((_x in _iconed_groups) && ((count units _x == 0) || ((leader _x) distance (getmarkerpos CONST_RESPAWN_MARKER)) < 100)) then {
				clearGroupIcons _x;
				_iconed_groups = _iconed_groups - [_x];
			};
			if(!(_x in _iconed_groups) && ((count units _x > 0) && ((leader _x) distance (getmarkerpos CONST_RESPAWN_MARKER)) > 100)) then {
				clearGroupIcons _x;
				_grouptype = [_x] call F_getGroupType;
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

				_x addGroupIcon [ _groupicon, [ 0,0 ] ];

				if(side _x == CONST_SIDE_BLUFOR) then {
					_groupicon = "group_0";
					_groupsize = (count (units _x));
					if( _groupsize < 10) then { _groupicon = format["group_%1",_groupsize]; } else { _groupicon = "group_10" };
					_x addGroupIcon [ _groupicon, [ 0,0 ] ];
				};
				_iconed_groups pushback _x;
			};
		};
	} foreach allGroups;

	{
		_color = [];
		if(isplayer leader _x) then {
			_color = [0.8,0.8,0,1];
		} else {
			_color = [0,0.3,0.8,1];
		};
		if(_x == group player) then {
			_color = [0.1,0.8,0.1,1];
		};
		_x setGroupIconParams [_color,"",1,true];
	} foreach _iconed_groups;

	//======== FOB MARKER ========
	if ( count _fob_markers != count FOB_ALL ) then {
		{ deleteMarkerLocal _x } foreach _fob_markers;
		_fob_markers = [];
		{
			_marker = createMarkerLocal [format ["fobmarker%1",_forEachIndex], markers_reset];
			_marker setMarkerTypeLocal "b_hq";
			_marker setMarkerSizeLocal [ 1.5, 1.5 ];
			_marker setMarkerPosLocal _x;
			_marker setMarkerTextLocal format ["FOB %1",military_alphabet select _forEachIndex];
			_marker setMarkerColorLocal "ColorYellow";
			_fob_markers pushback _marker;
		} forEach FOB_ALL;
	};

	_respawn_trucks = call F_getMobileRespawns;
	if ( count _markers_mobilespawns != count _respawn_trucks ) then {
		{ deleteMarkerLocal _x; } foreach _markers_mobilespawns;
		_markers_mobilespawns = [];
		{
			_marker = createMarkerLocal [format ["mobilespawn%1",_forEachIndex], _x];
			_marker setMarkerTypeLocal "mil_end";
			_marker setMarkerColorLocal "ColorYellow";
			_markers_mobilespawns pushback _marker;
		} forEach _respawn_trucks;
	} else {
		{
			_x setMarkerPosLocal getpos (_respawn_trucks select _forEachIndex);
			_x setMarkerTextLocal format ["%1 %2",localize "STR_RESPAWN_TRUCK",mapGridPosition (_respawn_trucks select _forEachIndex)];
		} forEach _markers_mobilespawns;
	};

	//======== SPARTAN MARKER ========
	_huronlocal = [] call F_spartanScan;
	if ( !( isNull _huronlocal) ) then {
		"huronmarker" setmarkerposlocal (getpos _huronlocal);
	} else {
		"huronmarker" setmarkerposlocal markers_reset;
	};

	_ticks = _ticks + 1;

	if(_ticks >= 15 ) then {
		_ticks = 0;
		_iconed_groups = [];

		//======== HOSTILE GROUP MARKER ========
		{ deleteMarkerLocal _x } foreach _hostile_markers;
		_hostile_markers = [];

		{
			if(!(_x in [CONST_SIDE_CIV,CONST_SIDE_RESIST]) && (side _x != side player) && (({ !captive _x } count ( units _x ) ) > 0)) then {
				if([(getpos leader _x), side player, CONST_RADIOTOWER_SIZE] call F_getNearestTower != "") then {
					_marker = createMarkerLocal [format ["hostilegroup%1",_x], markers_reset];
					_marker setMarkerColorLocal CONST_COLOR_OPFOR_BRIGHT;
					_marker setMarkerTypeLocal "mil_warning";
					_marker setMarkerSizeLocal [ 0.65, 0.65 ];
					_marker setMarkerPosLocal ((leader _x) getPos [ random 50, random 360 ]);
					_hostile_markers pushback _marker;
				};
			};
		} foreach allGroups;
	};

	sleep 4;
};
