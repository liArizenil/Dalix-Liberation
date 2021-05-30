params["_player"];

private _playerUID = getPlayerUID _player;
if(!(_playerUID in resources_ammo)) then { resources_ammo set [_playerUID, 0]; };

[resources_ammo get _playerUID] remoteExec ["remote_call_setammo", _player];