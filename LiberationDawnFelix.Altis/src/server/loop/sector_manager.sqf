ACTIVE_SECTOR = [];
ATTACK_PROGRESS = [];

waitUntil { !isNil "SECTOR_BLUFOR" };
waitUntil { !isNil "FOB_ALL" };
waitUntil { !isNil "SECTOR_ALL" };

while { !ENDGAME } do {
	{
		private _opforcount = [] call F_opforCap;

		if(_opforcount < CONST_SECTOR_CAP) then {
			if (([ getmarkerpos _x , [ _opforcount ] call F_getCorrectedSectorRange , CONST_SIDE_BLUFOR ] call F_getUnitsCount > 0 ) && !( _x in ACTIVE_SECTOR ) ) then {
				_hc = [] call F_lessLoadedHC;

				if ( isNull _hc ) then {
					[ _x ] spawn F_manageSingleSector;
				} else {
					[ _x ] remoteExec ["F_manageSingleSector", _hc ];
				};
			};
		};
		sleep 0.2;
	} forEach ( SECTOR_ALL - SECTOR_BLUFOR );
	diag_log format [ "Full sector scan at %1, active sectors: %2", time, ACTIVE_SECTOR ];
	{
		if (([ markerpos _x ] call F_sectorOwnership) == CONST_SIDE_OPFOR && !(_x in ATTACK_PROGRESS)) then {
			[ _x ] spawn F_attackProgressSector;
		};
		sleep 0.2;
	} foreach SECTOR_BLUFOR;
	{
		if (([ markerpos _x ] call F_sectorOwnership) == CONST_SIDE_OPFOR && !(_x in ATTACK_PROGRESS)) then {
			[ _x ] spawn F_attackProgressFob;
		};
		sleep 0.5;
	} forEach FOB_ALL;
	sleep 1;
};

