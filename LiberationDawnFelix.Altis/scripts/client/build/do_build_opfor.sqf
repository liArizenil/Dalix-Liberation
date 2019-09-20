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
	//[ [ _price, _classname, buildtype ] , "build_remote_call" ] call BIS_fnc_MP;


	if(buildtype == 5) then {
		_spawn_point = markerPos(selectRandom sectors_airspawn);
		_spawn_point = [(((_spawn_point select 0) + 500) - random 1000),(((_spawn_point select 1) + 500) - random 1000),0];
		_aircraft = createVehicle [_classname, _spawn_point, [], 0, "FLY"];

		_aircraft addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
		player moveindriver _aircraft;

		_aircraft flyInHeight (120 + (random 180));

		if(_classname == "O_T_VTOL_02_infantry_F") then { //XIAN
			_aircraft setPylonLoadOut["PylonRight1",""];
			_aircraft setPylonLoadOut["PylonRight2",""];
			_aircraft setPylonLoadOut["PylonLeft1",""];
			_aircraft setPylonLoadOut["PylonLeft2",""];
		};
		if(_classname == "O_Plane_CAS_02_F") then { //NEO

		};
		if(_classname == "O_Plane_Fighter_02_Stealth_F") then { //SHIKRA

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
					if(!(([1500,getPos player] call F_getNearestSector) in blufor_sectors)) then {
						GRLIB_ui_notif = "You can't Build here. It's not OPFOR's Area";
					};
				};
				sleep 0.05;
			};

			GRLIB_ui_notif = "";

			{ _x setpos [ 0,0,0 ] } foreach GRLIB_preview_spheres;

			if ( !alive player || build_confirmed == 3 ) then {
				deleteVehicle _vehicle;
				//[ [ ((build_lists select buildtype) select buildindex) select 2 ] , "cancel_build_remote_call" ] call BIS_fnc_MP;
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

				if ( (_classname in uavs) || manned ) then {
					[ _vehicle ] call F_forceBluforCrew;
				};

				sleep 0.3;
				_vehicle allowDamage true;
				_vehicle setDamage 0;
				sleep 0.2;
				sleep 0.2;

				_vehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
			};

			player removeAction _idactcancel;
			player removeAction _idactrotate;
			player removeAction _idactplace;

			build_confirmed = 0;
		};
	};
	dobuild = 0;
};