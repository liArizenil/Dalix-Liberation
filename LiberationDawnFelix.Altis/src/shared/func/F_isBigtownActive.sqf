private [ "_is_bigtown_active" ];

_is_bigtown_active = false;

if (!isNil "SECTOR_ACTIVE") then {
	{
		if ( _x in SECTOR_BIGTOWN ) exitWith { _is_bigtown_active = true };
	} foreach SECTOR_ACTIVE;
};

_is_bigtown_active