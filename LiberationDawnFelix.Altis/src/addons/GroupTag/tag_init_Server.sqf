fn_SyncGroupServer = {
	params ["_GroupName","_GroupPlayer",'_Group'];

	["RegisterGroup" , [_Group,_GroupPlayer , [ nil, _GroupName , false ] ]] call BIS_fnc_dynamicGroups;
};