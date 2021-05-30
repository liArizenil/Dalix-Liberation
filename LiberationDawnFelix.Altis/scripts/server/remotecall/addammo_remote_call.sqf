params["_player", "_amt"];
private _playerUID = getPlayerUID _player;
SV_resources_ammo set [_playerUID, (SV_resources_ammo getOrDefault [_playerUID, 0]) + _amt];
[ _player ] call updateammo_remote_call;