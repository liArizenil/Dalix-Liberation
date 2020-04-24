load_loadout = 0;
edit_loadout = 0;
load_from_player = -1;
exit_on_load = 0;
respawn_loadout = 0;
createDialog "ui_arsenal";

private _saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
private _loadouts_data = [];
if ( !isNil "_saved_loadouts" ) then {
	{
		if ( _forEachIndex % 2 == 0 ) then { _loadouts_data pushback _x; };
	} foreach _saved_loadouts;
};

_saved_loadouts = nil;

waitUntil { dialog };

if ( count _loadouts_data > 0 ) then {
	{ lbAdd [201, _x]; } foreach _loadouts_data ;
	ctrlEnable [ 202, true ];
	lbSetCurSel [ 201, 0 ];
} else {
	ctrlEnable [ 202, false ];
};

private _loadplayers = [];
{
	if ( !(name _x in [ "HC1", "HC2", "HC3" ]) )  then {
		_loadplayers pushback _x;
		_namestr = "";
		if(count (squadParams _x) != 0) then {
			_namestr = "[" + ((squadParams _x select 0) select 0) + "] ";
		};
		_namestr = _namestr + name _x;
		lbAdd [ 203, _namestr ];
		lbSetCurSel [ 203, 0 ];
	};
} foreach ( allPlayers - [ player ] );

if ( count _loadplayers < 1 ) then {
	ctrlEnable [ 203, false ];
	ctrlEnable [ 204, false ];
};

((findDisplay 5251) displayCtrl 201) ctrlAddEventHandler [ "mouseButtonDblClick" , { exit_on_load = 1; load_loadout = 1; } ];

while { dialog && (alive player) && edit_loadout == 0 } do {
	if ( load_loadout > 0 ) then {
		private _loaded_loadout = _loadouts_data select (lbCurSel 201);
		[player, [profileNamespace, _loaded_loadout]] call bis_fnc_loadInventory;
		[ player ] call F_correctLaserBatteries;
		hint format [ localize "STR_HINT_LOADOUT_LOADED", _loaded_loadout];
		if(backpack player in bannedbackpack) then {
			removeBackpack player;
		};
		if ( exit_on_load == 1 ) then {
			closeDialog 0;
		};
		load_loadout = 0;
	};

	if ( load_from_player >= 0 ) then {
		_playerselected = _loadplayers select load_from_player;
		if ( alive _playerselected ) then {
			[ player,  [ _playerselected, ["repetitive"] ] call F_getLoadout ] call F_setLoadout;
			if(backpack player in ARIZN_arsenal_blacklist) then { removeBackpack player; };
			hint format [ localize "STR_LOAD_PLAYER_LOADOUT_HINT", name _playerselected ];
		};
		load_from_player = -1;
	};
	if( respawn_loadout > 0 ) then {
		ARIZN_respawn_loadout = [ player, ["repetitive"] ] call F_getLoadout;
		hint localize "STR_MAKE_RESPAWN_LOADOUT_HINT";
	};
	sleep 0.1;
};

if(edit_loadout > 0) exitWith{
	closeDialog 0;
	waitUntil { !dialog };
	[ "Open", false ] spawn BIS_fnc_arsenal;
};