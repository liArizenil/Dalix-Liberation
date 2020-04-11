params["_tick"];
private["_timer"];
_timer =  (_tick + (random _tick)) / (([] call  F_adaptiveOpforFactor) * CONST_CSAT_AGGRESSIVITY);
if(combat_readiness >= 80) then { _timer = _timer * 0.75 };
if(combat_readiness >= 90) then { _timer = _timer * 0.75 };
if(combat_readiness >= 95) then { _timer = _timer * 0.75 };
if(combat_readiness >= 100) then { _timer = _timer * 0.75 };
_timer