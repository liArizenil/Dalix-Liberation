params["_player", "_amt"];
private _playerUID = getPlayerUID _player;
resources_ammo set [_playerUID, (resources_ammo getOrDefault [_playerUID, 0]) + _amt];
[ _player ] call updateammo_remote_call;