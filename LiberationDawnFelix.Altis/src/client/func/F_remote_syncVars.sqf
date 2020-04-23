params["_sync_vars"];

resources_infantry = _sync_vars select 0;
resources_ammo = _sync_vars select 1;
resources_fuel = _sync_vars select 2;
infantry_cap = _sync_vars select 3;
fuel_cap = _sync_vars select 4;
unitcap = _sync_vars select 5;
combat_readiness = _sync_vars select 6;
resources_intel = _sync_vars select 7;

terminate _thisScript;