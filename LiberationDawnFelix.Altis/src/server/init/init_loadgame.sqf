if ( !(isNil "CONST_WIPE_SAVE1") && !(isNil "CONST_WIPE_SAVE2") ) then {
	if ( CONST_WIPE_SAVE1 == 1 && CONST_WIPE_SAVE2 == 1 ) then {
		profileNamespace setVariable [ CONST_SAVE_KEY,nil ];
		saveProfileNamespace;
	};
};

date_year = date select 0;
date_month = date select 1;
date_day = date select 2;
SECTOR_BLUFOR = [];
FOB_ALL = [];
buildings_to_save= [];
combat_readiness = 0;
saved_ammo_res = 0;
stats_opfor_soldiers_killed = 0;
stats_opfor_killed_by_players = 0;
stats_blufor_soldiers_killed = 0;
stats_player_deaths = 0;
stats_opfor_vehicles_killed = 0;
stats_opfor_vehicles_killed_by_players = 0;
stats_blufor_vehicles_killed = 0;
stats_blufor_soldiers_recruited = 0;
stats_blufor_vehicles_built = 0;
stats_civilians_killed = 0;
stats_civilians_killed_by_players = 0;
stats_sectors_liberated = 0;
stats_playtime = 0;
stats_spartan_respawns = 0;
stats_secondary_objectives = 0;
stats_hostile_battlegroups = 0;
stats_ieds_detonated = 0; publicVariable "stats_ieds_detonated";
stats_saves_performed = 0;
stats_saves_loaded = 0;
stats_reinforcements_called = 0;
stats_prisonners_captured = 0;
stats_blufor_teamkills = 0;
stats_vehicles_recycled = 0;
stats_ammo_spent = 0;
stats_sectors_lost = 0;
stats_fobs_built = 0;
stats_fobs_lost = 0;
stats_readiness_earned = 0;
infantry_weight = 33;
armor_weight = 33;
air_weight = 33;
ELITE_VEHICLES_LINK = [];
PLAYER_PERMISSIONS = [];
ai_groups = [];
saved_intel_res = 0;
player_scores = [];

no_kill_handler_classnames = [FOB_typename, huron_typename];
_classnames_to_save = [FOB_typename, huron_typename];
_classnames_to_save_blu = [];
_building_classnames = [FOB_typename];
{
	no_kill_handler_classnames pushback (_x select 0);
	_classnames_to_save pushback (_x select 0);
	_building_classnames pushback (_x select 0);
} foreach buildings;

{
	_classnames_to_save_blu pushback (_x select 0);
} foreach (static_vehicles + air_vehicles + heavy_vehicles + light_vehicles + support_vehicles);

_classnames_to_save = _classnames_to_save + _classnames_to_save_blu + all_hostile_classnames;

_saves = profileNamespace getVariable CONST_SAVE_KEY;

