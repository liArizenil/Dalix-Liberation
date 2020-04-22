private [ "_bluforcount, _ratio" ];

_ratio = 1.0;

if ( CONST_ADAPTIVE_OPFOR ) then {

	_bluforcount = 0.2 * ( CONST_SIDE_BLUFOR countSide allUnits );
	_bluforcount = _bluforcount + (count allPlayers);

	_ratio = 0.5 + (_bluforcount / 25.0);

	if ( _ratio > 1.0 ) then {
		_ratio = 1.0;
	};
};

_ratio