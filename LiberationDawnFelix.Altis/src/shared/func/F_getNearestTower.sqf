params [ "_postosearch", "_side", "_limit" ];
private [ "_sector_to_return", "_sectors_to_search", "_sectors_to_search_sorted"];

_sector_to_return = '';
_sectors_to_search = [];
if ( _side == CONST_SIDE_OPFOR ) then {
	_sectors_to_search = (SECTOR_TOWER - SECTOR_BLUFOR);
} else {
	_sectors_to_search = SECTOR_BLUFOR select { _x in SECTOR_TOWER };
};

_sectors_to_search = _sectors_to_search select { (markerPos _x) distance _postosearch < _limit };

_sectors_to_search_sorted = [ _sectors_to_search , [_postosearch] , { (markerPos _x) distance _input0 } , 'ASCEND' ] call BIS_fnc_sortBy;
if ( count _sectors_to_search_sorted > 0 ) then { _sector_to_return = _sectors_to_search_sorted select 0; } else { _sector_to_return = '' };

_sector_to_return;
