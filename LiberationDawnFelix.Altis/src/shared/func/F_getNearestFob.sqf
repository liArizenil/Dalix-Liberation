params [ [ "_source_position", (getpos player) ] ];
private [ "_retvalue" ];

_retvalue = [];
if ( count FOB_ALL > 0 ) then {
	_retvalue = ( [ FOB_ALL , [] , { _source_position distance _x } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
};

_retvalue
