if(!isServer) exitWith {};
params [ "_unit", "_killer", "_instigator" ];

if( side _killer == CONST_SIDE_BLUFOR ) then {
	if ( SECTOR_BIGTOWN findIf {  (!(_x in SECTOR_BLUFOR)) && ( _unit distance (markerpos _x) < 250 ) } != -1 ) then {
		combat_readiness = combat_readiness + (0.5 * CONST_DIFFICULTY_MODIFIER);
		stats_readiness_earned = stats_readiness_earned + (0.5 * CONST_DIFFICULTY_MODIFIER);
		if ( combat_readiness > 100.0 && CONST_DIFFICULTY_MODIFIER < 2 ) then { combat_readiness = 100.0 };
	};

	if ( _killer isKindOf "Man" ) then {
		infantry_weight = infantry_weight + 1;
		armor_weight = armor_weight - 0.66;
		air_weight = air_weight - 0.66;
	} else {
		if ( (typeof (objectParent _killer) ) in land_vehicles_classnames ) then  {
			infantry_weight = infantry_weight - 0.66;
			armor_weight = armor_weight + 1;
			air_weight = air_weight - 0.66;
		};
		if ( (typeof (objectParent _killer) ) in air_vehicles_classnames ) then  {
			infantry_weight = infantry_weight - 0.66;
			armor_weight = armor_weight - 0.66;
			air_weight = air_weight + 1;
		};
	};
	infantry_weight = [infantry_weight,100] select ( infantry_weight > 100 );
	armor_weight = [armor_weight,100] select ( armor_weight > 100 );
	air_weight = [air_weight,100] select ( air_weight > 100 );
	infantry_weight = [infantry_weight,0] select ( infantry_weight < 0 );
	armor_weight = [armor_weight,0] select ( infantry_weight < 0 );
	air_weight = [air_weight,0] select ( infantry_weight < 0 );
};

if ( isPlayer _unit ) then { stats_player_deaths = stats_player_deaths + 1 };

if ( _unit isKindOf "Man" ) then {
	if(side group _unit == CONST_SIDE_CIV) then {
		stats_civilians_killed = stats_civilians_killed + 1;
		if(isPlayer _killer) then {
			stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;
			if(CONST_CIV_PENALTIES) then {
				if(side group _killer == CONST_SIDE_BLUFOR) then {
					resources_ammo = [(resources_ammo - 200),0] select ((resources_ammo - 200) < 0);
				};
				if(side group _killer == CONST_SIDE_OPFOR) then {
					combat_readiness = [(combat_readiness - 200),0] select ((combat_readiness - 200) < 0);
				};
				[ name _unit,  _killer ] remoteExec ["remote_call_civ_penalty",-2];
			};
		};
	};
	if(side group _killer == CONST_SIDE_BLUFOR) then {
		if(side group _unit == CONST_SIDE_OPFOR) then {
			stats_opfor_soldiers_killed = stats_opfor_soldiers_killed + 1;
			if(isPlayer _killer) then {stats_opfor_killed_by_players = stats_opfor_killed_by_players + 1;};
		};
		if(side group _unit == CONST_SIDE_BLUFOR) then {stats_blufor_teamkills = stats_blufor_teamkills + 1;};
	}
	else{
		if(side group _unit == CONST_SIDE_BLUFOR) then {stats_blufor_soldiers_killed = stats_blufor_soldiers_killed + 1;};
	};
}
else{
	if(typeOf _unit in all_hostile_classnames) then {
		stats_opfor_vehicles_killed = stats_opfor_vehicles_killed + 1;
		if(isPlayer _killer && side group _killer == CONST_SIDE_BLUFOR) then {
			stats_opfor_vehicles_killed_by_players = stats_opfor_vehicles_killed_by_players + 1;
			if(CONST_AMMO_BOUNTIES) then {
				private _bounty = 5;
				_bounty = [_bounty,20] select (_unit isKindOf "Air");
				_bounty = [_bounty,10] select (_unit isKindOf "Tank");

				resources_ammo = resources_ammo + _bounty;

				[ typeOf _unit, _bounty, _killer ] remoteExec ["remote_call_ammo_bounty",-2];
			};
		};
	}
	else{stats_blufor_vehicles_killed = stats_blufor_vehicles_killed + 1;};
};

if(!isPlayer _unit) exitWith {
	if ( ((typeof _unit) in [ammobox_o_typename, ammobox_b_typename]) && ((getPosATL _unit) select 2 < 10) ) then {
		( "R_80mm_HE" createVehicle (getPosATL _unit) ) setVelocity [0, 0, -200];
		deleteVehicle _unit;
	} else {
		sleep GRLIB_cleanup_delay;
		hidebody _unit;
		sleep 10;
		deleteVehicle _unit;
	};
};