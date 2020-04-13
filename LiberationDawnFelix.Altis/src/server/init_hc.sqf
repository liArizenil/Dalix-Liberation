call compileFinal preprocessFileLineNumbers "src\shared\init\init_shared.sqf";
call compileFinal preprocessFileLineNumbers "src\server\init\init_func.sqf";

[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_cleaner.sqf";
[] spawn compileFinal preprocessFileLineNumbers "src\server\loop\loop_show_fps.sqf";