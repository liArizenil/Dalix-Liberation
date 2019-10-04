if ( isDedicated ) exitWith {};

params [ "_KARMA" ];

_prevkarma = player getVariable ["Karma", 0];
if(_prevkarma+_KARMA < 6) then {
	player setVariable ["Karma",_prevkarma+_KARMA,false];
}
else{
	player setVariable ["Karma",6,false];
	player setVariable ["PUNISHED",true,true];
	1 cutRsc ["teamkillactivated","PLAIN",0];
};