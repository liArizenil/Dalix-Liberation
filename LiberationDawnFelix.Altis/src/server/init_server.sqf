call compileFinal preprocessFileLineNumbers "src\server\init\init_func.sqf";
call compileFinal preprocessFileLineNumbers "src\server\init\init_sidemissions.sqf";
call compileFinal preprocessFileLineNumbers "src\server\init\init_radioTowers.sqf";
call compileFinal preprocessFileLineNumbers "src\server\init\init_loadgame.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\init\init_startgame.sqf";

[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_airspawn.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_ammo.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_battlegroup.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_capture_vehicles.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_cleaner.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_game.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_patrol.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_sector.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_show_fps.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_sync_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_unit_cap.sqf";