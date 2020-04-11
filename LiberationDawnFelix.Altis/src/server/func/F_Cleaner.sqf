params ["_players", "_objects"];
{
	{
		if([600,_players,_x] call fn_checkDistance) then {
			deleteVehicle _x;
		};
} forEach _objects;