SECTOR_ACTIVE = [];
ATTACK_PROGRESS = [];

waitUntil { !isNil "SECTOR_BLUFOR" };
waitUntil { !isNil "FOB_ALL" };
waitUntil { !isNil "SECTOR_ALL" };

while { !endgame } do {
	{
		private _opforcount = [] call F_opforCap;
		if(_x in SECTOR_BLUFOR) then {
			if (([ markerpos _x ] call F_sectorOwnership) == CONST_SIDE_OPFOR && !(_x in ATTACK_PROGRESS)) then {
				[ _x ] spawn F_attackProgressSector;
			};
		}
		else{
			if(_opforcount < CONST_SECTOR_CAP) then {
				if (([ getmarkerpos _x , [ _opforcount ] call F_getCorrectedSectorRange , CONST_SIDE_BLUFOR ] call F_getUnitsCount > 0 ) && !( _x in SECTOR_ACTIVE ) ) then {
					_hc = [] call F_lessLoadedHC;
					if ( isNull _hc ) then { [ _x ] spawn F_activateSector; } else { [ _x ] remoteExec ["F_activateSector", _hc ]; };
				};
			};
		};
		sleep 0.2;
	} forEach SECTOR_ALL;
	diag_log format [ "Full sector scan at %1, active sectors: %2", time, SECTOR_ACTIVE ];
	{
		if (([ markerpos _x ] call F_sectorOwnership) == CONST_SIDE_OPFOR && !(_x in ATTACK_PROGRESS)) then {
			[ _x ] spawn F_attackProgressFob;
		};
	} forEach FOB_ALL;
	sleep 1;
};

