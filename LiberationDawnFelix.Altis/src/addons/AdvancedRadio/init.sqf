if (isServer) then {
	[] execVM "scripts\AdvancedRadio\initChannel.sqf";
};

if (hasInterface && side player == CONST_SIDE_BLUFOR) then {
	Mainlabel = [801,802,803,804,805,806];
	Sublabel = [811,812,813,814,815,816];
	//============== Main Func ==================================
	Ari_fnc_RadioAddAction = {
		player addAction["<t color='#aaaa00'>-- 라디오 열기-- </t><img size='2' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/>", "scripts\AdvancedRadio\ui_manage.sqf", [], -100, false, false, '','leader group player == player'];
	};
	Ari_fnc_Reconnect = {
		private["_tempt"];
		_tempt = player getVariable "MainCh";
		if(!isNil "_tempt") then {
			_tempt radioChannelAdd [player];
		};
		_tempt = player getVariable "SubCh";
		if(!isNil "_tempt") then {
			_tempt radioChannelAdd [player];
		};
	};
	Ari_fnc_ChangeMainCh = {
		params["_newCh","_prevCh"];

		_newCh radioChannelAdd [player];
		setCurrentChannel (_newCh + 5);

		_prevCh radioChannelRemove [player];

		player setVariable ["MainCh",_newCh,true];
		(group player) setVariable ["MainCh",_newCh,true];
	};
	Ari_fnc_DisconnectFromSubCh = {
		params["_ch"];

		_ch radioChannelRemove [player];

		player setVariable ["SubCh",nil,true];
		(group player) setVariable ["SubCh",nil,true];
	};
	Ari_fnc_ConnectToSubCh = {
		params["_ch"];

		_ch radioChannelAdd [player];
		setCurrentChannel (_ch + 5);

		player setVariable ["SubCh",_ch,true];
		(group player) setVariable ["SubCh",_ch,true];

	};
	Ari_fnc_ChangeSubCh = {
		params["_newCh","_prevCh"];

		_prevCh call Ari_fnc_DisconnectFromSubCh;
		_newCh call Ari_fnc_ConnectToSubCh;
	};
	0 enableChannel [true, false];
	1 enableChannel [true, false];

	[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\Ch_manage.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\atc_channel.sqf";

	call Ari_fnc_RadioAddAction;
	player addEventHandler ["Respawn",{call Ari_fnc_RadioAddAction;}];
	player addEventHandler ["Respawn",{call Ari_fnc_Reconnect;}];

	waitUntil {!isNull(findDisplay 46)};

	(findDisplay 46) displayAddEventHandler ["KeyDown", {
			if(leader player == player) then {
				private _inputKey = (_this select 1);
				if(_this select 3) then { //press ctrl (Main Key)
					if(_inputKey == 0x19) then { //press P
						if(!isnull(findDisplay 5568)) then {
							(findDisplay 5568) closeDisplay 0;
						}else{
							[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\ui_manage.sqf";
						};
					};
					if(_inputKey > 0x01 && _inputKey < 0x08 && isnull(findDisplay 5568)) then{
						_inputKey = _inputKey - 1;
						if(player getVariable "MainCh" != _inputKey) then {
							if(player getVariable "SubCh" == _inputKey) then {
								[player getVariable "SubCh"] call Ari_fnc_DisconnectFromSubCh;
							};
							[_inputKey, player getVariable "MainCh"] call Ari_fnc_ChangeMainCh;
						}
						else{
							setCurrentChannel (_inputKey + 5);
						};
					};	
				};
				if(_this select 4) then { //press Alt (Sub Key)
					if(_inputKey > 0x01 && _inputKey < 0x08 && isnull(findDisplay 5568)) then{
						_inputKey = _inputKey - 1;
						if(player getVariable "MainCh" != _inputKey) then {
							if(isNil {player getVariable "SubCh"}) then {
								[_inputKey] call Ari_fnc_ConnectToSubCh;
							}
							else{
								if(player getVariable "SubCh" == _inputKey) then {
									[player getVariable "SubCh"] call Ari_fnc_DisconnectFromSubCh;
								}
								else{
									[_inputKey, player getVariable "SubCh"] call Ari_fnc_ChangeSubCh;
								};
							};
						}
						else{
							hint "같은 채널을 동시에 사용하실 수는 없습니다.";
						};
					};
				};
			};
	}];
};