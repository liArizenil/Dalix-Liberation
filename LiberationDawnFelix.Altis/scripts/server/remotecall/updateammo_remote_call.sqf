params["_player"];

private _playerUID = getPlayerUID _player;
if(!(_playerUID in SV_resources_ammo)) then { SV_resources_ammo set [_playerUID, 0]; };

[SV_resources_ammo get _playerUID] remoteExec ["remote_call_setammo", _player];