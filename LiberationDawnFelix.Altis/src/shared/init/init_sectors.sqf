SECTOR_ALL = [];
SECTOR_BIGTOWN = [];
SECTOR_CAPTURE = [];
SECTOR_FACTORY = [];
SECTOR_MILITARY = [];
SECTOR_TOWER = [];
POS_OPFOR = [];
POS_AIRSPAWN = [];

{
    switch (true) do {
        case (_x find "bigtown" == 0): {SECTOR_BIGTOWN pushBack _x; SECTOR_ALL pushBack _x;};
        case (_x find "capture" == 0): {SECTOR_CAPTURE pushBack _x; SECTOR_ALL pushBack _x;};
        case (_x find "factory" == 0): {SECTOR_FACTORY pushBack _x; SECTOR_ALL pushBack _x;};
        case (_x find "military" == 0): {SECTOR_MILITARY pushBack _x; SECTOR_ALL pushBack _x;};
        case (_x find "opfor_airspawn" == 0): {POS_AIRSPAWN pushBack _x;};
        case (_x find "opfor_point" == 0): {POS_OPFOR pushBack _x;};
        case (_x find "tower" == 0): {SECTOR_TOWER pushBack _x; if (isServer) then {_x setMarkerText format ["%1 %2",markerText _x, mapGridPosition (markerPos _x)];}; SECTOR_ALL pushBack _x;};
    };
} forEach allMapMarkers;