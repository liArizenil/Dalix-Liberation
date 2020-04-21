private _dir = "src\server\submission\%1.sqf";

Sector_sides = [];
//SECTOR
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_hostage"]);
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_database"]);
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_destroyveh"]);
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_kill_hvt"]);
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_secure_hvt"]);
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_secure_inf"]);
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_warpig"]);
Sector_sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sec_discharge_ied"]);

//SIDE
Secondary_Sides = [];
Secondary_Sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sid_hostage"]);
Secondary_Sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sid_destroyveh"]);
Secondary_Sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sid_kill_hvt"]);
Secondary_Sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sid_database"]);
Secondary_Sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sid_secure_inf"]);
Secondary_Sides pushBack (compileFinal preprocessFileLineNumbers format[_dir,"sid_fob_hunt"]);