private ["_curPlayerScore", "_result"];

_curPlayerScore = score player;
if ([format[" 정말 %1만큼의 점수를 %1만큼의 탄약으로 교환하시겠습니까?", _curPlayerScore],"재확인",true,true] call BIS_fnc_guiMessage ) then {
            if(_curPlayerScore > 0) then {
            [player] remoteExec ["exchange_score_remote_call",2];
            hint format[localize "STR_AMMO_EXCHANGED",_curPlayerScore];
            }
        else{
            hint localize "STR_NOT_ENOUGH_SCORE";
            };
};
