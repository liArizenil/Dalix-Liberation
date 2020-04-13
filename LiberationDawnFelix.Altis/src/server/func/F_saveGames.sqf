private _classnames_to_save_blu = [];
private _classnames_to_save = [];

{
	_classnames_to_save_blu pushback (_x select 0);
} foreach (static_vehicles + air_vehicles + heavy_vehicles + light_vehicles + support_vehicles);

_classnames_to_save = _classnames_to_save + _classnames_to_save_blu + all_hostile_classnames;

if ( endgame ) then {
	profileNamespace setVariable [ CONST_SAVE_KEY, nil ];
	saveProfileNamespace;
} else {
	buildings_to_save = [];
	ai_groups = [];

	_all_buildings = [];
	{
		_fobpos = _x;
		_nextbuildings = (_fobpos nearobjects (CONST_FOB_RANGE * 2)) select {
			((typeof _x) in _classnames_to_save ) &&
			( alive _x) &&
			( speed _x < 5 ) &&
			( isNull  attachedTo _x ) &&
			(((getpos _x) select 2) < 10 ) &&
			( getObjectType _x >= 8 )
			};

		_all_buildings = _all_buildings + _nextbuildings;

		{
			_nextgroup = _x;
			if (  side _nextgroup == CONST_SIDE_BLUFOR ) then {
				if ( { isPlayer _x } count ( units _nextgroup ) == 0 ) then {
					if ( { alive _x } count ( units _nextgroup ) > 0  ) then {
						if ( _fobpos distance (leader _nextgroup) < GRLIB_fob_range * 2 ) then {
							private [ "_grouparray" ];
							_grouparray = [];
							{
								if ( alive _x && (vehicle _x == _x ) ) then {
									_grouparray pushback [ typeof _x, getPosATL _x, getDir _x ];
								};
							} foreach (units _nextgroup);
								ai_groups pushback _grouparray;
						};
					};
				};
			};
		} foreach allGroups;
	} foreach FOB_ALL;

	private["_savedpos", "_class", "_dir", "_hascrew"];
	{
		_savedpos = [];

		if ( (typeof _x) in _building_classnames ) then {
			_savedpos = _x getVariable [ "SAVED_POS", [] ];
			if ( count _savedpos == 0 ) then {
				_x setVariable [ "SAVED_POS", getposATL _x, false ];
				_savedpos = getposATL _x;
			};
		} else {
			_savedpos = getposATL _x;
		};

		_class = typeof _x;
		_dir = getdir _x;
		_hascrew = false;
		if ( _class in _classnames_to_save_blu ) then {
			if ( ( { !isPlayer _x } count (crew _x) ) > 0 ) then {
				_hascrew = true;
			};
		};
		buildings_to_save pushback [ _nextclass,_savedpos,_nextdir,_hascrew ];
	} foreach _all_buildings;

	time_of_day = date select 3;

	stats_saves_performed = stats_saves_performed + 1;

	private [ "_newscores", "_knownplayers", "_playerindex", "_nextplayer" ];
	_knownplayers = [];
	_newscores = [] + player_scores;
	{ _knownplayers pushback (_x select 0) } foreach player_scores;

	{
		_nextplayer = _x;
		if ( score _nextplayer >= 20 ) then {
			_playerindex = _knownplayers find (getPlayerUID _nextplayer);
			if ( _playerindex >= 0 ) then {
				_newscores set [ _playerindex, [ getPlayerUID _x, score _x] ];
			} else {
				_newscores pushback [ getPlayerUID _x, score _x ];
			};
		};
	} foreach allPlayers;
	player_scores = _newscores;

	_stats = [];
	_stats pushback stats_opfor_soldiers_killed;
	_stats pushback stats_opfor_killed_by_players;
	_stats pushback stats_blufor_soldiers_killed;
	_stats pushback stats_player_deaths;
	_stats pushback stats_opfor_vehicles_killed;
	_stats pushback stats_opfor_vehicles_killed_by_players;
	_stats pushback stats_blufor_vehicles_killed;
	_stats pushback stats_blufor_soldiers_recruited;
	_stats pushback stats_blufor_vehicles_built;
	_stats pushback stats_civilians_killed;
	_stats pushback stats_civilians_killed_by_players;
	_stats pushback stats_sectors_liberated;
	_stats pushback stats_playtime;
	_stats pushback stats_spartan_respawns;
	_stats pushback stats_secondary_objectives;
	_stats pushback stats_hostile_battlegroups;
	_stats pushback stats_ieds_detonated;
	_stats pushback stats_saves_performed;
	_stats pushback stats_saves_loaded;
	_stats pushback stats_reinforcements_called;
	_stats pushback stats_prisonners_captured;
	_stats pushback stats_blufor_teamkills;
	_stats pushback stats_vehicles_recycled;
	_stats pushback stats_ammo_spent;
	_stats pushback stats_sectors_lost;
	_stats pushback stats_fobs_built;
	_stats pushback stats_fobs_lost;
	_stats pushback stats_readiness_earned;

	profileNamespace setVariable [ CONST_SAVE_KEY, [ SECTOR_BLUFOR, FOB_ALL, buildings_to_save, time_of_day, round combat_readiness,0,0,0, round resources_ammo, _stats,
	[ round infantry_weight, round armor_weight, round air_weight ], ELITE_VEHICLES_LINK, player_permissions, ai_groups, resources_intel, player_scores ] ];
	saveProfileNamespace;
};