if ( isDedicated ) exitWith {};	

params [ "_player_name","_destination" ];	

private [ "_location_name" ];	
_destination = [_destination select 0, _destination select 1, 0];
_location_name = markerText ([1000, _destination ] call F_getNearestSector);
if(_location_name != "") then {
 	[ "lib_Opfor_deployed", [ _player_name,_location_name ] ] call BIS_fnc_showNotification;
};
