private [ "_weathers", "_weathertime"  , "_accelerated_time", "_randtime", "_huron" ];

_save_interval = 20;
_weathers = [0.4];
_randtime = 0;

if ( CONST_WEATHER == 2 ) then {
	_weathers = [0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55];
};
if ( CONST_WEATHER == 3 ) then {
	_weathers = [0,0.01,0.02,0.03,0.05,0.07,0.1,0.15,0.2,0.25,0.3,0.4,0.45,0.5,0.55,0.6,0.7,0.8,0.9,1.0];
};

while { true } do {
	if(time % 10 == 0) then { //time accelerate
		if ( CONST_SHORT_NIGHTS && ( daytime > 21 || daytime < 3 ) ) then {
			_accelerated_time = CONST_TIME_FACTOR * 3;
			if ( _accelerated_time > 100 ) then {
				_accelerated_time = 100;
			};
			setTimeMultiplier _accelerated_time;
		} else {
			setTimeMultiplier CONST_TIME_FACTOR;
		};
	};
	if(time % 1800 == 0) then {  //weather selection
		_chosen_weather = selectRandom _weathers;
		[1800, _chosen_weather] remoteExec ["setOvercast"];
		if ( _chosen_weather < 0.75 ) then { 2 setRain 0 };
		if ( _chosen_weather >= 0.75 && _chosen_weather < 0.95 ) then { 2 setRain 0.075 };
		if ( _chosen_weather >= 0.95 ) then { 2 setRain 0.15 };
	};
	if(time % 20 == 0) then { //save
		trigger_server_save = true;
	};
	if(time % 3 == 0) then {
		please_recalculate = true;
	};
	if(time % (45 + _randtime) == 0 ) then {
		if ( (count SECTOR_BLUFOR) >= ((count SECTOR_BLUFOR) * 0.9)) then {
			if ( combat_readiness > 0 ) then {
				combat_readiness = combat_readiness - 0.25;
			};
		} else {
			if ( (combat_readiness < ((count SECTOR_BLUFOR) * 2) && combat_readiness < 35 ) ||
				(combat_readiness < ((count SECTOR_BLUFOR) * 1.25) && combat_readiness < 60 )) then {
				combat_readiness = combat_readiness + 0.25;
				stats_readiness_earned = stats_readiness_earned + 0.25;
			};
		};
		if ( combat_readiness > 100.0 && CONST_DIFFICULTY_MODIFIER < 2 ) then { combat_readiness = 100.0 };

		_randtime = floor(random 90);
	};
	if(time % 5 == 0) then {
		_huron = [] call F_spartanScan;
		if(!alive _huron) then {
			if(!isNull _huron) then { deleteVehicle _huron; stats_spartan_respawns = stats_spartan_respawns + 1; };
			_huron = huron_typename createVehicle ( getpos huronspawn );
			_huron allowdamage false;
			_huron setpos ( getpos huronspawn );
			_huron setDir 0;
			clearWeaponCargoGlobal _huron;
			clearMagazineCargoGlobal _huron;
			clearItemCargoGlobal _huron;
			clearBackpackCargoGlobal _huron;
			_huron setDamage 0;
			_huron enableSimulationGlobal true;
			_huron allowdamage true;
			_huron setDamage 0;
		};
	};

	stats_playtime = stats_playtime + 1;
	uiSleep 1;
};