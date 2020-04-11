if(isClass ( configFile >> "CfgVehicles" >> "gm_gc_army_brdm2" )) then { ["DLCDec", false, false,false,false] call BIS_fnc_endMission; };

if(typeOf player == "VirtualSpectator_F") exitWith {
	[] spawn compileFinal preprocessFileLineNumbers "src\client\loop\marker_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "src\client\loop\ui_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "src\client\loop\sector_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "src\client\loop\sync_vars.sqf";
};

if(side player == CONST_SIDE_BLUFOR) then {

};
if(side player == CONST_SIDE_OPFOR) then {
	[] call compileFinal preprocessFileLineNumbers "F_checkBlufor.sqf";
	[] spawn compileFinal preprocessFileLineNumbers 
};