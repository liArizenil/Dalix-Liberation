if ( !GRLIB_teamkill_penalty ) then {
	while { true } do {
		waitUntil { rating player < 0 };
		player addRating (abs (rating player));
		[format ["<t color='#ff0000' size = '1.5'>%1<br />%2</t>", localize "STR_WARNING_FF" , localize "STR_FRIENDLY_FIRE"],-1,0.1,7,1,0,789] spawn BIS_fnc_dynamicText;
		hint parseText format ["<t color='#ff0000' size = '1.5'>%1<br />%2</t>", localize "STR_WARNING_FF" , localize "STR_FRIENDLY_FIRE"];
	};
};
