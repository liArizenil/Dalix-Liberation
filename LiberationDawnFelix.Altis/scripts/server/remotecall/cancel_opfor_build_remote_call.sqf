if (!isServer) exitWith {};

params [ "_price" ];

if ( _price > 0 ) then {
	combat_readiness = combat_readiness + _price;
};