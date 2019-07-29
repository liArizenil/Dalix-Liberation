disableSerialization;
VAM_condition_result = true;

while {true} do {
	{
		if !(_x getVariable ["VAM_isSetup", false]) then {
			_x setVariable ["VAM_isSetup", true];
			_x addAction 
			[
			//Action title
				"VAM",
			//Code
				{0 = createDialog "VAM_GUI"; VAM_targetvehicle = _this select 0;},
				[], 0, true, true, "", //Misc values
			//Action condition
				"VAM_condition_result && (((_this isEqualTo vehicle _this) && (isNull driver _target)) || (_this isEqualTo driver _target))",
				10
			];
		};
	} forEach vehicles;
	uisleep 1;
};