private _blasted=_this;
if(isPlayer _blasted && (_blasted getVariable ["FAR_isUnconscious",0]) == 0) then{
_blasted setDamage 0.9;
[_blasted,true]remoteExec["setUnconscious",_blasted,true];
sleep 8;
[_blasted,false]remoteExec["setUnconscious",_blasted,true];};
