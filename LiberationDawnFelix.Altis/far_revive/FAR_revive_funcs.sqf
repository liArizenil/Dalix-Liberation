GRLIB_replace_ai = false;

////////////////////////////////////////////////
// Player Actions
////////////////////////////////////////////////
FAR_Player_Actions =
{
	if (alive player && player isKindOf "Man") then
	{
		// addAction args: title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition, positionInModel, radius, radiusView, showIn3D, available, textDefault, textToolTip)
		player addAction ["<t color=""#C90000"">" + localize "STR_REVIVE" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_revive"], 10, true, true, "", "call FAR_Check_Revive"];
		player addAction ["<t color=""#C90000"">" + localize "STR_STABILIZE" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_stabilize"], 10, true, true, "", "call FAR_Check_Stabilize"];
		player addAction ["<t color=""#C90000"">" + localize "STR_SUICIDE" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_suicide"], 9, false, true, "", "call FAR_Check_Suicide"];
		player addAction ["<t color=""#C90000"">" + localize "STR_DRAG" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_drag"], 9, false, true, "", "call FAR_Check_Dragging"];
	};
};

ASKING_PUNISH = 
{
	params [ "_punishplayer" ];

	waitUntil { isNil{(uiNamespace getVariable 'GUI_VOTE')} };
	"GUI_VOTE" cutRsc ["askteamkill","PLAIN"];
	((uiNamespace getVariable 'GUI_VOTE') displayCtrl (1000)) ctrlSetText format["%1 처벌",name _punishplayer];

	GRLIB_voting_timer = 15;
	GRLIB_VOTED = 0;
	
	playSound "beep_target";
	sleep 0.1;
	private _keyeh = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		if(_this select 1 == 0x3F) then { //F5 key
			GRLIB_VOTED = 1;
		};
		if(_this select 1 == 0x40) then { //F6 key
			GRLIB_VOTED = -1;
		};
	}];
	while {GRLIB_VOTED == 0 && GRLIB_voting_timer > 0} do {
		GRLIB_voting_timer = GRLIB_voting_timer - 1;
		((uiNamespace getVariable 'GUI_VOTE') displayCtrl (1001)) ctrlSetText format["%1 초",GRLIB_voting_timer];
		sleep 1;
	};
	if(GRLIB_VOTED == 0) then {
		[1] remoteExec ["remote_call_reflection",_punishplayer];
	};
	if(GRLIB_VOTED == 1) then {
		[5] remoteExec ["remote_call_reflection",_punishplayer];
	};

	GRLIB_VOTED = nil;
	GRLIB_voting_timer = 0;
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',_keyeh];
	uiNamespace setVariable ['GUI_VOTE', nil];
	"GUI_VOTE" cutFadeOut 0;
};

////////////////////////////////////////////////
// Handle Death
////////////////////////////////////////////////
FAR_HandleDamage_EH =
{

	params [ "_unit", "_selectionName", "_amountOfDamage", "_killer", "_projectile", "_hitPartIndex","_instigator" ];
	private [ "_isUnconscious", "_killerPunished"];

	_isUnconscious = _unit getVariable "FAR_isUnconscious";

	if(isPlayer _instigator) then {
		_killer =  _instigator;
	};
	if(isUAVConnected _killer) then {
		_killer = (UAVControl _killer) select 0;
	};

	_killerPunished = (_killer getVariable ["PUNISHED",false]);
	
	if(_killerPunished && _killer != player) then {
		_oldDamage = 0;
		switch(_selectionName)do{  
			case("head") :{_oldDamage = _unit getHitPointDamage "HitHead";};  
			case("body") :{_oldDamage = _unit getHitPointDamage "HitBody";};  
			case("hands") :{_oldDamage = _unit getHitPointDamage "HitHands";};  
			case("legs") :{_oldDamage = _unit getHitPointDamage "HitLegs";};  
			case("")  :{_oldDamage = damage _unit;};  
			default{};  
		};
		_killer setDamage (damage _killer + (_amountOfDamage - _oldDamage));
		_amountOfDamage = _oldDamage;
	};
	if (alive _unit && _amountOfDamage >= 1.0 && _isUnconscious == 0 && (_selectionName in ["","head","face_hub","neck","spine1","spine2","spine3","pelvis","body"] )) then
	{
		_unit setDamage 0.6;
		_unit allowDamage false;
		_amountOfDamage = 0;
		[_unit, _killer] spawn FAR_Player_Unconscious;
	};
	_amountOfDamage
};

////////////////////////////////////////////////
// Make Player Unconscious
////////////////////////////////////////////////
FAR_Player_Unconscious =
{
	params [ "_unit", "_killer" ];

	// Death message
	if (FAR_EnableDeathMessages && !isNil "_killer" && isPlayer _killer && _killer != _unit) then
	{
		FAR_deathMessage = [_unit, _killer];
		publicVariable "FAR_deathMessage";
		["FAR_deathMessage", [_unit, _killer]] call FAR_public_EH;
	};

	if (isPlayer _unit) then
	{
		disableUserInput true;
	};

	_unit setVariable ["GREUH_isUnconscious", 1, true];

	// Eject unit if inside vehicle
	if (vehicle _unit != _unit && alive vehicle _unit) then
	{
		unAssignVehicle _unit;
		_unit action ["eject", vehicle _unit];
		_unit action ["getout", vehicle _unit];
		if ( vehicle _unit != _unit && alive vehicle _unit ) then
		{
			sleep 0.5;
			unAssignVehicle _unit;
			_unit action ["eject", vehicle _unit];
			_unit action ["getout", vehicle _unit];
		};
		sleep 1.25;
	};

	if (vehicle _unit != _unit) then {
		_unit setVariable ["GREUH_isUnconscious", 0, true];
		_unit setDamage 1;
		if (isPlayer _unit) then
		{
			disableUserInput false;
			disableUserInput true;
			disableUserInput false;
		};
	} else {

		_random_medic_message = floor (random 3);
		_medic_message = localize "STR_FAR_Need_Medic1";
		switch (_random_medic_message) do {
			case 0 : { _medic_message = localize "STR_FAR_Need_Medic1"; };
			case 1 : { _medic_message = localize "STR_FAR_Need_Medic2"; };
			case 2 : { _medic_message = localize "STR_FAR_Need_Medic3"; };
		};
		[_unit, _medic_message] remoteExec ["sideChat",-2];

		_unit setUnconscious true;
		_unit setCaptive true;
		_unit setDamage 0.6;
		_unit setVelocity [0,0,0];
		_unit allowDamage false;

		sleep 4;

		if (isPlayer _unit) then
		{
			disableUserInput false;
			disableUserInput true;
			disableUserInput false;

			// Mute ACRE
			_unit setVariable ["ace_sys_wounds_uncon", true];
		};

		_unit setUnconscious true;
		_unit setCaptive true;
		_unit setVelocity [0,0,0];
		_unit setVariable ["FAR_isUnconscious", 1, true];

		// Call this code only on players
		if (isPlayer _unit) then
		{
			_bleedOut = time + FAR_BleedOut;

			while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 && _unit getVariable "FAR_isStabilized" == 0 && (FAR_BleedOut <= 0 || time < _bleedOut) } do
			{
				hintSilent format[localize "STR_BLEEDOUT_MESSAGE" + "\n\n%2", round (_bleedOut - time), call FAR_CheckFriendlies];
				public_bleedout_message = format [localize "STR_BLEEDOUT_MESSAGE", round (_bleedOut - time)];
				public_bleedout_timer = round (_bleedOut - time);

				sleep 0.5;
			};

			if (_unit getVariable "FAR_isStabilized" == 1) then {
				//Unit has been stabilized. Disregard bleedout timer and umute player
				_unit setVariable ["ace_sys_wounds_uncon", false];

				while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 } do
				{
					hintSilent format["%1\n\n%2", localize "STR_BLEEDOUT_STABILIZED", call FAR_CheckFriendlies];
					public_bleedout_message = localize "STR_BLEEDOUT_STABILIZED";
					public_bleedout_timer = FAR_BleedOut;

					sleep 0.5;
				};
			};

			// Player bled out
			if ((FAR_BleedOut > 0 && {time > _bleedOut} && {_unit getVariable ["FAR_isStabilized",0] == 0}) || (vehicle _unit != _unit)) then
			{
				_unit setDamage 1;
			}
			else
			{
				// Player got revived
				_unit setVariable ["FAR_isStabilized", 0, true];
				if ( !GRLIB_replace_ai ) then {
					sleep 6;
				};

				// Clear the "medic nearby" hint
				hintSilent "";

				// Unmute ACRE
				if (isPlayer _unit) then
				{
					_unit setVariable ["ace_sys_wounds_uncon", false];
				};
				
				_unit setUnconscious false;
				_unit setCaptive false;
				_unit allowDamage true;

				if ( GRLIB_replace_ai ) then {
					if ( primaryWeapon player == "" ) then {
						_unit switchMove "";
					} else {
						_unit switchMove "AidlPknlMstpSrasWrflDnon_G02";
					};

					GRLIB_replace_ai = false;
				} else {
					_unit playMove "amovppnemstpsraswrfldnon";
					_unit playMove "";
				};
			};
		}
		else
		{
			// [Debugging] Bleedout for AI
			_bleedOut = time + FAR_BleedOut;

			while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 && _unit getVariable "FAR_isStabilized" == 0 && (FAR_BleedOut <= 0 || time < _bleedOut) } do
			{
				sleep 0.5;
			};

			if (_unit getVariable "FAR_isStabilized" == 1) then {
				while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 } do
				{
					sleep 0.5;
				};
			};

			// AI bled out
			if (FAR_BleedOut > 0 && {time > _bleedOut} && {_unit getVariable ["FAR_isStabilized",0] == 0}) then
			{
				_unit setDamage 1;
				_unit setVariable ["FAR_isUnconscious", 0, true];
				_unit setVariable ["FAR_isDragged", 0, true];
			}
		};
	};
};

