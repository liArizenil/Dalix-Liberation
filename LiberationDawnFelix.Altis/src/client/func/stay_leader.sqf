if ( !CONST_TEAMKILL_PENALTY ) then {
	while { true } do {
		waitUntil {
			sleep 1;
			(leader player != player) && (local (group player))
		};

		(group player) selectLeader player;
	};
};