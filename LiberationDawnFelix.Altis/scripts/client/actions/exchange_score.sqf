private ["_curPlayerScore"];

if(score player > 0) then {
  _curPlayerScore = score player;
  player addScore (-1*_curPlayerScore);
  [_curPlayerScore,"ammo"] remoteExec ["resources_remote_call",2];
  hint localize "STR_AMMO_EXCHANGED";
}
else{
  hint localize "STR_NOT_ENOUGH_SCORE";
};