if ( !isNil "_saves" ) then {

	SECTOR_BLUFOR = _saves select 0;
	FOB_ALL = _saves select 1;
	buildings_to_save = _saves select 2;
	time_of_day = _saves select 3;
	combat_readiness = _saves select 4;
	saved_ammo_res = _saves select 8;

	_stats = _saves select 9;
	stats_opfor_soldiers_killed = _stats select 0;
	stats_opfor_killed_by_players = _stats select 1;
	stats_blufor_soldiers_killed = _stats select 2;
	stats_player_deaths = _stats select 3;
	stats_opfor_vehicles_killed = _stats select 4;
	stats_opfor_vehicles_killed_by_players = _stats select 5;
	stats_blufor_vehicles_killed = _stats select 6;
	stats_blufor_soldiers_recruited = _stats select 7;
	stats_blufor_vehicles_built = _stats select 8;
	stats_civilians_killed = _stats select 9;
	stats_civilians_killed_by_players = _stats select 10;
	stats_sectors_liberated = _stats select 11;
	stats_playtime = _stats select 12;
	stats_spartan_respawns = _stats select 13;
	stats_secondary_objectives = _stats select 14;
	stats_hostile_battlegroups = _stats select 15;
	stats_ieds_detonated = _stats select 16; publicVariable "stats_ieds_detonated";
	stats_saves_performed = _stats select 17;
	stats_saves_loaded = _stats select 18;
	stats_reinforcements_called = _stats select 19;
	stats_prisonners_captured = _stats select 20;
	stats_blufor_teamkills = _stats select 21;
	stats_vehicles_recycled = _stats select 22;
	stats_ammo_spent = _stats select 23;
	stats_sectors_lost = _stats select 24;
	stats_fobs_built = _stats select 25;
	stats_fobs_lost = _stats select 26;
	stats_readiness_earned = _stats select 27;

	_weights = _saves select 10;
	infantry_weight = _weights select 0;
	armor_weight = _weights select 1;
	air_weight = _weights select 2;

	ELITE_VEHICLES_LINK = _saves select 11;
	PLAYER_PERMISSIONS = _saves select 12;
	ai_groups = _saves select 13;
	saved_intel_res = _saves select 14;
	player_scores = _saves select 15;

	setDate [ 2045, 6, 6, time_of_day, 0];

	_correct_fobs = [];
	{
		_next_fob = _x;
		_keep_fob = true;
		if ( SECTOR_ALL findIf {_next_fob distance (markerpos _x) < 50} == -1 ) then { _correct_fobs pushback _next_fob };
	} foreach FOB_ALL;
	FOB_ALL = _correct_fobs;

	stats_saves_loaded = stats_saves_loaded + 1;

	{
		_class = _x select 0;

		if ( _class in _classnames_to_save ) then {

			_pos = _x select 1;
			_dir = _x select 2;

			_objects = _class createVehicle _pos;
			_objects setVectorUp [0,0,1];
			_objects setPosATL _pos;
			_objects setdir _dir;
			_objects setdamage 0;

			if ( _class in _building_classnames ) then {
				_objects setVariable ["SAVED_POS", _pos, false];
			};
			if(unitIsUAV _class) then {
				[_class] call F_forceBluforCrew;
			};
			if ( !(_class in no_kill_handler_classnames ) ) then {
				_objects addMPEventHandler ["MPKilled", {call F_unitKilled}];
			};

			if ( _class in all_hostile_classnames ) then {
				_objects setVariable ["CAPTURED", 1, true];
			};

			if ( _class == FOB_typename ) then {
				_objects addEventHandler ["HandleDamage", { 0 }];
			};
		};
	} foreach buildings_to_save;

	private [ "_nextgroup", "_grp", "_nextunit", "_nextpos", "_nextdir", "_nextobj" ];
	{
		_nextgroup = _x;
		_grp = createGroup CONST_SIDE_BLUFOR;

		{
			_nextunit = _x;
			_nextpos = [(_nextunit select 1) select 0, (_nextunit select 1) select 1, ((_nextunit select 1) select 2) + 0.2];
			_nextdir = _nextunit select 2;
			(_nextunit select 0) createUnit [ _nextpos, _grp, 'this addMPEventHandler ["MPKilled", {call F_unitKilled}] '];
			_nextobj = ((units _grp) select ((count (units _grp)) - 1));
			_nextobj setPosATL _nextpos;
			_nextobj setDir _nextdir;
		} foreach _nextgroup;
	} foreach ai_groups;
};

if ( count ELITE_VEHICLES_LINK == 0 ) then {
	private [ "_assigned_bases", "_assigned_vehicles", "_nextbase", "_nextvehicle" ];
	_assigned_bases = [];
	_assigned_vehicles = [];

	while { {count _assigned_bases < count SECTOR_MILITARY} && {count _assigned_vehicles < count ELITE_VEHICLES_LINK} } do {
		_nextbase =  selectRandom ( SECTOR_MILITARY select { !(_x in _assigned_bases) } );
		_nextvehicle = selectRandom ( ELITE_VEHICLES_LINK select { !(_x in _assigned_vehicles) } );
		_assigned_bases pushback _nextbase;
		_assigned_vehicles pushback _nextvehicle;
		ELITE_VEHICLES_LINK pushback [_nextvehicle, _nextbase];
	};
} else {
	_classnames_to_check = ELITE_VEHICLES_LINK;
	{
		if ( ! ( [ _x select 0 ] call F_checkClass ) ) then {
			ELITE_VEHICLES_LINK = ELITE_VEHICLES_LINK - [_x];
		};
	} foreach _classnames_to_check;
};


publicVariable "SECTOR_BLUFOR";
publicVariable "FOB_ALL";
publicVariable "ELITE_VEHICLES_LINK";
publicVariable "PLAYER_PERMISSIONS";
SAVE_LOADED = true; publicVariable "SAVE_LOADED";