waitUntil{ !isNil "resources_intel" };


private _infantry_cap_old = -999;
private _fuel_cap_old = -999;
private _resources_infantry_old = -999;
private _resources_ammo_old = -999;
private _resources_fuel_old = -999;
private _resources_intel_old = -999;
private _unitcap_old = -1;
private _combat_readiness_old = -1;


while { true } do {

	waitUntil { sleep 0.25;
		_resources_infantry_old != resources_infantry
		|| _resources_ammo_old != resources_ammo
		|| _resources_fuel_old != resources_fuel
		|| _infantry_cap_old != infantry_cap
		|| _fuel_cap_old != fuel_cap
		|| _unitcap_old != unitcap
		|| _combat_readiness_old != combat_readiness
		|| _resources_intel_old != resources_intel
	};
	sleep 0.25;
	_sync_vars = [resources_infantry, resources_ammo, resources_fuel,infantry_cap,fuel_cap, unitcap, combat_readiness, resources_intel];
	_sync_vars remoteExec ["F_syncVars",-2, "syncVars"];

	_infantry_cap_old = infantry_cap;
	_fuel_cap_old = fuel_cap;
	_resources_infantry_old = resources_infantry;
	_resources_ammo_old = resources_ammo;
	_resources_fuel_old = resources_fuel;
	_unitcap_old = unitcap;
	_combat_readiness_old = combat_readiness;
	_resources_intel_old = resources_intel;
};