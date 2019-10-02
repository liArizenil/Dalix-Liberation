if ( isDedicated ) exitWith {};

params [ "_requestPlayer", "_requestclass" ];

GRLIB_voting_timer = 15;
private _get = _requestPlayer getVariable["VoteBuild",nil];

GRLIB_VOTED = false;

waitUntil { !isNil{(uiNamespace getVariable 'GUI_VOTE')} || isNil "_get" };

if(isNil "_get") exitWith {};
"GUI_VOTE" cutRsc ["askbuild","PLAIN"];
(uiNamespace getVariable 'GUI_VOTE') ctrlSetText [1006,format["%2 : %3 건설 요청",name _requestPlayer,_requestclass]];
private _keyeh = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	if(_this select 1 == 0xC7) then { //HOME key
		_get = _requestPlayer getVariable["VoteBuild",nil];
		_requestPlayer setVariable["VoteBuild",(_get select 1)+1,true];
		GRLIB_VOTED = true;
	};
	if(_this select 1 == 0xCF) then { //END key
		_get = _requestPlayer getVariable["VoteBuild",nil];
		_requestPlayer setVariable["VoteBuild",(_get select 2)+1,true];
		GRLIB_VOTED = true;
	};
}];
[] spawn {
	while { GRLIB_voting_timer > 0 } do {
		GRLIB_voting_timer = GRLIB_voting_timer - 1;
		(uiNamespace getVariable 'GUI_VOTE') ctrlSetText [1006,format["%1 초",GRLIB_voting_timer]];
		sleep 1;
	};
}
while { !isNil{ _requestPlayer getVariable["VoteBuild",nil] } && !GRLIB_VOTED && GRLIB_voting_timer > 0} do {
	_get = _requestPlayer getVariable["VoteBuild",nil];
	(uiNamespace getVariable 'GUI_VOTE') ctrlSetText [1000,format["찬성 %1/%2",_get select 1,_get select 0] ];
	(uiNamespace getVariable 'GUI_VOTE') ctrlSetText [1001,format["반대 %1/%2",_get select 2,_get select 0] ];
};
if(!isNil{ _requestPlayer getVariable["VoteBuild",nil] } && !GRLIB_VOTED) then {
	_get = _requestPlayer getVariable["VoteBuild",nil];
	_requestPlayer setVariable["VoteBuild",(_get select 1)+1,true];
};
GRLIB_VOTED = nil;
GRLIB_voting_timer = 0;
(findDisplay 46) displayRemoveEventHandler ['KeyDown',_keyeh];
uiNamespace setVariable ['GUI_VOTE', nil];
"GUI_VOTE" cutFadeOut 0;