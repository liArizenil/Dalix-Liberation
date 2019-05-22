if (isDedicated) exitWith {};

AddplayerToATC={
	7 radioChannelAdd [player];
	hint "항공 무전망에 연결되었습니다";
};
RemoveplayerfromATC={
	7 radioChannelRemove [player];
};
RemoveplayerfromATCInTower={
	7 radioChannelRemove [player];
	hint "항공 무전망과 연결이 끊겼습니다";
};
PlayerInAir={
	params["_vehicle","_role"];
	_bool = (_vehicle isKindOf "Air") && !(typeOf _vehicle == "Steerable_Parachute_F");
	_ispilot = "driver" isEqualTo _role;
	if(_bool && _ispilot) then{
		[] call AddplayerToATC;
	};
};
player addEventHandler["GetInMan",{[_this select 2,_this select 1] call PlayerInAir}];
player addEventHandler["GetOutMan",{call RemoveplayerfromATC}];
player addEventHandler["Killed",{call RemoveplayerfromATC}];
