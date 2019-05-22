//Vehicle Appearance Manager Cancel
selectcamo = -1;
selectcomp = -1;
while {true} do {
	if (selectcamo isEqualTo 0) then {
		if !(commandingMenu isEqualTo "#USER:_VAM_camo") then	{
			selectcamo = -1;
		};
	};
	if (selectcomp isEqualTo 0) then {
		if !(commandingMenu isEqualTo "#USER:_VAM_comp") then	{
			selectcomp = -1;
		};
	};
sleep 0.1;
};