////////////////////////////////////////////////
// Revive Player
////////////////////////////////////////////////
FAR_HandleRevive =
{
	private ["_target"];

	_target = _this select 0;

	if (alive _target) then
	{
		player playMove "AinvPknlMstpSlayWrflDnon_medic";

		if (!("Medikit" in (items player)) ) then {
			player removeItem "FirstAidKit";
		};

		_target setVariable ["FAR_isUnconscious", 0, true];
		_target setVariable ["FAR_isDragged", 0, true];

		sleep 3;

		// [Debugging] Code below is only relevant if revive script is enabled for AI
		if (!isPlayer _target) then
		{
			_target setUnconscious false;
			_unit setCaptive false;
			_target allowDamage true;
			_target setDamage 0.65;

			_target playMove "amovppnemstpsraswrfldnon";
		};

	};
};

////////////////////////////////////////////////
// Stabilize Player
////////////////////////////////////////////////
FAR_HandleStabilize =
{
	private ["_target"];

	_target = _this select 0;

	if (alive _target) then
	{
		player playMove "AinvPknlMstpSlayWrflDnon_medic";

		if (!("Medikit" in (items player)) ) then {
			player removeItem "FirstAidKit";
		};

		_target setVariable ["FAR_isStabilized", 1, true];

		sleep 6;
	};
};

