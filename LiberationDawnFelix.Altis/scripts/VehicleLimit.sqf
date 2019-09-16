while { true } do {
    waitUntil { alive player };

    waitUntil {
        sleep 0.2;
        !(call BIS_fnc_admin == 2) && (vehicle player != player) && ( (vehicle player) getCargoIndex player ) < 0  && isTouchingGround (vehicle player) && !((vehicle player) isKindOf "ParachuteBase" || (vehicle player) isKindOf "C_Heli_Light_01_civil_F" || (vehicle player) isKindOf "C_Plane_Civil_01_F" || (vehicle player) isKindOf "C_Plane_Civil_01_racing_F")
    };
    if (!((vehicle player) isKindOf "B_Heli_Light_01_F") && ((vehicle player ) isKindOf "Helicopter" || (vehicle player) isKindOf "B_T_VTOL_01_vehicle_F" || (vehicle player) isKindOf "B_T_VTOL_01_infantry_F")) then {
        if (!(((group player)getVariable['GroupType',(Group_Types select 0)]) in ["[수송]","[공격헬기]"])) then {
            if(driver (vehicle player) != player) then {
                (vehicle player) enableCopilot false;
            }
            else{
                (vehicle player) enableCopilot true;
                moveOut player;
                hint "수송,공격헬기 분대만 탑승 할 수 있습니다.";
            };
        };
    };
    if (((vehicle player) isKindOf "Plane" && !((vehicle player) isKindOf "B_T_VTOL_01_vehicle_F" || (vehicle player) isKindOf "B_T_VTOL_01_infantry_F"))) then {
        if(((group player)getVariable['GroupType',(Group_Types select 0)]) != "[CAS]") then {
            if(driver (vehicle player) == player) then {
                moveOut player;
                hint "CAS 분대만 탑승 할 수 있습니다.";
            };
        };
    };
};
