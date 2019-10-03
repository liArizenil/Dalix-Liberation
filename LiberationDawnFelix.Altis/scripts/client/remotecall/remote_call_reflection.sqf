if ( isDedicated ) exitWith {};

params [ "_KARMA" ];

_prevkarma = player getVariable ["Karma", 0];

player setVariable ["Karma",_prevkarma+_KARMA,false];

_prevkarma = player getVariable ["Karma", 0];

if(_prevkarma > 5) then {
	fnc_ehdmg = {
		params ["_object"];
		_object addEventHandler ["HandleDamage", {
			if((_this select 3) == player) then { 
				player setHit [_this select 1,_this select 2];
				0
			};
		}];
	};

	while { true } do {
		_ehplayer = allPlayers select { side _x == GRLIB_side_friendly && !(_x getVariable ["reflectAttached",false]) && _x != player };
		{
			_x addEventHandler ["Respawn",{[_this select 0] call fnc_ehdmg;}];
			[_x] call fnc_ehdmg;
		} forEach _ehplayer;
		sleep 5;
	};
};