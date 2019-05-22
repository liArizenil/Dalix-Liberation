class liberation_deploy_opfor {
	idd = 5502;
	movingEnable = false;
	controlsBackground[] = {};

	objects[] = {};

	class controls
	{
		class RespawnUIBackground: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(0,0,0,0.7)";
			x = -0.00531252 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.00547 * safezoneW;
			h = 1.012 * safezoneH;
		};
		class DeployMap: kndr_MapControl
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0.7,0.7,0.7,1)"; //--- ToDo: Localize;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.773438 * safezoneW;
			h = 0.825 * safezoneH;
		};
		class otherplayersList: RscListBoxI
		{
			idc = 1500;

			x = 0.814531 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.154 * safezoneH;
		};
		class QuickRespawnList: RscListBoxI
		{
			idc = 1501;

			x = 0.814531 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class btnDeploy: RscButton
		{
			idc = 1600;

			text = "Deploy"; //--- ToDo: Localize;
			action = "deploy = 1";
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class btnLoadout: RscButton
		{
			idc = 1601;

			text = "Loadout"; //--- ToDo: Localize;
			action = "loadout = 1";
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class readinessBackground: RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0,0,0,0.6)";
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class readinessLabel: RscTextI
		{
			idc = 1003;

			text = "0"; //--- ToDo: Localize;
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class PlayerLabelBackground: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(0,0,0,0.7)";
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SectorLabelBackground: RscPicture
		{
			idc = 1203;
			text = "#(argb,8,8,3)color(0,0,0,0.7)";
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class PlayerLabel: RscTextI
		{
			idc = 1004;
			text = "Player";
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SectorLabel: RscTextI
		{
			idc = 1005;
			text = "Sector";
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
