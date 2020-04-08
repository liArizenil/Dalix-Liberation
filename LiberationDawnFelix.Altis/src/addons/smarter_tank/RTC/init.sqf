//if (!isServer) exitWith {};
[] spawn {
  while {true} do {
    {
      _veh = vehicle _x;
      _veh allowCrewInImmobile true;
      if !(_veh getVariable ["willBeRepaired",false]) then {
        mgi_h =_veh addEventHandler ["hit",{
          _veh = _this select 0;
          _d = driver _veh;
          _c = commander _veh;
          _g = gunner _veh;
          _c setUnitTrait ["engineer",true];
          _d setUnitTrait ["engineer",true];
          _g setUnitTrait ["engineer",true];
          if (!canMove _veh) then {
            if (_d != _veh && alive _d && !(_veh iskindof "plane")) then {
              _d setCombatMode "AWARE";
              [_veh,_d] spawn {
                params ["_veh","_d"];
                _veh removeEventHandler ["hit",mgi_h];
                _veh setVariable ["willBeRepaired",false];
                sleep 7;
                waitUntil {(_d findNearestEnemy _d) distance _d > 250};
                doGetOut _d;
                waitUntil {!(_d in _veh)};
                sleep 1;
                _d setVectorDir (getpos _d vectorFromTo getpos _veh);
                _d playMoveNow "Acts_carFixingWheel";
                sleep 15;
                _d switchMove "";
				if (alive _d) then {
					_veh setHitPointDamage ["HitEngine", ((_veh getHitPointDamage "HitEngine") - 0.3)];
					if (_veh iskindof "Tank") then {
						_veh setHitPointDamage ["HitLTrack", ((_veh getHitPointDamage "HitLTrack") - 0.4)];
						_veh setHitPointDamage ["HitRTrack", ((_veh getHitPointDamage "HitRTrack") - 0.4)];}
					else {
						_veh setHitPointDamage ["HitLFWheel", 0];
						_veh setHitPointDamage ["HitLF2Wheel", 0];
						_veh setHitPointDamage ["HitLMWheel", 0];
						_veh setHitPointDamage ["HitLBWheel", 0];
						_veh setHitPointDamage ["HitRFWheel", 0];
						_veh setHitPointDamage ["HitRF2Wheel", 0];
						_veh setHitPointDamage ["HitRMWheel", 0];
						_veh setHitPointDamage ["HitRBWheel", 0];}
                };
             };
          };
        };
        }];
        _veh setVariable ["willBeRepaired",true];
      };
    } foreach allUnits;
    sleep 5;
  };
}


