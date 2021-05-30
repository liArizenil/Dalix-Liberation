params ["_player"];

(profileNamespace getVariable ["SERVER_COMMAND_PASSWORD",""]) serverCommand format ["#kick %1",name _player];