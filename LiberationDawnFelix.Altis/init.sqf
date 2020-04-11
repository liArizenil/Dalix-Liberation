[] call compileFinal preprocessFileLineNumbers "src\shared\init_shared.sqf";

if (isServer) then { //server
	[] spawn compileFinal preprocessFileLineNumbers "src\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then { //hc
	[] spawn compileFinal preprocessFileLineNumbers "src\server\init_hc.sqf";
};

if (!isDedicated && hasInterface) then { //client
	[] spawn compileFinal preprocessFileLineNumbers "src\client\init_client.sqf";
} else {
	setViewDistance 1600;
};