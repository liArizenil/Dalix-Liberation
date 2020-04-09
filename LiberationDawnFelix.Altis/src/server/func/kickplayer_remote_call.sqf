params ["_playerName"];

(profileNamespace getVariable ["SERVER_COMMAND_PASSWORD",""]) serverCommand format ["#kick %1",_playerName];
