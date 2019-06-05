if ( isDedicated ) exitWith {};	

 params [ "_player_name","_destination" ];	

 private [ "_location_name" ];	
_location_name = [ _destination ] call F_getLocationName;	

 [ "lib_Opfor_deployed", [ _player_name,location_name ] ] call BIS_fnc_showNotification;
