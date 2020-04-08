if (isDedicated) exitWith {};

{_x setVariable ["strobes",false,true];}forEach vehicles; //Used for irstrobe.sqf attaching strobes to vehicles

waitUntil {!isNull player};

LALA_fnc_Strobe_addActions = {
	player setVariable ["strobeplayer","none",true];
	IRstrobeOn = player addAction ["<t color='#00FF00'>피아 식별장치 켜기</t>", {(_this select 0) spawn LALA_fnc_IRStrobeOn;},"",-99,false,true,"",'typeName (_target getVariable "strobeplayer") != "OBJECT" && (_target == _this) && (daytime > 18.7 OR daytime < 5.3)'];
	IRstrobeOff = player addAction ["<t color='#FF0000'>피아 식별장치 끄기</t>", {(_this select 0) spawn LALA_fnc_IRStrobeOff;},"",-99,false,true,"",'typeName (_target getVariable "strobeplayer") == "OBJECT" && ( _target == _this)'];
};

LALA_fnc_IRStrobeOn = {
	_strobe = "NVG_TargetC" createVehicle getPos _this; 
	_strobe attachTo [_this,[-0.1,0.3,0.4],"Pelvis"]; 
	_this setVariable ["strobeplayer",_strobe,true];
};

LALA_fnc_IRStrobeOff = {
	deleteVehicle (_this getVariable "strobeplayer"); 
	_this setVariable ["strobeplayer","none",true];
};

[] spawn LALA_fnc_Strobe_addActions;
player addEventHandler ["Respawn", {
	[] spawn LALA_fnc_Strobe_addActions;
}];
