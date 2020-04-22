params [ "_sector" ];
if ( _sector in SECTOR_ACTIVE ) exitWith {};

private _opforcount = [] call F_opforCap;
private _sectorunitcount = ( [ getmarkerpos _sector , [ _opforcount ] call F_getCorrectedSectorRange , CONST_SIDE_BLUFOR ] call F_getUnitsCount );
if(( _sectorunitcount < 5 && _sector in SECTOR_BIGTOWN ) || (_sectorunitcount < 2 && _sector in SECTOR_CAPTURE ) || (_sectorunitcount < 2 && _sector in SECTOR_MILITARY ) || (_sectorunitcount < 2 && _sector in SECTOR_FACTORY )) exitWith {};
[_sector, _opforcount] call F_waitActiveSector;

private _grps = grpNull;
private _managed_units = [];
private _sectorpos = getmarkerpos _sector;
private _stopit = false;
private _spawncivs = false;
private _building_ai_max = 0;
private _infsquad = "militia";
private _building_range = 50;
private _local_capture_size = CONST_CAPTURE_SIZE;
private _iedcount = 0;
private _vehtospawn = [];
private _inftospawn = [];
private _minimum_building_positions = 5;
private _sector_despawn_tickets = 12;
private _do_secondary = false;

private _popfactor = 1;
if ( CONST_UNITCAP < 1 ) then { _popfactor = CONST_UNITCAP; };

