private [ "_scanned_units", "_scanned_groups" ];

waitUntil { !isNil "nametags_distance" };

while { true } do {
	_scanned_units = allUnits select { ( alive _x ) && ( side group _x == side player ) };
	_scanned_units = _scanned_units select { (_x == leader group player ) || (_x distance player < nametags_distance) };
	_scanned_units = _scanned_units select { (_x != player) && (( vehicle player ) != ( vehicle _x )) };
	GRLIB_nametag_units = [] + _scanned_units;

	_scanned_groups = allGroups select { ( side _x == side player ) && ( isplayer (leader _x) ) };
	_scanned_groups = _scanned_groups select { ( count units _x > 1 ) || ( count units _x == 1 && leader _x != player ) };
	GRLIB_overlay_groups = [] + _scanned_groups;

	sleep 1;
};
