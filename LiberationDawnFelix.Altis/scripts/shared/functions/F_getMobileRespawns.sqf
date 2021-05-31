private [ "_respawn_trucks_unsorted" ];


_respawn_trucks_unsorted = vehicles select { ( typeof _x in [Respawn_truck_typename, huron_typename] ) && _x distance lhd > 500 && !surfaceIsWater (getpos _x) && ((getpos _x) select 2) < 5 && alive _x && speed _x < 5 };
_respawn_trucks_unsorted