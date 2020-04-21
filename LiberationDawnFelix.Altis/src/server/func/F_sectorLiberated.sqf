params [ "_liberated_sector" ];
_combat_readiness_increase = 0;

if ( _liberated_sector in SECTOR_BIGTOWN ) then {
	_combat_readiness_increase = (floor (random 10)) * CONST_DIFFICULTY_MODIFIER;
};
if ( _liberated_sector in SECTOR_CAPTURE ) then {
	_combat_readiness_increase = (floor (random 6)) * CONST_DIFFICULTY_MODIFIER;
};
if ( _liberated_sector in SECTOR_MILITARY ) then {
	_combat_readiness_increase = (5 + (floor (random 11))) * CONST_DIFFICULTY_MODIFIER;
};
if ( _liberated_sector in SECTOR_FACTORY ) then {
	_combat_readiness_increase = (3 + (floor (random 7))) * CONST_DIFFICULTY_MODIFIER;
};
if ( _liberated_sector in SECTOR_TOWER ) then {
	_combat_readiness_increase = (floor (random 4));
};
if ( CONST_PASSIVE_INCOME ) then {
	resources_ammo = resources_ammo + (floor (75 + (random 50)));
};
combat_readiness = combat_readiness + _combat_readiness_increase;
if ( combat_readiness > 100.0 && CONST_DIFFICULTY_MODIFIER <= 2.0 ) then { combat_readiness = 100.0 };
stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
[ _liberated_sector, 0, 0 ] remoteExec ["remote_call_sector", -2];
reset_battlegroups_ai = true; publicVariable "reset_battlegroups_ai";

SECTOR_BLUFOR pushback _liberated_sector; publicVariable "SECTOR_BLUFOR";
stats_sectors_liberated = stats_sectors_liberated + 1;

[] call F_recalcCaps;
[] spawn F_checkVictory;

sleep 1;

trigger_server_save = true;

sleep 45;

if ( !endgame ) then {
	if ( (!( _liberated_sector in SECTOR_TOWER )) && (((random (200.0 / (CONST_DIFFICULTY_MODIFIER * CONST_CSAT_AGGRESSIVITY) )) < (combat_readiness - 20)) || ( _liberated_sector in SECTOR_BIGTOWN )) && ([] call F_opforCap < GRLIB_battlegroup_cap) ) then {
		[ _liberated_sector ] spawn spawn_battlegroup;
	};
};
