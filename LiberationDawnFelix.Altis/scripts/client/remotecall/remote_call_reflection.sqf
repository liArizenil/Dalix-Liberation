if ( isDedicated ) exitWith {};

params [ "_KARMA" ];

_prevkarma = player getVariable ["Karma", 0];
if(_prevkarma+_KARMA < 6) then {
	player setVariable ["Karma",_prevkarma+_KARMA,false];
	[player, -(_KARMA * 100)] remoteExec ["addammo_remote_call", 2];
}
else{
	player setVariable ["Karma",6,false];
	if(!(player getVariable ["PUNISHED",false])) then {
		player setVariable ["PUNISHED",true,true];
		1 cutRsc ["teamkillactivated","PLAIN",0];
		profileNamespace setVariable ["DALIX_BAN_KARMA", (profileNamespace getVariable ["DALIX_BAN_KARMA", 0]) + 1];
		if((profileNamespace getVariable ["DALIX_BAN_KARMA", 0]) == 3) exitWith {
			player remoteExec ["kickplayer_remote_call",2];
		};
		if((profileNamespace getVariable ["DALIX_BAN_KARMA", 0]) > 3) exitWith {
			player remoteExec ["banplayer_remote_call",2];
		};
	};
};