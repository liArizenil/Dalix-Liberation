waitUntil {!isNull(findDisplay 46)};
disableSerialization;
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	private _handled = false;
	if(_this select 1 == 0x0C) then {  // key 6		DIK_6 
		if (isNil "AR_active") then {AR_active = false;};
		if (AR_active) exitWith {AR_active = false; _handled = true;};

		if (!isNull objectParent player) exitWith {};
		if (surfaceIsWater (getPos player)) exitWith {};
		if ((player getVariable "FAR_isUnconscious") == 1) exitWith {};

		AR_active = true;
		AR_weapon = currentWeapon player;
		AR_animation = switch (true) do {
			case (AR_weapon isEqualTo ""): {"AmovPercMevaSnonWnonDf"};
			case (AR_weapon isEqualTo (primaryWeapon player)): {"AmovPercMevaSlowWrflDf"};
			case (AR_weapon isEqualTo (secondaryWeapon player)): {"AmovPercMevaSlowWrflDf"};
			case (AR_weapon isEqualTo (handgunWeapon player)): {"AmovPercMevaSlowWpstDf"};
		};

		player playMoveNow AR_animation;

		player addEventHandler ["AnimChanged", {
			if ((!AR_active) || {!((currentWeapon player) isEqualTo AR_weapon)} || {!isNull objectParent player} || {surfaceIsWater (getPos player)}) exitWith {
				player removeEventHandler ["AnimChanged", _thisEventHandler];

				AR_weapon = currentWeapon player;
				AR_animation = switch (true) do {
					case (AR_weapon isEqualTo ""): {"AmovPercMstpSnonWnonDnon"};
					case (AR_weapon isEqualTo (primaryWeapon player)): {"AmovPercMstpSlowWrflDnon"};
					case (AR_weapon isEqualTo (secondaryWeapon player)): {"AmovPercMevaSlowWlnrDf"};
					case (AR_weapon isEqualTo (handgunWeapon player)): {"AmovPercMstpSlowWpstDnon"};
				};

				player playMoveNow AR_animation;

				AR_active = false;
				AR_weapon = nil;
				AR_animation = nil;
			};
				player playMoveNow AR_animation;
		}];
			_handled = true;
	};
	if(_this select 1 == 0x0D) then {
		if(!alive player)exitWith{};
		if((primaryWeapon player!="")||{(handgunWeapon player!="")})then{player action["switchWeapon",player,player,-1];};
	};
	_handled
}];
