if (!isServer) exitWith {};

params ["_player", "_object_recycled", "_price" ];

if ( isNull _object_recycled ) exitWith {};
if ( !(alive _object_recycled) ) exitWith {};

[_player, _price] call addammo_remote_call;
[gamelogic, format["%1님에 의해 FOB %2의 %3이(가) 재활용되었습니다", name _player, [[_player] call F_getNearestFob] call F_getFobName, getText (_cfg >> typeOf _object_recycled >> "displayName" ) ]] remoteExec ["globalChat",[WEST,civilian]];
deleteVehicle _object_recycled;
please_recalculate = true;
stats_vehicles_recycled = stats_vehicles_recycled + 1;