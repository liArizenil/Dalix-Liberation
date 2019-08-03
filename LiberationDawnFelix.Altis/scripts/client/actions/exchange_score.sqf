private ["_curPlayerScore"];

if(score player > 0) then {
  [player] remoteExec ["exchange_score_remote_call",2];
  hint localize "STR_AMMO_EXCHANGED";
}
else{
  hint localize "STR_NOT_ENOUGH_SCORE";
};