if((!(_sector in SECTOR_BLUFOR)) &&  (([getmarkerpos _sector, [ _opforcount ] call F_getCorrectedSectorRange, CONST_SIDE_BLUFOR ] call F_getUnitsCount) > 0 )) then {
	if(_sector in SECTOR_BIGTOWN) then {
		_infsquad = "csat";
		_spawncivs = true;

		_inftospawn = [(call F_getAdaptiveSquadComp),(call F_getAdaptiveSquadComp)];
		if ( CONST_UNITCAP >= 1) then { _inftospawn pushBack ([] call F_getAdaptiveSquadComp); };
		if ( CONST_UNITCAP >= 1.5) then { _inftospawn pushBack ([] call F_getAdaptiveSquadComp); };

		_vehtospawn = [call F_getAdaptiveVehicle, (selectRandom militia_vehicles), (selectRandom militia_vehicles)];
		if((random 100) > (66 / CONST_DIFFICULTY_MODIFIER)) then { _vehtospawn pushback (selectRandom militia_vehicles); };
		if((random 100) > (50 / CONST_DIFFICULTY_MODIFIER)) then { _vehtospawn pushback (selectRandom militia_vehicles); };
		if((random 100) > (33 / CONST_DIFFICULTY_MODIFIER)) then { _vehtospawn pushback (call F_getAdaptiveVehicle); };
		
		_building_ai_max = round (50 * _popfactor) ;
		_building_range = 110;

		_local_capture_size = _local_capture_size * 1.4;

		_iedcount = (2 + (floor (random 4))) * CONST_DIFFICULTY_MODIFIER;
		if ( _iedcount > 10 ) then { _iedcount = 10 };

		_secondary_amount = [0,1,2,3,4] selectRandomWeighted [4,3,3,3,3];
	};
	if(_sector in SECTOR_MILITARY) then {
		_infsquad = "csat";
		_spawncivs = false;

		_inftospawn = [(call F_getAdaptiveSquadComp),(call F_getAdaptiveSquadComp),(call F_getAdaptiveSquadComp)];
		if ( CONST_UNITCAP >= 1.5) then { _inftospawn pushBack (call F_getAdaptiveSquadComp); };
		if ( CONST_UNITCAP >= 2) then { _inftospawn pushBack (call F_getAdaptiveSquadComp); };

		_vehtospawn = [(call F_getAdaptiveVehicle ),(call F_getAdaptiveVehicle )];
		if((random 100) > (33 / CONST_DIFFICULTY_MODIFIER)) then { _vehtospawn pushback (call F_getAdaptiveVehicle); };
		if((random 100) > (66 / CONST_DIFFICULTY_MODIFIER)) then { _vehtospawn pushback (call F_getAdaptiveVehicle); };
		
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 4 )))) * _popfactor);
		_building_range = 110;

		_secondary_amount = [0,1,2,3,4] selectRandomWeighted [4,3,3,3,3];
	};
	if(_sector in SECTOR_FACTORY) then {
		_spawncivs = false;

		_inftospawn pushBack (call F_getAdaptiveSquadComp);
		if ( CONST_UNITCAP >= 1.25) then { _inftospawn pushBack (call F_getAdaptiveSquadComp); };

		if((random 100) > 66) then { _vehtospawn pushback (call F_getAdaptiveVehicle); };
		if((random 100) > 33) then { _vehtospawn pushback (selectRandom militia_vehicles); };

		_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * _popfactor);
		_building_range = 100;

		_iedcount = (floor (random 3)) * CONST_DIFFICULTY_MODIFIER;
		if ( _iedcount > 5 ) then { _iedcount = 5 };

		_secondary_amount = [0,1,2,3,4] selectRandomWeighted [12,1,1,1,1];
	};
	if(_sector in SECTOR_CAPTURE) then {
		_spawncivs = true;

		private _grp = [];
		while { count _grp < ( 10 * _popfactor) } do { _grp pushback ( selectRandom militia_squad ) };
		_inftospawn pushBack _grp;

		if((random 100) > (66 / CONST_DIFFICULTY_MODIFIER)) then { _vehtospawn pushback (selectRandom militia_vehicles); };
		if((random 100) > (33 / CONST_DIFFICULTY_MODIFIER)) then { _vehtospawn pushback (selectRandom militia_vehicles); };
		
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * _popfactor);
		_building_range = 70;

		_iedcount = (floor (random 4)) * CONST_DIFFICULTY_MODIFIER;
		if ( _iedcount > 7 ) then { _iedcount = 7 };

		_secondary_amount = [0,1,2,3,4] selectRandomWeighted [12,1,1,1,1];
	};
	if(_sector in SECTOR_TOWER) then {
		_spawncivs = false;

		_inftospawn = (call F_getAdaptiveSquadComp);
		if(CONST_UNITCAP >= 1.5) then { _inftospawn pushBack (call F_getAdaptiveSquadComp); };
		if((random 100) > 95) then { _vehtospawn pushback (call F_getAdaptiveVehicle); };

		_building_ai_max = 0;

		_secondary_amount = 0;
	};

	if ( _building_ai_max > 0 && CONST_ADAPTIVE_OPFOR ) then {
		_building_ai_max = round ( _building_ai_max * ([] call F_adaptiveOpforFactor));
	};

	{
		_vehicle = [_sectorpos, _x] call F_libSpawnVehicle;
		[group ((crew _vehicle) select 0 ),_sectorpos] spawn F_addDefWaypoints;
		_managed_units pushback _vehicle;
		{ _managed_units pushback _x; } foreach (crew _vehicle);
		sleep 0.25;
	} foreach _vehtospawn;

	if ( _building_ai_max > 0 ) then {
		_allbuildings = nearestObjects [_sectorpos, ["House"], _building_range ] select { alive _x };
		_buildingpositions = [];
		{
			_buildingpositions = _buildingpositions + ( [_x] call BIS_fnc_buildingPositions );
		} foreach _allbuildings;
		if ( count _buildingpositions > _minimum_building_positions ) then {
			_managed_units = _managed_units + ( [ _infsquad, _building_ai_max, _buildingpositions, _sectorpos, _sector ] call F_spawnBuildingSquad );
		};
	};

	_managed_units = _managed_units + ( [ _sectorpos ] call F_spawnMilitaryPostSquad );

	{
		_grps = [ _sector, _x ] call F_spawnRegularSquad;
		[ _grps, _sectorpos ] spawn F_addDefWaypoints;
		_managed_units = _managed_units + (units _grps);
	} forEach _inftospawn;

	if ( ( _sector in SECTOR_FACTORY ) || (_sector in SECTOR_CAPTURE ) || (_sector in SECTOR_BIGTOWN ) || (_sector in SECTOR_MILITARY ) ) then {
		[ _sector ] remoteExec ["reinforcements_remote_call",2];
	};

	if ( _spawncivs && CONST_CIV > 0) then {
		_managed_units = _managed_units + ( [ _sector ] call F_spawnCivilians );
	};

	for "_i" from 1 to (floor _iedcount) do { [_sector, _building_range, selectRandom [ "IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F" ]] spawn F_ied; };

	if(_secondary_amount > 0) then {
		_do_secondary = true;
		for "_i" from 1 to _secondary_amount do { 
			_task = selectRandom Sector_sides;
			[_sector ] spawn _task;
		};
	}
	else{
		_do_secondary = false;
	};


	while { true } do {
		if ( ([_sectorpos, _local_capture_size] call F_sectorOwnership == CONST_SIDE_BLUFOR) && ( !endgame ) && {( !_do_secondary  || {(({[_x] call BIS_fnc_taskCompleted} count (_sector getVariable ["TASKS",1]))/(_sector getVariable ["TASKS",1]) > 0.3)})} ) exitWith {
			_sector remoteExec ["sector_liberated_remote_call",2];

			{ [_x] spawn F_AI_prisonner; } foreach ( (getmarkerpos _sector) nearEntities [ [ "Man" ], _local_capture_size * 1.2 ] );
			if(_do_secondary) then { _sector setVariable ["TASKS",nil]; };

			SECTOR_ACTIVE = SECTOR_ACTIVE - [ _sector ]; publicVariable "SECTOR_ACTIVE";

			sleep 60;

			{
				if (_x isKindOf "Man") then {
					if ( side group _x != CONST_SIDE_BLUFOR ) then {
						deleteVehicle _x;
					};
				} else {
					[ _x ] call F_cleanOpforVehicle;
				};
			} foreach _managed_units;
		};
		if ( ( [_sectorpos, ( ( [ _opforcount ] call F_getCorrectedSectorRange ) + 300 ), CONST_SIDE_BLUFOR ] call F_getUnitsCount ) == 0 ) then {
			_sector_despawn_tickets = _sector_despawn_tickets - 1;
		} else {
			_sector_despawn_tickets = 12;
		};

		if ( _sector_despawn_tickets <= 0 ) exitWith {
			{
				if (_x isKindOf "Man") then {
					deleteVehicle _x;
				} else {
					[ _x ] call F_cleanOpforVehicle;
				};
			} foreach _managed_units;

			SECTOR_ACTIVE = SECTOR_ACTIVE - [ _sector ]; publicVariable "SECTOR_ACTIVE";
		};
		sleep 10;
	};
} else{
	sleep 40;
	SECTOR_ACTIVE = SECTOR_ACTIVE - [ _sector ]; publicVariable "SECTOR_ACTIVE";
};