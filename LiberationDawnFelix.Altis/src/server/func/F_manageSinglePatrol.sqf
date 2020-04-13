params [ "_grp" ];
[_grp] spawn F_AI_patrol;
_started_time = time;

if ( local _grp ) then {
	_headless_client = [] call F_lessLoadedHC;
	if ( !isNull _headless_client ) then {
		_grp setGroupOwner ( owner _headless_client );
	};
};

while { true } do {
	sleep 60;
	if ( count (units _grp) == 0  ) exitWith {};
	if ( time - _started_time > 900 ) then {
		if ( [ getpos (leader _grp) , 4000 , CONST_SIDE_BLUFOR ] call F_getUnitsCount == 0 ) exitWith {
			{
				if ( vehicle _x != _x ) then {
					[ (vehicle _x) ] call F_cleanOpforVehicle;
				};
				deleteVehicle _x;
			} foreach (units _grp);
		};
	};
};
terminate _thisScript;