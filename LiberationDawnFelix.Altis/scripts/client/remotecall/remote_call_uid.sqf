sleep 3;

if ((getPlayerUID player) == "76561198339078065") then  {
	player setUnitTrait ["Medic",true];
	player setUnitTrait ["Engineer",true];
	player setUnitTrait ["UAVhacker",true];
	player setUnitTrait ["ExplosiveSpecialist",true];
	
	player addAction ["<t color='#FF0000'>Arsenal Box</t>", {["Open",true ] spawn BIS_fnc_arsenal}];
	player addAction ["<t color='#FF0000'>God mod ON</t>", {
	player setUnitRecoilCoefficient 0;
	player setCustomAimCoef 0;
	player addeventhandler ["handledamage",{ player setdamage ((damage player) /3)}];
	player addeventhandler ["fired", {player setvehicleammo 1}];
	}];
	player addAction ["<t color='#FF0000'>God mod OFF</t>", {
	player setUnitRecoilCoefficient 1;
	player setCustomAimCoef 1;
	player removeAllEventHandlers "handledamage";
	player removeAllEventHandlers "fired";
	[player, suppreq] call BIS_fnc_removeSupportLink;
	}];
};
