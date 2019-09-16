params [ "_veh" ];
private _smoke = createVehicle ["SmokeShellRed", [0,0,0], [], 0 , ""];

if ( _veh isKindOf "Tank" || _veh isKindOf "Air" || _veh isKindOf "APC" || _veh isKindOf "IFV" ) then {

	waitUntil {
		sleep 10;
		!(alive _veh) || ( { alive _x } count (crew _veh) == 0)
	};

	if ( random 100 < 80 ) then {
		_smoke attachTo [_veh, [0,-3,0]];
		sleep 7;
		if ( (alive _veh) && ( { alive _x } count (crew _veh) == 0) ) then {
			_veh setdamage 1;
		};
	};

};