////////////////////////////////////////////////
// Drag Injured Player
////////////////////////////////////////////////
FAR_Drag =
{
	private ["_target", "_id"];

	FAR_isDragging = true;

	_target = _this select 0;

	_target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;
	_target setVariable ["FAR_isDragged", 1, true];

	player PlayMove "AcinPknlMstpSrasWrflDnon";

	// Rotation fix
	FAR_isDragging_EH = _target;
	publicVariable "FAR_isDragging_EH";

	// Add release action and save its id so it can be removed
	_id = player addAction ["<t color=""#C90000"">" + localize "STR_RELEASE" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_release"], 10, true, true, "", "true"];

	hint localize "STR_PRESSC";

	// Wait until release action is used
	waitUntil
	{
		!alive player || player getVariable "FAR_isUnconscious" == 1 || !alive _target || _target getVariable "FAR_isUnconscious" == 0 || !FAR_isDragging || _target getVariable "FAR_isDragged" == 0
	};

	// Handle release action
	FAR_isDragging = false;

	if (!isNull _target && alive _target) then
	{
		_target switchMove "AinjPpneMstpSnonWrflDnon";
		_target setVariable ["FAR_isDragged", 0, true];
		detach _target;
	};

	player removeAction _id;
};

FAR_Release =
{
	// Switch back to default animation
	player playMove "amovpknlmstpsraswrfldnon";

	FAR_isDragging = false;
};

////////////////////////////////////////////////
// Event handler for public variables
////////////////////////////////////////////////
FAR_public_EH =
{
	if(count _this < 2) exitWith {};

	_EH  = _this select 0;
	_target = _this select 1;

	// FAR_isDragging
	if (_EH == "FAR_isDragging_EH") then
	{
		_target setDir 180;
	};

	// FAR_deathMessage
	if (_EH == "FAR_deathMessage") then
	{
		_killed = _target select 0;
		_killer = _target select 1;

		if (isPlayer _killed && isPlayer _killer) then
		{
			if(side _killed == side _killer) then {
				if(local _killed && !(_killer getVariable ["PUNISHED",false])) then {
					[_killer] spawn ASKING_PUNISH;
				};
				systemChat format[localize "STR_FAR_FIRNELDYFIRE", name _killed, name _killer];
				_killer addrating -100;
			}
			else{
				if(side _killer == GRLIB_side_friendly) then{
					systemChat format[localize "STR_FAR_OPFORKILLED", name _killed, name _killer];
					_killer addPlayerScores [1, 0, 0, 0, 0];
				};
				if(side _killer == GRLIB_side_enemy) then {
					systemChat format[localize "STR_FAR_BLUFORKILLED", name _killed, name _killer];
					_killer addPlayerScores [1, 0, 0, 0, 0];
				};
			};
		};
	};
};

////////////////////////////////////////////////
// Revive Action Check
////////////////////////////////////////////////
FAR_Check_Revive =
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];

	_return = false;

	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf player >> "attendant");
	_target = cursorTarget;

	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 3 || vehicle player != player) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable "FAR_isDragged";

	// Make sure target is unconscious and player is a medic
	if (_isTargetUnconscious == 1 && _isDragged == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) && ( ("FirstAidKit" in (items player)) || ("Medikit" in (items player)) ) ) then
	{
		_return = true;

		// [ReviveMode] Check if player has a Medikit
		if ( FAR_ReviveMode == 2 && !("Medikit" in (items player)) ) then
		{
			_return = false;
		};
	};

	_return
};

