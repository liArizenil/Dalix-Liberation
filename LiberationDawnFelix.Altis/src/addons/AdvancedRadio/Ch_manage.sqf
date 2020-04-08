while {true} do {
	if(leader group player == player) then {
		_temp = player getVariable "MainCh";
		if(isNil "_temp") then {
			_temp = (group player) getVariable "MainCh";
			if(!isNil "_temp") then {
				player setVariable ["MainCh",_temp,true];
				_temp radioChannelAdd [player];
				_temp = (group player) getVariable "SubCh";
				if(!isNil "_temp") then {
					player setVariable ["SubCh",_temp,true];
					_temp radioChannelAdd [player];
				};
			}
			else{
				player setVariable ["MainCh",1,true];
				1 radioChannelAdd [player];
			};
		}
		else{
			player setVariable ["MainCh",_temp,true];
			(group player) setVariable ["MainCh",_temp,true];
			_temp = player getVariable "SubCh";
			if(!isNil "_temp") then {
				player setVariable ["SubCh",_temp,true];
				(group player) setVariable ["SubCh",_temp,true];
			};
		};
	}
	else{
		_temp = player getVariable "MainCh";
		if(!isNil "_temp") then {
			(_temp) radioChannelRemove [player];
			player setVariable ["MainCh",nil,true];
		};
		_temp = player getVariable "SubCh";
		if(!isNil "_temp") then {
			(_temp) radioChannelRemove [player];
			player setVariable ["SubCh",nil,true];
		};
	};
	_chatst = (((channelEnabled 0) select 1) && ((channelEnabled 1) select 1));
	if((call BIS_fnc_admin == 2)) then {
		if(!_chatst) then {
			0 enableChannel [true, true];
			1 enableChannel [true, true];
		};
	}
	else{
		if(_chatst) then {
			0 enableChannel [true, false];
			1 enableChannel [true, false];
		};
	};
	sleep 2;
};
