Blackfish_Vehicle = [
	"B_T_VTOL_01_vehicle_F", //블랙피쉬 
 	"O_T_VTOL_02_vehicle_F", //시안
	"O_T_VTOL_02_vehicle_dynamicLoadout_F"
];


BlackfishCargo_AddAction = {
	player addAction["화물 올리기", Blackfish_Load_Cargo, [], 15, true, false, '','call Blackfish_Can_Load'];
	player addAction["경사로 열기", 
	{
		(vehicle player) animatedoor ['Door_1_source', 1];
	}, [], 15, true, false, '','(driver (vehicle player) == player && typeOf (vehicle player) in Blackfish_Vehicle && (vehicle player) doorPhase "Door_1_source" < 0.5)'];
	player addAction["경사로 닫기", 
	{
		(vehicle player) animatedoor ['Door_1_source', 0];
	}, [], 15, true, false, '','(driver (vehicle player) == player && typeOf (vehicle player) in Blackfish_Vehicle && (vehicle player) doorPhase "Door_1_source" > 0.5)'];
};

Blackfish_Can_Load = {
	_can = (nearestObjects[player, Blackfish_Vehicle,15] select 0) canVehicleCargo (nearestObjects[player modelToWorld [0,0,0], ["ReammoBox_F"],5] select 0);
	_vtolBool = (abs(player distance (nearestObjects[player modelToWorld[0,0,0], Blackfish_Vehicle,15] select 0 modelToWorld[0,-7,-6])) < 8);
	_IsinCargo = _can select 0 && _can select 1;

	(_vtolBool && _IsinCargo)
};

Blackfish_Load_Cargo = {
	_Success = (nearestObjects[player modelToWorld[0,0,0], Blackfish_Vehicle,15] select 0) setVehicleCargo (nearestObjects[player modelToWorld [0,0,0], ["ReammoBox_F"],5] select 0);
};

call BlackfishCargo_AddAction;
player addEventHandler ["Respawn",{call BlackfishCargo_AddAction;}];