while { true } do {
	{ [_x] call F_setSkill } foreach ( allUnits select { local _x && !isplayer _x } );
	sleep 15;
};