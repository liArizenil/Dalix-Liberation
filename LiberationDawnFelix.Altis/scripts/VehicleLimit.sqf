﻿while { true } do {
    waitUntil { alive player };

    waitUntil {
        sleep 0.2;
        !(call BIS_fnc_admin == 2) && (vehicle player != player) && ( (vehicle player) getCargoIndex player ) < 0  && isTouchingGround (vehicle player) && !((vehicle player) isKindOf "ParachuteBase" || (vehicle player) isKindOf "C_Heli_Light_01_civil_F" || (vehicle player) isKindOf "C_Plane_Civil_01_F" || (vehicle player) isKindOf "C_Plane_Civil_01_racing_F")
    };
    if (((vehicle player ) isKindOf "Helicopter" || (vehicle player) isKindOf "B_T_VTOL_01_vehicle_F" || (vehicle player) isKindOf "B_T_VTOL_01_infantry_F")) then {
        if (!(player isKindOf "B_Helipilot_F")) then {
            if(driver (vehicle player) != player) then {
                (vehicle player) enableCopilot false;
            }
            else{
                (vehicle player) enableCopilot true;
                moveOut player;
                hint "헬리콥터 조종사만 탑승 할 수 있습니다.";
            };
        };
    };
    if (((vehicle player) isKindOf "Plane" && !((vehicle player) isKindOf "B_T_VTOL_01_vehicle_F" || (vehicle player) isKindOf "B_T_VTOL_01_infantry_F"))) then {
        if(!(player isKindOf "B_Fighter_Pilot_F")) then {
            if(driver (vehicle player) == player) then {
                moveOut player;
                hint "전투기 조종사만 탑승 할 수 있습니다.";
            };
        };
    };
};