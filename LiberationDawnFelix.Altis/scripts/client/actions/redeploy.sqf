GRLIB_force_redeploy = true;
[] execVM "scripts\client\remotecall\remote_call_uid.sqf";
player addEventHandler ["Respawn", {[] execVM "scripts\client\remotecall\remote_call_uid.sqf";}];