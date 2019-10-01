if ( side player == GRLIB_side_friendly ) then {
	if ( isNil "GRLIB_arsenal_weapons" ) then { GRLIB_arsenal_weapons = [] };
	if ( count GRLIB_arsenal_weapons == 0 ) then {
		[ missionNamespace, true, false ] call BIS_fnc_addVirtualWeaponCargo;
	} else {
		[ missionNamespace, GRLIB_arsenal_weapons ] call BIS_fnc_addVirtualWeaponCargo;
	};

	if ( isNil "GRLIB_arsenal_magazines" ) then { GRLIB_arsenal_magazines = [] };
	if ( count GRLIB_arsenal_magazines == 0 ) then {
		[ missionNamespace, true, false ] call BIS_fnc_addVirtualMagazineCargo;
	} else {
		[ missionNamespace, GRLIB_arsenal_magazines ] call BIS_fnc_addVirtualMagazineCargo;
	};
	
	if ( isNil "GRLIB_arsenal_items" ) then { GRLIB_arsenal_items = [] };
	if ( count GRLIB_arsenal_items == 0 ) then {
		[ missionNamespace, true, false ] call BIS_fnc_addVirtualItemCargo;
	} else {
	[ missionNamespace, GRLIB_arsenal_items, false ] call BIS_fnc_addVirtualItemCargo;
	};
	if ( isNil "GRLIB_arsenal_backpacks" ) then { GRLIB_arsenal_backpacks = [] };
	if ( count GRLIB_arsenal_backpacks == 0 ) then {
		private _virtualStuff = [] call LARs_fnc_addAllVirtualCargo;
		private _virtualBackpacks = [];
		{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualBackpacks pushback _x } } foreach (_virtualStuff);
	
		[ missionNamespace, _virtualBackpacks, false ] call BIS_fnc_addVirtualBackpackCargo;
	} else {
		[ missionNamespace, GRLIB_arsenal_backpacks, false ] call BIS_fnc_addVirtualBackpackCargo;
	};
};

if ( side player == GRLIB_side_enemy ) then {
	["AmmoboxInit", [opforammobox]] spawn BIS_fnc_arsenal;
    [opforammobox, OPFOR_Weapons, false, true ] call BIS_fnc_addVirtualWeaponCargo;
	[opforammobox, OPFOR_Mines, false, true ] call BIS_fnc_addVirtualMagazineCargo;
	[opforammobox, OPFOR_Backpacks, false, true ] call BIS_fnc_addVirtualBackpackCargo;
	[opforammobox, (OPFOR_Uniform + OPFOR_Vest + OPFOR_Helmet + OPFOR_Sight + OPFOR_Muzzles + OPFOR_Goggles + OPFOR_Items), false, true ] call BIS_fnc_addVirtualItemCargo;
	player addEventHandler ["InventoryOpened", { [] spawn { sleep 0.5; closeDialog 0; }; }];
};
