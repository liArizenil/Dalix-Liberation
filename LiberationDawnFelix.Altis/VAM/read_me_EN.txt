Vehicle Appearance Manager (Communication menu version) by UNIT_normal
This allows you to change camouflage and component via communication menu.
VAM currently supports NATO, CSAT, AAF land and air vehicles. (except Quad Bike.)

Known issue
- Error on Prowler and Quilin but it just works. (Problem is BIS_fnc_getVehicleCustomization, not VAM.) After 1.86 and adjusting code, this error isn't occured now.
- Some components are linked each other. It's not VAM's limitation.
- Some components aren't compatible each other. It's not VAM's limitation.

Installation
1. Put VAM folder on your mission folder.
2. Put stringtable.xml or copy & paste contents to your stringtable.xml.
3. Add this to init.sqf.
[] execVM "VAM\vam_init.sqf";
4. Add this to description.ext.
#include "VAM\VAM_comm_menu.hpp"

Option
- In vam_init.sqf, you can enable Liberation FOB distance check system.

Changelog
1.0
Released
1.1
Memory leak fixed, Now support Stringtable.xml, Menu will be reopened after applying option.
1.2
"Close menu" added. Cheetah error fixed
1.3
Communication menu is now include by #include. Typo fixed
1.4
Typo fixed
1.5
Aircraft added, reallocate directory, Problem with Marid has been fixed, Component issue with Prowler and Quilin has been fixed
1.55
AAF camouflage has been added to Hummingbird, Pawnee, Orca

Special Thanks
DCinside ARMA minor Gallery for testing
DALIX server