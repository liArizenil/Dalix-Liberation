private [ "_minfobdist", "_minsectordist", "_distfob", "_clearedtobuildfob", "_distsector", "_clearedtobuildsector", "_idx" ];

if ( count GRLIB_all_fobs >= GRLIB_maximum_fobs ) exitWith {
	hint format [ localize "STR_HINT_FOBS_EXCEEDED", GRLIB_maximum_fobs ];
};
_minfobdist = 3000;
_distfob = 1;
_clearedtobuildfob = true;
_distsector = 1;
_clearedtobuildsector = true;

_idx = 0;
while { (_idx < (count GRLIB_all_fobs)) && _clearedtobuildfob } do {
	if ( player distance (GRLIB_all_fobs select _idx) < _minfobdist ) then {
		_clearedtobuildfob = false;
		_distfob = player distance (GRLIB_all_fobs select _idx);
	};
	_idx = _idx + 1;
};

_idx = 0;
if(_clearedtobuildfob) then {
	 {
		if(_x in blufor_sectors) then {
			_minsectordist = GRLIB_capture_size + GRLIB_fob_range + 100;
		}
		else{
			_minsectordist = GRLIB_capture_size + GRLIB_fob_range + 700;
		};
		if ( player distance (getmarkerpos _x) < _minsectordist ) exitWith {
			_clearedtobuildsector = false;
			_distsector = player distance (getmarkerpos _x);
		};
	} forEach sectors_allSectors;
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
