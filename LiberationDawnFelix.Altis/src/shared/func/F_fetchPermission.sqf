params [ "_source", "_permission" ];
private [ "_uidvar", "_ret" ];

if ( isNil "GRLIB_last_permission_check_time" ) then { GRLIB_last_permission_check_time = -1000; };
if ( isNil "player_permissions_cache" ) then { player_permissions_cache = []; };

_ret = false;

if ( !CONST_PLAYER_PERMISSION ) then {
	_ret = true;
} else {
	if ( !(isNil "player_permissions") && !(isNull _source) ) then {

		if ( time > GRLIB_last_permission_check_time + 10 ) then {
			GRLIB_last_permission_check_time = time;
			_uidvar = getPlayerUID _source;
			{ if ( _uidvar == _x select 0 ) exitWith { player_permissions_cache  = [] + (_x select 1) }; } foreach player_permissions;
		};

		if ( count player_permissions_cache > _permission ) then {
			_ret = player_permissions_cache select _permission;
		};
	};
};

_ret