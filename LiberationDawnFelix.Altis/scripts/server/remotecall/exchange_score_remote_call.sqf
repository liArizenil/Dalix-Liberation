params ["_player"];

private _curPlayerScore = ((getPlayerScores player) select 5);
if(_curPlayerScore > 0) then {
  _player addScore (-1*_curPlayerScore);
  resources_ammo = resources_ammo + _curPlayerScore;
};
