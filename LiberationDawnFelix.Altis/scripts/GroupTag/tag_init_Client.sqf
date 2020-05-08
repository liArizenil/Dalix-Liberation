fn_SyncGroupClient = {
	params ["_GroupName", "_GroupType"];
	_GroupName = format ["%1 %2",_GroupType , _GroupName ];
	if(({groupId _x == _GroupName} count (["GetAllGroupsOfSide",[GRLIB_side_friendly]] call BIS_fnc_dynamicGroups)) > 0) exitWith { hint "이미 존재하는 그룹명 입니다."; };
	if(_GroupType in ["[포병]","[CAS]","[공격헬기]","[수송]"] && ({ _GroupType == (_x getVariable['GroupType',(Group_Types select 0)]) && _x != (group player) } count (["GetAllGroupsOfSide",[GRLIB_side_friendly]] call BIS_fnc_dynamicGroups)) > 0) exitWith { hint "동일한 종류의 지원분대는 2개 이상 창설 할 수 없습니다."; };
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
