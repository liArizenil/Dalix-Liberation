private [ "_truepos", "_built_object_remote", "_classname", "_ghost_spot", "_vehicle", "_dist", "_actualdir", "_near_objects", "_near_objects_25" ];

build_confirmed = 0;
_truepos = [];

GRLIB_preview_spheres = [];
while { count GRLIB_preview_spheres < 36 } do {
	GRLIB_preview_spheres pushback ( "Sign_Sphere100cm_F" createVehicleLocal [ 0, 0, 0 ] );
};

{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

if (isNil "build_rotation" ) then { build_rotation = 0 };

waitUntil { sleep 0.2; !isNil "dobuild" };

while { true } do {
	waitUntil { sleep 0.2; dobuild != 0 };

	build_confirmed = 1;
	build_invalid = 0;

	_classname = ((build_lists select buildtype) select buildindex) select 0;
	_price = ((build_lists select buildtype) select buildindex) select 1;
	[ _price ] remoteExec ["opfor_build_remote_call", 2];


	if(buildtype == 5) then {
		_spawn_point = markerPos(selectRandom sectors_airspawn);
		_spawn_point = [(((_spawn_point select 0) + 500) - random 1000),(((_spawn_point select 1) + 500) - random 1000),0];
		_aircraft = createVehicle [_classname, _spawn_point, [], 0, "FLY"];

		_aircraft addMPEventHandler ['MPKilled', {call F_unitKilled}];
		player moveindriver _aircraft;

		_aircraft flyInHeight (120 + (random 180));

		if(_classname == "O_T_VTOL_02_infantry_dynamicLoadout_F") then { //XIAN
			_aircraft setPylonLoadout ["PylonRight1",""];
			_aircraft setPylonLoadout ["PylonRight2",""];
			_aircraft setPylonLoadout ["PylonLeft2",""];
			_aircraft setPylonLoadout ["PylonLeft1",""];
			_aircraft removeWeaponTurret ["missiles_SCALPEL",[0]];
			_aircraft removeWeaponTurret ["rockets_Skyfire",[0]];
		};
		if(_classname == "O_Plane_CAS_02_dynamicLoadout_F") then { //NEO
			_aircraft setPylonLoadout ["Pylons1",""];
			_aircraft setPylonLoadout ["Pylons2",""];
			_aircraft setPylonLoadout ["Pylons3",""];
			_aircraft setPylonLoadout ["Pylons4",""];
			_aircraft setPylonLoadout ["Pylons5",""];
			_aircraft setPylonLoadout ["Pylons6",""];
			_aircraft setPylonLoadout ["Pylons7",""];
			_aircraft setPylonLoadout ["Pylons9",""];
			_aircraft setPylonLoadout ["Pylons10",""];
			_aircraft removeWeaponTurret ["Missile_AA_03_Plane_CAS_02_F",[-1]];
			_aircraft removeWeaponTurret ["Missile_AGM_01_Plane_CAS_02_F",[-1]];
			_aircraft removeWeaponTurret ["Rocket_03_HE_Plane_CAS_02_F",[-1]];
			_aircraft removeWeaponTurret ["Bomb_03_Plane_CAS_02_F",[-1]];
			_aircraft removeWeaponTurret ["Laserdesignator_pilotCamera",[-1]];
			_aircraft addWeaponTurret ["weapon_SDBLauncher",[-1]];
			_aircraft addMagazineTurret ["PylonRack_Bomb_SDB_x4",[-1]];
			_aircraft addMagazineTurret ["PylonRack_Bomb_SDB_x4",[-1]];
			_aircraft addMagazineTurret ["120Rnd_CMFlareMagazine",[-1]];
		};
		if(_classname == "O_Plane_Fighter_02_Stealth_F") then { //SHIKRA
			_aircraft setPylonLoadout ["pylonBayCenter1",""];
			_aircraft setPylonLoadout ["pylonBayCenter2",""];
			_aircraft setPylonLoadout ["pylonBayCenter3",""];
			_aircraft removeWeaponTurret ["weapon_KAB250Launcher",[-1]];
			_aircraft removeWeaponTurret ["Laserdesignator_pilotCamera",[-1]];
			_aircraft addMagazineTurret ["240Rnd_CMFlareMagazine",[-1]];
		};
	} else {
		if(buildtype == 7 ) then {
			if(_classname == "STR_CALL_TROUP") then {

			};
			if(_classname == "STR_SPAWN_UGV") then {

			};
			if(_classname == "STR_SPAWN_UAV") then {

			};
			if(_classname == "STR_CALL_MORTAL") then {

			};
		} else {
			_idactcancel = -1;
			_idactcancel = player addAction ["<t color='#B0FF00'>" + localize "STR_CANCEL" + "</t> <img size='2' image='res\ui_cancel.paa'/>","scripts\client\build\build_cancel.sqf","",-725,false,true,"","build_confirmed == 1"];
			_idactrotate = player addAction ["<t color='#B0FF00'>" + localize "STR_ROTATION" + "</t> <img size='2' image='res\ui_rotation.paa'/>","scripts\client\build\build_rotate.sqf","",-750,false,false,"","build_confirmed == 1"];
			_idactplace = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT" + "</t> <img size='2' image='res\ui_confirm.paa'/>","scripts\client\build\build_place.sqf","",-775,false,true,"","build_invalid == 0 && build_confirmed == 1"];

			_ghost_spot = (getmarkerpos "ghost_spot") findEmptyPosition [0,100];

			_vehicle = _classname createVehicleLocal _ghost_spot;
			_vehicle allowdamage false;
			_vehicle setVehicleLock "LOCKED";
			_vehicle enableSimulationGlobal false;

			_dist = 0.6 * (sizeOf _classname);
			if (_dist < 3.5) then { _dist = 3.5 };
			_dist = _dist + 0.5;

			for [{_i=0}, {_i<5}, {_i=_i+1}] do {
				_vehicle setObjectTextureGlobal [_i, '#(rgb,8,8,3)color(0,1,0,0.8)'];
			};

			{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

			while { build_confirmed == 1 && alive player } do {
				_truedir = 90 - (getdir player);
				_truepos = [((getpos player) select 0) + (_dist * (cos _truedir)), ((getpos player) select 1) + (_dist * (sin _truedir)),0];
				_actualdir = ((getdir player) + build_rotation);

				_sphere_idx = 0;
				{
					_x setpos (_truepos getPos [_dist, _sphere_idx * 10 ]);
					_sphere_idx = _sphere_idx + 1;
				} foreach GRLIB_preview_spheres;

				_vehicle setdir _actualdir;

				_near_objects = (_truepos nearobjects ["AllVehicles", _dist]) ;
				_near_objects = _near_objects + (_truepos nearobjects [FOB_box_typename, _dist]);
				_near_objects = _near_objects + (_truepos nearobjects [Arsenal_typename, _dist]);

				_near_objects_25 = (_truepos nearobjects ["AllVehicles", 50]) ;
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [FOB_box_typename, 50]);
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [Arsenal_typename, 50]);
				_near_objects = _near_objects + (_truepos nearobjects ["Static", _dist]);
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects ["Static", 50]);

				private _remove_objects = [];
				{
					if ((_x isKindOf "Animal") || ((typeof _x) in GRLIB_ignore_colisions_when_building) || (_x == player) || (_x == _vehicle )) then {
						_remove_objects pushback _x;
					};
				} foreach _near_objects;

				private _remove_objects_25 = [];
				{
					if ((_x isKindOf "Animal") || ((typeof _x) in GRLIB_ignore_colisions_when_building) || (_x == player) || (_x == _vehicle ))  then {
						_remove_objects_25 pushback _x;
					};
				} foreach _near_objects_25;

				_near_objects = _near_objects - _remove_objects;
				_near_objects_25 = _near_objects_25 - _remove_objects_25;

				if ( count _near_objects == 0 ) then {
					{
						_dist22 = 0.6 * (sizeOf (typeof _x));
						if ( _dist22 < 1 ) then { _dist22 = 1 };
						if (_truepos distance _x < _dist22) then {
							_near_objects pushback _x;
						};
					} foreach _near_objects_25;
				};

				if ( count _near_objects != 0 ) then {
					GRLIB_conflicting_objects = _near_objects;
				} else {
					GRLIB_conflicting_objects = [];
				};

				if (count _near_objects == 0 && (((!surfaceIsWater _truepos) && (!surfaceIsWater getpos player))) ) then {
					_vehicle setpos _truepos;
					_vehicle setVectorUp surfaceNormal position _vehicle;

					if(build_invalid == 1) then {
						GRLIB_ui_notif = "";
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					build_invalid = 0;

				} else {
					if ( build_invalid == 0 ) then {
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(1,0,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					_vehicle setpos _ghost_spot;
					build_invalid = 1;
					if(count _near_objects > 0) then {
						GRLIB_ui_notif = format [localize "STR_PLACEMENT_IMPOSSIBLE",count _near_objects, round _dist];
					};
					if( ((surfaceIsWater _truepos) || (surfaceIsWater getpos player))) then {
						GRLIB_ui_notif = localize "STR_BUILD_ERROR_WATER";
					};
					if(!(([1500,getPos player] call F_getNearestSector) in SECTOR_BLUFOR)) then {
						GRLIB_ui_notif = localize "STR_PLACEMENT_IMPOSSIBLE_OPFOR";
					};
				};
				sleep 0.05;
			};

			GRLIB_ui_notif = "";

			{ _x setpos [ 0,0,0 ] } foreach GRLIB_preview_spheres;

			if ( !alive player || build_confirmed == 3 ) then {
				deleteVehicle _vehicle;
				[ _price ] remoteExec ["cancel_opfor_build_remote_call",2];
			};

			if ( build_confirmed == 2 ) then {
				_vehpos = getpos _vehicle;
				_vehdir = getdir _vehicle;
				deleteVehicle _vehicle;
				sleep 0.1;
				_vehicle = _classname createVehicle _truepos;
				_vehicle allowDamage false;
				_vehicle setdir _vehdir;
				_vehicle setpos _truepos;
				clearWeaponCargoGlobal _vehicle;
				clearMagazineCargoGlobal _vehicle;
				clearItemCargoGlobal _vehicle;
				clearBackpackCargoGlobal _vehicle;

				_vehicle setVectorUp surfaceNormal position _vehicle;

				sleep 0.3;
				_vehicle allowDamage true;
				_vehicle setDamage 0;
				sleep 0.2;
				sleep 0.2;

				_vehicle addMPEventHandler ["MPKilled", {call F_unitKilled}];
			};

			player removeAction _idactcancel;
			player removeAction _idactrotate;
			player removeAction _idactplace;

		};
	};
	dobuild = 0;
	build_confirmed = 0;
};
