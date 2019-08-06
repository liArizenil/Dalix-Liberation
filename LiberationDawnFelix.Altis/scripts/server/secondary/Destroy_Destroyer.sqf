private ["_destroyer", "_ship_weapons", "_engin", "_engins", "_enginchecks", "_terminal", "_removeWeapons", "_removeObjects"];
_ship_weapons =
[["B_Ship_Gun_01_F",[0,-78,14.8321],180],
["B_Ship_MRLS_01_F",[0,-62.4,11.9231],180],
["B_AAA_System_01_F",[0,-47.9,17.5332],180],
["B_AAA_System_01_F",[0,35.9,21.7476],0],
["B_SAM_System_01_F",[0,50.6,17.5499],180]];
_engins = 
[[0,0,0,0], //x y z dir
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0]];
_enginchecks = [];
_removeWeapons = [];
_removeObjects = [];

GRLIB_secondary_in_progress = 0; publicVariable "GRLIB_secondary_in_progress";

//Find Air Spawn point
_destroyer_point = selectRandom sectors_airspawn;
_destroyer_point = getMarkerPos _destroyer_point;
_destroyer_point = [(_destroyer_point select 0) - 250 + random 500,(_destroyer_point select 1) - 250 + random 500,-2 ];
//Spawn Destroyer
_destroyer = createVehicle ["Land_Destroyer_01_base_F", ASLToATL (_destroyer_point), [], 0, "CAN_COLLIDE"];
_destroyer setPos _destroyer_point;
_destroyer setDir (random 360);
_removeObjects pushBack _destroyer;

{
	_x params ["_vehicleclass", "_position_rel", "_dir_rel"];
	private _grp = createGroup EAST;
	private _gun = createVehicle [_vehicleclass, asltoatl (_destroyer modelToWorldWorld _position_rel), [], 0, "CAN_COLLIDE"];
	_gun setDir (getDir _destroyer + _dir_rel);
	_gun setPosWorld (_destroyer modelToWorldWorld _position_rel);
	createvehiclecrew _gun;
	private _crew = crew _gun;
	_crew joinsilent _grp;
	_grp addVehicle _gun;
	_gun pushBack _removeWeapons;
} forEach _ship_weapons;

//Spawn solider

//Spawn Destroyable Objective

{
	_x params ["_pos1","_pos2","_pos3","_dir"];
	private _eng = createVehicle ["Land_Device_assembled_F",[_position_mark select 0, _position_mark select 1, 0], [], 0, "NONE"];
	_eng setDir (getDir _desstroyer + _dir);
	_eng setPosWorld (_destroyer modelToWorldWorld _position_rel);
	_enginchecks pushBack _eng;
	_removeObjects pushBack _eng;
} forEach _engins;

//Spawn Intel Objective

_terminal = createVehicle ["Land_DataTerminal_01_F",[_position_mark select 0, _position_mark select 1, 0], [], 0, "NONE"];

//Secondary is Ready

secondary_objective_position = _destroyer_point;
secondary_objective_position_marker = [(((secondary_objective_position select 0) + 800) - random 1600),(((secondary_objective_position select 1) + 800) - random 1600),0];
publicVariable "secondary_objective_position_marker";

//wait until Destroyable Objective has been destroyed

[] spawn {
  while { true } do {
  	if() exitWuth {};
  };
};

waitUntil { { alive _x } count _enginchecks < 1 };

//play Explode animation



//do sinking



stats_secondary_objectives = stats_secondary_objectives + 1;
GRLIB_secondary_in_progress = 1; publicVariable "GRLIB_secondary_in_progress";

//remove all objective

{ 
  private _weap = _x;
  {
    _weap deleteVehicleCrew _x;
  } forEach crew _weap;
  deleteVehicle _x;
} forEach _removeWeapons;
{ deleteVehicle _x; } forEach _removeObjects;
