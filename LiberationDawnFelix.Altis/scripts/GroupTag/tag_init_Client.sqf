fn_SyncGroupClient = {
	params ["_GroupName", "_GroupType"];
	if({side _x == GRLIB_side_friendly && groupId _x == _GroupName} count allGroups > 0) exitWith { hint "이미 존재하는 그룹명 입니다."; };
	_GroupName = format ["%1 %2",_GroupType , _GroupName ];
	(group player) setVariable ['GroupType',_GroupType,true];
	[_GroupName,player,group player] remoteExecCall ["fn_SyncGroupServer",2];
};


addMissionEventHandler ["eachFrame" , {
	if (!isnil {uiNamespace getVariable "BIS_dynamicGroups_display"} && isNil "GroupTagDialog") then {
		GroupTagDialog = [] spawn {
			disableSerialization;
			private ["_display" , "_cntrlGroupEdit" , "_cntrlsquadDescription" , "_cntrlGroupList"];
			_display =  (uiNamespace getVariable "BIS_dynamicGroups_display");
			_cntrlGroupEdit = _display displayCtrl 9777;

			{_cntrlGroupEdit ctrlRemoveAllEventHandlers _x} forEach ["KeyDown" , "SetFocus" ,"KillFocus" ];
			_cntrlGroupEdit ctrlSetEventHandler ["MouseButtonClick" ," (uiNamespace getVariable 'BIS_dynamicGroups_display') closeDisplay 2; createDialog 'liberation_GroupManager'; "];

			waitUntil {uisleep (1/diag_fps); isnil {uiNamespace getVariable "BIS_dynamicGroups_display"}   };
			GroupTagDialog = nil;
			terminate _thisScript;
		};
	};
}];
