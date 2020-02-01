//============ UI Controller =====================
Mainlabel = [801,802,803,804,805,806];
Sublabel = [811,812,813,814,815,816];
GetChlistener = {
	params["_channel"];
	private _groupnameMain = parseText "--메인--";
	private _groupnameSub = parseText "--보조--";
	{
		if(_channel == ((leader _x) getVariable "MainCh") && count(units _x) !=0) then {
			_groupnameMain = (formatText["%1%2%3",_groupnameMain, lineBreak , groupId _x]);
		};
		if(_channel == ((leader _x) getVariable "SubCh") && count(units _x) !=0) then {
			_groupnameSub = (formatText["%1%2%3",_groupnameSub, lineBreak , groupId _x]);
		};
	} forEach allGroups;
	_groupnameMain = (formatText["%1%2%3",_groupnameMain, lineBreak , _groupnameSub]);
	_groupnameMain
};
ChangeMainChannel = {
	params["_channel","_prevChannel"];
	[_channel, _prevChannel] call Ari_fnc_ChangeMainCh;
	ctrlShow [Mainlabel select (_prevChannel - 1), false];
	ctrlShow [Mainlabel select (_channel - 1), true];
};
ChangeSubChannel = {
	params["_channel","_prevChannel"];
	[_prevChannel] call DisconnectfromSubChannel;
	[_channel] call ConnectToSubChannel;
};
ConnectToSubChannel = {
	params["_channel"];
	[_channel] call Ari_fnc_ConnectToSubCh;
	ctrlShow [Sublabel select (_channel - 1), true];
};
DisconnectfromSubChannel = {
	params["_channel"];
	[_channel] call Ari_fnc_DisconnectFromSubCh;
	ctrlShow [Sublabel select (_channel - 1), false];
};

_dialog = createDialog "Radio_Menu";
waitUntil { dialog };
{
	if((_x % 10) == player getVariable "MainCh") then {
		ctrlShow [_x, true];
	} else{
		ctrlShow [_x, false];
	};
} foreach Mainlabel;
{
	ctrlShow [_x, false];
} foreach Sublabel;
_tempsub = player getVariable "SubCh";
if((!isNil "_tempsub")) then {
	ctrlShow [Sublabel select (_tempsub - 1), true];
};
ctrlShow [561, false];
_tempsub = nil;
while{dialog && alive player && player == leader player} do {
	if(!isNil "listview") then {
		if(isNil "preview") then {
			((findDisplay 5568) displayCtrl 561) ctrlSetStructuredText ([listview] call GetChlistener);
			ctrlShow [561, true];
			preview = listview;
		}
		else{
			if(listview == preview) then {
				ctrlShow [561, false];
				preview = nil;
			}
			else{
				((findDisplay 5568) displayCtrl 561) ctrlSetStructuredText ([listview] call GetChlistener);
				preview = listview;
			};
		};
	};
	if(!isNil "curMain") then {
		if((player getVariable "MainCh") != curMain) then {
			_tempsub = (player) getVariable "SubCh";
			if(!isNil "_tempsub") then {
				if((_tempsub) == curMain) then {
					[_tempsub] call DisconnectfromSubChannel;
				};
			};
			[curMain,(player) getVariable "MainCh"] call ChangeMainChannel;
		};
	};
	if(!isNil "curSub") then {
		_tempsub = (player) getVariable "SubCh";
		if(isNil "_tempsub") then {
			if(((player) getVariable "MainCh") == curSub) then {
				hint "같은 채널을 동시에 사용하실 수는 없습니다.";
			}
			else{
				[curSub] call ConnectToSubChannel;
			};
		}
		else{
			if(((player) getVariable "MainCh") == curSub) then {
				hint "같은 채널을 동시에 사용하실 수는 없습니다.";
			}
			else{
				if((_tempsub) != curSub) then {
					[curSub,_tempsub] call ChangeSubChannel;
				}
				else{
					[curSub] call DisconnectfromSubChannel;
				};
			};
		};
	};
	curMain = nil;
	curSub = nil;
	listview = nil;
	uiSleep 0.2;
};
preview = nil;
closeDialog 0;