////////////////////////////////////////////////
// Stabilize Action Check
////////////////////////////////////////////////
FAR_Check_Stabilize =
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];

	_return = false;

	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	_target = cursorTarget;


	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isTargetStabilized = _target getVariable "FAR_isStabilized";
	_isDragged = _target getVariable "FAR_isDragged";

	// Make sure target is unconscious and hasn't been stabilized yet, and player has a FAK/Medikit
	if (_isTargetUnconscious == 1 && _isTargetStabilized == 0 && _isDragged == 0 && ( ("FirstAidKit" in (items player)) || ("Medikit" in (items player)) ) ) then
	{
		_return = true;
	};

	_return
};

////////////////////////////////////////////////
// Suicide Action Check
////////////////////////////////////////////////
FAR_Check_Suicide =
{
	_return = false;
	_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",0];

	if (alive player && _isPlayerUnconscious == 1) then
	{
		_return = true;
	};

	_return
};

////////////////////////////////////////////////
// Dragging Action Check
////////////////////////////////////////////////
FAR_Check_Dragging =
{
	private ["_target", "_isPlayerUnconscious", "_isDragged"];

	_return = false;
	_target = cursorTarget;
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";

	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return;
	};

	// Target of the action
	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable "FAR_isDragged";

	if(_isTargetUnconscious == 1 && _isDragged == 0) then
	{
		_return = true;
	};

	_return
};

////////////////////////////////////////////////
// Show Nearby Friendly Medics
////////////////////////////////////////////////
FAR_IsFriendlyMedic =
{
	private ["_unit"];

	_return = false;
	_unit = _this;
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf _unit >> "attendant");

	if ( alive _unit && (isPlayer _unit || FAR_Debugging) && side _unit == FAR_PlayerSide && _unit getVariable "FAR_isUnconscious" == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) ) then
	{
		_return = true;
	};

	_return
};

FAR_CheckFriendlies =
{
	private ["_unit", "_units", "_medics", "_hintMsg"];

	_units = (getpos player) nearEntities [ ["Man", "Car", "Air", "Ship"], 800];
	_medics = [];
	_dist = 800;
	_hintMsg = "";

	// Find nearby friendly medics
	if (count _units > 1) then
	{
		{
			if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then
			{
				if (alive _x && count (crew _x) > 0) then
				{
					{
						if (_x call FAR_IsFriendlyMedic) then
						{
							_medics = _medics + [_x];

							if (true) exitWith {};
						};
					} forEach crew _x;
				};
			}
			else
			{
				if (_x call FAR_IsFriendlyMedic) then
				{
					_medics = _medics + [_x];
				};
			};

		} forEach _units;
	};

	// Sort medics by distance
	if (count _medics > 0) then
	{
		{
			if (player distance _x < _dist) then
			{
				_unit = _x;
				_dist = player distance _x;
			};

		} forEach _medics;

		if (!isNull _unit) then
		{
			_unitName	= name _unit;
			_distance	= floor (player distance _unit);

			_hintMsg = format["근처 의무병 \n%1 가(이) %2m 근처에 있습니다.", _unitName, _distance];
		};
	}
	else
	{
		_hintMsg = "근처에 의무병이 없습니다.";
	};

	_hintMsg
};



