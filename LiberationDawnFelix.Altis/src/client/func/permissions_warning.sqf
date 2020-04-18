if ( CONST_PLAYER_PERMISSION ) then {

	waitUntil { !(isNil "player_permissions") };

	sleep 5;

	while { count player_permissions == 0 } do {
		hint localize "STR_PERMISSION_WARNING";
		sleep 5;
	};

	hintSilent "";

};