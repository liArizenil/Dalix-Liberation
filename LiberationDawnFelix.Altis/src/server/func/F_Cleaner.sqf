params ["_players", "_objects"];
{
	{
		if([600,_players,_x] call F_checkCleanerDistance) then {
			deleteVehicle _x;
		};
} forEach _objects;