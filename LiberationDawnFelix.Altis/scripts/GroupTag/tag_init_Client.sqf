Group_Types = ["[보병]","[기계화]","[기갑]","[포병]","[CAS]","[공격헬기]","[수송]","[비전투]"];

fn_SyncGroupClient = {
	params ["_GroupName", "_GroupType"];
	[_GroupName,_GroupType,player,group player] remoteExecCall ["fn_SyncGroupServer",2];
};


addMissionEventHandler ["eachFrame" , {
	if (!isnil {uiNamespace getVariable "BIS_dynamicGroups_display"} && isNil "GroupTagDialog") then {
		GroupTagDialog = [] spawn {
			disableSerialization;
			private ["_display" , "_cntrlGroupEdit" , "_cntrlsquadDescription" , "_cntrlGroupList"];
			_display =  (uiNamespace getVariable "BIS_dynamicGroups_display");
			_cntrlGroupEdit = _display displayCtrl 9777;

			{_cntrlGroupEdit ctrlRemoveAllEventHandlers _x} forEach ["KeyDown" , "SetFocus" ,"KillFocus" ];
			_cntrlGroupEdit ctrlSetEventHandler ["MouseButtonClick" ," (uiNamespace getVariable 'BIS_dynamicGroups_display') closeDisplay 2; createDialog 'GroupTagger; "];

			waitUntil {uisleep (1/diag_fps); isnil {uiNamespace getVariable "BIS_dynamicGroups_display"}   };
			GroupTagDialog = nil;
			terminate _thisScript;
		};
	};
}];
