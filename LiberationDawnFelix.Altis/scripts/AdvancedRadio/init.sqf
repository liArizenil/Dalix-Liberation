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
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		systemChat format["%1 %2",_this select 1, _this select 3];
		if((_this select 1) == 0x19 && (_this select 3)) then { //press ctrl + p
			if(!isnull(findDisplay 5568)) then {
				(findDisplay 5568) closeDisplay 0;
			}else{
				[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\ui_manage.sqf";
			}
		};
	}];
	[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\Ch_manage.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\AdvancedRadio\atc_channel.sqf";
	call RadioAddAction;
	player addEventHandler ["Respawn",{call RadioAddAction;}];
	player addEventHandler ["Respawn",{call Reconnect;}];
};