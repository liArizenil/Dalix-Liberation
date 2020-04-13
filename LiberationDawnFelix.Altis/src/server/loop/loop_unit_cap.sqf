unitcap = 0;

while { true } do {
	unitcap = {(side group _x == CONST_SIDE_BLUFOR) && (alive _x) && ((_x distance lhd) > 250 || (isPlayer _x))} count allUnits;
	sleep 5;
};