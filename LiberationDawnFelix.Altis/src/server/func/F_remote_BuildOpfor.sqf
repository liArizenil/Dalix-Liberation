params [ "_price_a" ];

if ( _price_a > 0 ) then {
	combat_readiness = combat_readiness - _price_a;

	[] spawn F_recalcRsc;
};