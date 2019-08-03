private ["_curPlayerScore"];
_curPlayerScore = score player;

if(_curPlayerScore > 0) then {
  [player] remoteExec ["exchange_score_remote_call",2];
  hint format[localize "STR_AMMO_EXCHANGED",_curPlayerScore];
}
else{
  hint localize "STR_NOT_ENOUGH_SCORE";
};
