if ( CONST_REMOTE_SENSORS == 0 ) exitWith {};

sleep 10;

while { true } do {

	if ( getRemoteSensorsDisabled ) then {
		if ( CONST_REMOTE_SENSORS == 1 ) then {
			if ( { (local _x) && !(isPlayer _x) } count allUnits > 0 ) then {
				disableRemoteSensors false;
				hint "Remote sensors ENABLED";
			};
		};
	} else {

		private [ "_disable" ];
		_disable = false;

		if ( CONST_REMOTE_SENSORS == 2 ) then {
			_disable = true;
		} else {
			if ( { (local _x) && !(isPlayer _x) } count allUnits == 0 ) then {
				_disable = true;
			};
		};

		if ( _disable ) then {
			disableRemoteSensors true;
			hint "Remote sensors DISABLED";
		};
	};

	sleep 15;
};