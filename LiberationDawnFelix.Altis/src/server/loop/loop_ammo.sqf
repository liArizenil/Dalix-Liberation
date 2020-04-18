waitUntil { !isNil "SAVE_LOADED" };
waitUntil { !isNil "SECTOR_BLUFOR" };
waitUntil { !isNil "saved_ammo_res" };
waitUntil { !isNil "saved_intel_res" };

resources_ammo = saved_ammo_res;
resources_intel = saved_intel_res;

while { endgame == 0 } do {

	_base_tick_period = 4800;

	if ( count allPlayers > 0 ) then {

		_blufor_mil_sectors = [];
		{
			if ( _x in SECTOR_MILITARY ) then {
				_blufor_mil_sectors pushback _x;
				_base_tick_period = _base_tick_period * 0.82;
			};
		} foreach SECTOR_BLUFOR;

		_base_tick_period = _base_tick_period / CONST_RSC_MULTIPLIER;

		if ( _base_tick_period < 300 ) then { _base_tick_period = 300 };

		sleep _base_tick_period;

		if ( count _blufor_mil_sectors > 0 ) then {

			if ( CONST_PASSIVE_INCOME ) then {

				_ammo_increase = round (50 + (random 25));
				resources_ammo = resources_ammo + _ammo_increase;

			} else {

				if ( ( { typeof _x == ammobox_b_typename } count vehicles ) <= ( ceil ( ( count _blufor_mil_sectors ) * 1.3 ) ) ) then {

					_spawnsector = ( selectRandom _blufor_mil_sectors );
					_spawnpos = zeropos;
					while { _spawnpos distance zeropos < 1000 } do {
						_spawnpos =  (( markerpos _spawnsector) getPos [ random 50, random 360 ]) findEmptyPosition [ 10, 100, 'B_Heli_Transport_01_F' ];
						if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
					};

					_newbox = ammobox_b_typename createVehicle _spawnpos;
					_newbox setpos _spawnpos;
					_newbox setdir (random 360);
					clearWeaponCargoGlobal _newbox;
					clearMagazineCargoGlobal _newbox;
					clearItemCargoGlobal _newbox;
					clearBackpackCargoGlobal _newbox;
					_newbox addMPEventHandler ['MPKilled', {_this spawn F_unitKilled}];

					[_newbox, 500 ] remoteExec ["F_setMass"];
				};
			};
		};
	};
};
