RadioAddAction = {
	player addAction["<t color='#aaaa00'>-- 라디오 열기-- </t><img size='2' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/>", "scripts\AdvancedRadio\ui_manage.sqf", [], -100, false, false, '','leader group player == player'];
};
Reconnect = {
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

if (isServer) then {
	[] execVM "scripts\AdvancedRadio\initChannel.sqf";
};

if (hasInterface && side player == GRLIB_side_friendly) then {
	0 enableChannel [true, false];
	1 enableChannel [true, false];

	[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\Ch_manage.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\atc_channel.sqf";
	call RadioAddAction;
	player addEventHandler ["Respawn",{call RadioAddAction;}];
	player addEventHandler ["Respawn",{call Reconnect;}];
};