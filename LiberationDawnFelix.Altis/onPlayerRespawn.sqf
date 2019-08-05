if(side player == GRLIB_side_friendly) then {
	if ( isNil "GRLIB_respawn_loadout" ) then {
		removeAllWeapons player;
		player linkItem "NVGoggles";
	} else {
		sleep 2;
		[ player, GRLIB_respawn_loadout ] call F_setLoadout;
	};
	if(score player > 0) then {
		[player,(-1*((getPlayerScores player) select 5))] remoteExec ["addScore",2];
	};
};
