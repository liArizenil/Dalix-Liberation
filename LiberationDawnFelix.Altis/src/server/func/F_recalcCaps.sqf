base_infantry_cap = 50 * CONST_RSC_MULTIPLIER;
base_fuel_cap = 20 * CONST_RSC_MULTIPLIER;

infantry_cap = base_infantry_cap;
fuel_cap = base_fuel_cap;

{
	if ( _x in SECTOR_CAPTURE ) then {
		infantry_cap = infantry_cap + (10 * CONST_RSC_MULTIPLIER);
	};
	if ( _x in SECTOR_FACTORY ) then {
		fuel_cap = fuel_cap + (20 * CONST_RSC_MULTIPLIER);
	};
} foreach SECTOR_BLUFOR;