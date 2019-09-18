#include"CFG.sqf";

CRS_BB=compileFinal preprocessFile"CRS\f\BB.sqf";
CRS_BBlasted=compileFinal preprocessFile"CRS\f\BBlasted.sqf";

sleep 6;
execVM"CRS\f\CRS.sqf"
