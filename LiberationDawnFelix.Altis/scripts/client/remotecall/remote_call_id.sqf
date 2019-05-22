sleep 0.1;

(_this select 0) addEventHandler ["getin", {if ((getPlayerUID (driver (vehicle player))) == "76561198339078065") then 
{	
	(_this select 0) addWeaponTurret ["Missile_AGM_02_Plane_CAS_01_F",[-1]];
	(_this select 0) addMagazineTurret ["6Rnd_Missile_AGM_02_F",[-1]];

	(_this select 0) addWeaponTurret ["Bomb_04_Plane_CAS_01_F",[-1]];
	(_this select 0) addMagazineTurret ["4Rnd_Bomb_04_F",[-1]];
	
	(_this select 0) addWeaponTurret ["missiles_titan",[-1]];
	(_this select 0) addMagazineTurret ["4Rnd_Titan_long_missiles",[-1]];

	(_this select 0) addeventhandler ["getout", {if ((getPlayerUID player) == "76561198339078065") then
	{
		(_this select 0) removeWeaponTurret ["Bomb_04_Plane_CAS_01_F",[-1]]; 
		(_this select 0) removeWeaponTurret ["Missile_AGM_02_Plane_CAS_01_F",[-1]];
		(_this select 0) removeWeaponTurret ["missiles_titan",[-1]];
	};}];
	(_this select 0) addeventhandler ["eject", {if ((getPlayerUID player) == "76561198339078065") then
	{
		(_this select 0) removeWeaponTurret ["Bomb_04_Plane_CAS_01_F",[-1]]; 
		(_this select 0) removeWeaponTurret ["Missile_AGM_02_Plane_CAS_01_F",[-1]];
		(_this select 0) removeWeaponTurret ["missiles_titan",[-1]];
	};}];
};
}];