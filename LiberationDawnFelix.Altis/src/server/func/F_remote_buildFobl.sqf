params [ "_new_fob", "_create_fob_building" ];
private [ "_fob_building", "_fob_pos" ];

FOB_ALL pushback _new_fob;
publicVariable "FOB_ALL";

if ( _create_fob_building ) then {
	_fob_pos = [ (_new_fob select 0) + 20, (_new_fob select 1) + 2, 0 ];
	_fob_building = FOB_typename createVehicle _fob_pos;
	_fob_building setpos _fob_pos;
	_fob_building setVectorUp [0,0,1];
	sleep 1;
};

[] spawn F_saveGames;

sleep 3;
[ _new_fob, 0 ] remoteExec ["remote_call_fob", -2];

stats_fobs_built = stats_fobs_built + 1;