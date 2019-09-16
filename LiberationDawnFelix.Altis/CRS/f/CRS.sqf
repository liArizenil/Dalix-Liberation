//DISPOSABLE AT
if(CRS_DisposableAT)then{
player addEventHandler["Fired",{if(_this select 1 in["launch_NLAW_F","CUP_launch_NLAW","CUP_launch_M136","CUP_launch_RPG18"])then{[_this select 0]spawn CRS_AT;};}];};



//BACKBLAST
if(CRS_BackBlast)then{
player addEventHandler["Fired",{if(_this select 1 isKindOf["Launcher",configFile>>"CfgWeapons"])then{[player]call CRS_BB;};}];};//[_this select 0]



//FLASHBANG: TODO: Find better flashed animation?
if(CRS_FlashBang)then{
player addEventHandler["Fired",{if(_this select 5=="MiniGrenade")then{
_fbang=(_this select 6);
_fbangVelocity=velocity _fbang;
_fbangVectorDir=vectorDirVisual _fbang;
_fbangPos=getPosVisual _fbang;
deleteVehicle _fbang;
_newFbang=createVehicle["GrenadeHand_stone",_fbangPos,[],0,"can_collide"];
_newFbang setVectorDir _fbangVectorDir;
_newFbang setVelocity _fbangVelocity;
_newFbang remoteExec["CRS_FB",0];};}];};



//FRAGMENTATION GRENADE
if(CRS_Fragmentation)then{
CRS_NadeList=["HandGrenade","CUP_HandGrenade_RGO","CUP_HandGrenade_M67","CUP_HandGrenade_RGD5","CUP_HandGrenade_L109A1_HE","CUP_HandGrenade_L109A2_HE"];
player addEventHandler["Fired",{if(_this select 5 in CRS_NadeList)then{
_nade=(_this select 6);
[_nade]spawn{
private _nade=(_this select 0);
waitUntil{vectorMagnitude velocity _nade==0};
sleep 1;
private _nadePos=getPosATL _nade;
waitUntil{isNull _nade};
for"_i"from 0 to(floor(random 15)+15)step 1 do{
private _fragm=createVehicle["B_762x51_Ball",_nadePos,[],0,"can_collide"];
_fragm setVectorDirAndUp[[
random[-0.001,0,0.003],
random[-0.001,0,0.005],
random[0,0.0001,0.0002]], 

[random[0.001,0,0.005],
random[0.001,0,0.001],
random[0.001,0,0.001
]]];
_fragm setVelocity[
random[-50,0,50],
random[-50,0,50],
random[1,8,12]];
sleep 0.015;};};};
}];};



//GUN ANIMATIONS:
if(CRS_GunAnimations)then{
if(!isClass(configFile>>"CfgPatches">>"L_MOUNT"))then{
//MUZZLE
player addEventHandler["Take",{
_item=_this select 2;_isMuz=["muzzle",_item]call BIS_fnc_inString;
if(!_isMuz)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&(_item==(primaryWeaponItems player)select 0)&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 0==_item)then{if(!isNull findDisplay 602)then{closeDialog 602;};player playAction"GestureMountMuzzle";};};}];

player addEventHandler["Put",{
_item=_this select 2;_isMuz=["muzzle",_item]call BIS_fnc_inString;
if(!_isMuz)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&((primaryWeaponItems player)select 0=="")&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 0=="")then{if(!isNull findDisplay 602)then{closeDialog 602;};player playAction"GestureDismountMuzzle";};};}];

//SIDERAIL
player addEventHandler["Take",{
_item=_this select 2;_isSR=["acc_",_item]call BIS_fnc_inString;
if(!_isSR)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&(_item==(primaryWeaponItems player)select 1)&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 1==_item)then{if(!isNull findDisplay 602)then{closeDialog 602;};player playMove"mountSide";};};}];

player addEventHandler["Put",{
_item=_this select 2;_isSR=["acc_",_item]call BIS_fnc_inString;
if(!_isSR)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&((primaryWeaponItems player)select 1=="")&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 1=="")then{if(!isNull findDisplay 602)then{closeDialog 602;};player playMove"dismountSide";};};}];

//OPTIC
player addEventHandler["Take",{
_item=_this select 2;_isOpt=["optic",_item]call BIS_fnc_inString;
if(!_isOpt)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&(_item==(primaryWeaponItems player)select 2)&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 2==_item)then{if(!isNull findDisplay 602)then{closeDialog 602;};player playMove"mountOptic";};};}];

player addEventHandler["Put",{
_item=_this select 2;_isOpt=["optic",_item]call BIS_fnc_inString;
if(!_isOpt)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&((primaryWeaponItems player)select 2=="")&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 2=="")then{if(!isNull findDisplay 602)then{closeDialog 602;};player playMove"dismountOptic";};};}];

//BIPOD
player addEventHandler["Take",{
_item=_this select 2;_isBi=["bipod",_item]call BIS_fnc_inString;
if(!_isBi)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&(_item==(primaryWeaponItems player)select 3)&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 3==_item)then{if(!isNull findDisplay 602)then{closeDialog 602;};player playAction"GestureMountMuzzle";};};}];

player addEventHandler["Put",{
_item=_this select 2;_isBi=["bipod",_item]call BIS_fnc_inString;
if(!_isBi)exitWith{};
if((isNull objectParent player)&&(currentWeapon player!="")&&(primaryWeapon player!="")&&((primaryWeaponItems player)select 3=="")&&(stance player!="PRONE"))then{
if((primaryWeaponItems player)select 3=="")then{if(!isNull findDisplay 602)then{closeDialog 602;};player playAction"GestureDismountMuzzle";};};}];
};};



if(CRS_Holstering)then{
waitUntil{!(isNull(findDisplay 46))};
CRS_HolsterEH=(findDisplay 46)displayAddEventHandler["KeyDown","if(_this select 1==35)then{call CRS_Holster}"];};



if(CRS_STFUCarl)then{enableSentences false;player disableConversation true;player setVariable["BIS_noCoreConversations",true];player setSpeaker"NoVoice";};



//TACTICAL POINT
if(CRS_TacticalPoint)then{waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayAddEventHandler["KeyDown","if(inputAction""TacticalPing"">0)then{if(isNull objectParent player)then{player playAction""HandSignalPoint""};};"];};
//player playMove"AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown"; //SHOULDER TAP



if(CRS_WeaponJamming)then{
player addEventHandler["Fired",{
if(!isNull objectParent player)exitWith{};
if(round(random 200)==1)then{
_myMag=currentMagazine player;
player addMagazine _myMag;
player setAmmo[currentWeapon player,0];
playSound"dry";titleText["<t size='1.3' color='#ff0000' shadow='2'>Weapon Jammed</t>","PLAIN DOWN",1,true,true];titleFadeOut 4;
};}];
};




//FLASHLIGHT	TO DO: Add spam protection
//(findDisplay 46)displayAddEventHandler["KeyDown","if(inputAction""Headlights""==0.5)then{if((currentWeapon player==primaryWeapon player)&&{((primaryWeaponItems player)select 1)!=""""})then{playSound ""dry""};};"];
