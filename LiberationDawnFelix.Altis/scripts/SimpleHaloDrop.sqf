#define MIN_ALTITUDE_AVAIL 100

#define STR_DO_HALO "공수 강하"

HALO_DROP_Vehicle = [
	["B_T_VTOL_01_infantry_F","Door_1_source"], //블랙피쉬
	["Heli_Transport_03_base_F","Door_rear_source"], //휴론
	["I_Heli_Transport_02_F","CargoRamp_Open"],//모호크
	["C_IDAP_Heli_Transport_02_F","CargoRamp_Open"],//EH302
	["O_Heli_Transport_04_covered_F","Door_6_source"],//타루
	["O_T_VTOL_02_infantry_F","Door_1_source"],
	["O_T_VTOL_02_infantry_hex_F","Door_1_source"]
];

HALO_DROP_AddAction = {
   player addAction["<t color='#00ff00'>"+STR_DO_HALO+"</t><img size='2' image='res\ui_redeploy.paa'/>", HALO_DROP_DO_HALO, [], 15, true, false, '','call HALO_DROP_Can_Halo'];
};

HALO_DROP_Can_Halo = {
  _vtol = objectParent player;
  _role = _vtol getCargoIndex player;
  _CrewBool = true;
  _doorBool = false;
  _alt = (getPosATL _vtol select 2);

  if ( _role < 0) then { _CrewBool = false }; // No pilots

  _altBool = (_alt > MIN_ALTITUDE_AVAIL);
  {
      if (_vtol isKindOf (_x select 0)) exitWith {
         _doorBool = ((_vtol doorPhase (_x select 1)) > 0.5);
      };
  } forEach HALO_DROP_Vehicle;

  (_altBool && _doorBool && _CrewBool)
};

HALO_DROP_DO_HALO = {
	private [ "_backpack", "_backpackcontents" ];
	_backpack = backpack player;
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		_backpackcontents = backpackItems player;
		removeBackpack player;
		sleep 0.1;
	};
	player addBackpack "B_Parachute";

	player action ["Eject",vehicle player];

	sleep 1;

	waitUntil { !alive player || isTouchingGround player };
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		sleep 2;
		player addBackpack _backpack;
		clearAllItemsFromBackpack player;
		{ player addItemToBackpack _x } foreach _backpackcontents;
	};
};
call HALO_DROP_AddAction;
player addEventHandler ["Respawn",{call HALO_DROP_AddAction;}];