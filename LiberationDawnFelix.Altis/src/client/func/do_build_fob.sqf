private [ "_minfobdist", "_minsectordist", "_distfob", "_clearedtobuildfob", "_distsector", "_clearedtobuildsector", "_idx" ];

if ( count FOB_ALL >= CONST_MAX_FOBS ) exitWith {
	hint format [ localize "STR_HINT_FOBS_EXCEEDED", CONST_MAX_FOBS ];
};
_minfobdist = 1000;
_distfob = 1;
_clearedtobuildfob = true;
_distsector = 1;
_clearedtobuildsector = true;

_idx = 0;
while { (_idx < (count FOB_ALL)) && _clearedtobuildfob } do {
	if ( player distance (FOB_ALL select _idx) < _minfobdist ) then {
		_clearedtobuildfob = false;
		_distfob = player distance (FOB_ALL select _idx);
	};
	_idx = _idx + 1;
};

_idx = 0;
if(_clearedtobuildfob) then {
	 {
		if(_x in SECTOR_BLUFOR) then {
			_minsectordist = CONST_CAPTURE_SIZE + GRLIB_fob_range + 100;
		}
		else{
			_minsectordist = CONST_CAPTURE_SIZE + GRLIB_fob_range + 700;
		};
		if ( player distance (getmarkerpos _x) < _minsectordist ) exitWith {
			_clearedtobuildsector = false;
			_distsector = player distance (getmarkerpos _x);
		};
	} forEach SECTOR_ALL;
};

if (!_clearedtobuildfob) then {
	hint format [localize "STR_FOB_BUILDING_IMPOSSIBLE",floor _minfobdist,floor _distfob];
} else {
	if ( !_clearedtobuildsector ) then {
		hint format [localize "STR_FOB_BUILDING_IMPOSSIBLE_SECTOR",floor _minsectordist,floor _distsector];
	} else {
		buildtype = 99;
		dobuild = 1;
	};
};
