params ["_player"];

private _curPlayerScore = score _player;
if(_curPlayerScore > 0) then {
  _player addScore (-1*_curPlayerScore);
  resources_ammo = resources_ammo + _curPlayerScore;
};
