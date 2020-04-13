private ["_recycleable_vehicles", "_recycleable_classnames", "_building_classnames", "_detected_vehicles", "_veh", "_idact", "_actionned_captive_units", "_near_people",  "_near_intel", "_actionned_intel_items", "_unflippable_vehicles"];

_actionned_captive_units = [];
_actionned_intel_items = [];
_recycleable_vehicles = [];
_recycleable_classnames = [];
veh_action_distance = 10;
_unflippable_vehicles = [];

{
	_recycleable_classnames pushBack ( _x select 0 );
} foreach (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + captured_vehicles);

_building_classnames = [];
{
	_building_classnames pushBack ( _x select 0 );
} foreach buildings;
_building_classnames = _building_classnames + [ "B_supplyCrate_F", "B_Slingload_01_Cargo_F", "B_Slingload_01_Repair_F", "B_Slingload_01_Fuel_F", "B_Slingload_01_Ammo_F","CargoNet_01_box_F", ammobox_b_typename, ammobox_o_typename ];


while { true } do {
	if([ player, 4 ] call F_fetchPermission && count FOB_ALL > 0) then { //RECYCLE
		if(player distance ([] call F_getNearestFob) < (2 * CONST_FOB_RANGE)) then {
			_detected_vehicles = (getpos player) nearObjects veh_action_distance select
							{
								(((typeof _x in _recycleable_classnames ) &&
								((count crew _x) == 0 || (typeof _x) in uavs) &&
								((locked _x == 0 || locked _x == 1))) || ( typeof _x in _building_classnames )) &&
								(alive _x) &&
								(_x distance lhd > 1000) &&
								(_x distance ( [] call F_getNearestFob) < CONST_FOB_RANGE ) &&
								( getObjectType _x >= 8 ) &&
								!(isUAVConnected _x) };
			{
				_veh = _x;
				if((_recycleable_vehicles findIf {(_x select 0) == _veh}) == -1) then {
					_idact = _x addAction [ "<t color='#FFFF00'>" + localize "STR_RECYCLE" + "</t> <img size='2' image='res\ui_recycle.paa'/>", "scripts\client\actions\do_recycle.sqf", "", -900, true, true, "", "build_confirmed == 0 && (  _this distance _target < veh_action_distance ) && (vehicle player == player)"];
					_recycleable_vehicles pushBack [_x,_idact];
				};
			} forEach _detected_vehicles;
			{
				if(!((_x select 0) in _detected_vehicles)) then {
					(_x select 0) removeAction (_x select 1);
					_recycleable_vehicles = _recycleable_vehicles - [_x];
				};
			} forEach _recycleable_vehicles;
		};
	}
	else{
		{
			(_x select 0) removeAction (_x select 1);
			_recycleable_vehicles = _recycleable_vehicles - [ _x ];
		} foreach _recycleable_vehicles;
	};
	if([ player, 5 ] call F_fetchPermission) then { //INTEL, UNFLIP
		_near_people = (getPosATL player) nearEntities [["Man"], 5];
		_near_intel = (getPosATL player) nearEntities [[GRLIB_intel_laptop, GRLIB_intel_file], 5];
		_detected_vehicles = (getpos player) nearEntities [["Tank","APC","IFV","Car"], veh_action_distance] select { (count crew _x) == 0 && ((locked _x == 0 || locked _x == 1)) && (_x distance lhd > 1000) };

		{
			if ( (captive _x) && !(_x in _actionned_captive_units) && !((side group _x) == CONST_SIDE_BLUFOR) && !(isPlayer _x)) then {
				_x addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_CAPTURE" + "</t>","scripts\client\actions\do_capture.sqf","",-850,true,true,"","(vehicle player == player) && (side group _target != CONST_SIDE_BLUFOR) && (captive _target)"];
				_actionned_captive_units pushback _x;
			};
		} foreach _near_people;

		{
			if ( !(alive _x) || ((player distance _x) > 5) || ((side group _x) == CONST_SIDE_BLUFOR) ) then {
				removeAllActions _x;
				_actionned_captive_units = _actionned_captive_units - [_x];
			};
		} foreach _actionned_captive_units;

		{
			if ( !(_x in _actionned_intel_items) ) then {
				_x addAction ["<t color='#FFFF00'>" + localize "STR_INTEL" + "</t>","scripts\client\actions\do_take_intel.sqf","",-849,true,true,"","(vehicle player == player)"];
				_actionned_intel_items pushback _x;
			};
		} foreach _near_intel;

		{
			if ((player distance _x) > 5) then {
				removeAllActions _x;
				_actionned_intel_items = _actionned_intel_items - [_x];
			};
		} foreach _actionned_intel_items;

		{
			_veh = _x;
			if((_unflippable_vehicles findIf {(_x select 0) == _veh}) == -1) then {
				_idact = _x addAction addAction [ "<t color='#FFFF00'>" + localize "STR_UNFLIP" + "</t> <img size='2' image='res\ui_flipveh.paa'/>", "scripts\client\actions\do_unflip.sqf", "", -950, true, true, "", "build_confirmed == 0 && (_this distance _target < veh_action_distance) && (vehicle player == player)"];
				_unflippable_vehicles pushBack [_x,_idact];
			};
		} forEach _detected_vehicles;

		{
			_veh = _x;
			if(!((_x select 0) in _detected_vehicles)) then {
				(_x select 0) removeAction (_x select 1);
				_unflippable_vehicles = _unflippable_vehicles - [_x];
			};
		} forEach _unflippable_vehicles;
	}
	else{
		{
			removeAllActions _x;
			_actionned_captive_units = _actionned_captive_units - [_x];
		} foreach _actionned_captive_units;

		{
			removeAllActions _x;
			_actionned_intel_items = _actionned_intel_items - [_x];
		} foreach _actionned_intel_items;
		
		{
			(_x select 0) removeAction (_x select 1);
			_unflippable_vehicles = _unflippable_vehicles - [ _x ];
		} foreach _unflippable_vehicles;
	};
	sleep 3;
};