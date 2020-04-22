sleep 5;

_blufor_bigtowns = SECTOR_BIGTOWN select { _x in SECTOR_BLUFOR };


if ( count _blufor_bigtowns == count SECTOR_BIGTOWN ) then {
	endgame = true;
	publicVariable "endgame";
	{ _x allowDamage false; (vehicle _x) allowDamage false; } foreach allPlayers;

	publicstats = [];
	publicstats pushback stats_opfor_soldiers_killed;
	publicstats pushback stats_opfor_killed_by_players;
	publicstats pushback stats_blufor_soldiers_killed;
	publicstats pushback stats_player_deaths;
	publicstats pushback stats_opfor_vehicles_killed;
	publicstats pushback stats_opfor_vehicles_killed_by_players;
	publicstats pushback stats_blufor_vehicles_killed;
	publicstats pushback stats_blufor_soldiers_recruited;
	publicstats pushback stats_blufor_vehicles_built;
	publicstats pushback stats_civilians_killed;
	publicstats pushback stats_civilians_killed_by_players;
	publicstats pushback stats_sectors_liberated;
	publicstats pushback stats_playtime;
	publicstats pushback stats_spartan_respawns;
	publicstats pushback stats_secondary_objectives;
	publicstats pushback stats_hostile_battlegroups;
	publicstats pushback stats_ieds_detonated;
	publicstats pushback stats_saves_performed;
	publicstats pushback stats_saves_loaded;
	publicstats pushback stats_reinforcements_called;
	publicstats pushback stats_prisonners_captured;
	publicstats pushback stats_blufor_teamkills;
	publicstats pushback stats_vehicles_recycled;
	publicstats pushback stats_ammo_spent;
	publicstats pushback stats_sectors_lost;
	publicstats pushback stats_fobs_built;
	publicstats pushback stats_fobs_lost;
	publicstats pushback (round stats_readiness_earned);

	[ publicstats ] remoteExec ["remote_call_endgame"];


	sleep 20;

	{ if ( !(isPlayer _x)) then { deleteVehicle _x } } foreach allUnits;

	"서버가 3분 후에 리스타트 됩니다." remoteExec ["systemChat"];
	sleep 180;
	(profileNamespace getVariable ["SERVER_COMMAND_PASSWORD",""]) serverCommand "#restart";
};