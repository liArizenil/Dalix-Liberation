fn_SyncGroupServer = {
	params ["_GroupName","_GroupType","_GroupPlayer",'_Group'];

	["RegisterGroup" , [_Group,_GroupPlayer , [ nil, format ["%1 %2",_GroupType , _GroupName ], false ] ]] call BIS_fnc_dynamicGroups;
};