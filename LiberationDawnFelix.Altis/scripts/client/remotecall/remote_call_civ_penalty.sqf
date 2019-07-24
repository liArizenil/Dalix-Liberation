if ( isDedicated ) exitWith {};

params [ "_civname", "_killer" ];
private [ "_playername" ];

_playername = "";
if(count (squadParams _killer) != 0) then {
	_playername = "[" + ((squadParams _killer select 0) select 0) + "] ";
};
_playername = _playername + name _killer;

gamelogic globalChat (format [ localize "STR_CIV_PENALTY_MESSAGE", _civname, _playername ] );
