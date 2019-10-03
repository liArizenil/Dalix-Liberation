if ( isDedicated ) exitWith {};

params [ "_KARMA" ];

_prevkarma = player getVariable ["Karma", 0];
if(_prevkarma+_KARMA < 6) then {
	player setVariable ["Karma",_prevkarma+_KARMA,false];
}
else{
	player setVariable ["Karma",6,false];
	player setVariable ["PUNISHED",true,true];
	if(!GRTLIB_reflection_is_progress) then {
		GRTLIB_reflection_is_progress = true;
		1 cutRsc ["teamkillactivated","PLAIN",0];
		fnc_ehdmg = {
			params ["_object"];
			_object addEventHandler ["HandleDamage", {
				if((_this select 3) == player) then {
					if((_this select 1) in ["","head","face_hub","neck","spine1","spine2","spine3","pelvis","body"]) then {
						player setDamage ((_this select 2) + damage player);
					};
				};
			}];
		};

		while { true } do {
			_ehplayer = allPlayers select { !(_x getVariable ["reflectAttached",false]) && _x != player };
			{
				_x addEventHandler ["Respawn",{[(_this select 0)] call fnc_ehdmg;}];
				[_x] call fnc_ehdmg;
				_x setVariable ["reflectAttached",true,false];
			} forEach _ehplayer;
			sleep 5;
		};
	};
};