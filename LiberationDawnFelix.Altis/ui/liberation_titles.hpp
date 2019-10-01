class CfgSounds
{
	sounds[] = {};
	class v44para
	{
		name = "parasound";
		sound[] = {"res\v44.ogg", 1.0, 1};
		titles[] = {};
	};
	class xianpara
	{
		name = "parasound";
		sound[] = {"res\xian.ogg", 1.0, 1};
		titles[] = {};
	};
};

class RscTitles
{
	class Rsc_GF_Earplugs {
		idd = -1; 
		duration = 1000000000;
		fadein = 0;
		fadeout = 0;
		class controls { 
			class Rsc_GF_Earplugs_Control { 
				idc = -1; 
				type = 0; 
				style = 48;
				tileH = 1;
				tileW = 1;
		
				//	Axis
				x = 0.93 * safezoneW + safezoneX;	//	horizontal
				y = 0.17  * safezoneH + safezoneY;	//	vertical
				
				//	Size
				w = 0.05 * safezoneW;	
				h = 0.05 * safezoneH;
		
				font = FontM; 
				sizeEx = 1; 
				colorBackground[] = {0,0,0,0}; 
				colorText[] = {1,1,1,1};
				
				//	Image
				text = "GF_Earplugs\images\Earmuffs_3.paa"; 
				lineSpacing = 0; 
			}; 
		}; 
	};
   class intro1
   {
      name = "intro1";
      duration = 4;
      idd = -1;
      movingEnable = false;
      controls[]=
      {
         GenericLabelShadow, GenericLabel2
      };
	  class GenericLabel2 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.035 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = "[GREUH] presents";
		shadow = 1;
	  };
	  class GenericLabelShadow : GenericLabel2{
		shadow = 2;
	  };
   };

   class intro2
   {
      name = "intro2";
      duration = 7;
      idd = -1;
      movingEnable = false;
      controls[]=
      {
         VersionLabelShadow, Splash, VersionLabel
      };
	  	class Splash {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_PICTURE;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.1 * safezoneH;
		x = 0.325 * safezoneW + safezoneX;
		w = 0.35 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.6 * safezoneH;
		text = "res\splash_libe_6_6.paa";
	  };
	  class VersionLabel {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		shadow = 1;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.035 * safezoneH;
		x = 0.45 * safezoneW + safezoneX;
		w = 0.3 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = $STR_MISSION_VERSION;
	  };
	  class VersionLabelShadow : VersionLabel {
		shadow = 2;
		font = FontM;
	  };
   };

   class blank
   {
      name = "blank";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "";
      controls[]={};
   };

   class fasttravel
   {
      name = "fasttravel";
      duration = 4;
      idd = -1;
      movingEnable = true;

      controls[]=
      {
         OuterBackground,GenericLabel111
      };
	  class OuterBackground {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_LEFT;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_BLACK;
		font = FontM;
		sizeEx = 0.023;
		x = -3; y = -3;
		w = 9;  h = 9;
		text = "";
	  };
		class GenericLabel111 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.03;
		x = 0; y = 0.75;
		w = 1.0;  h = 0.1;
		text = $STR_DEPLOY_IN_PROGRESS;
	  };
   };

   class statusoverlay
   {
      name = "statusoverlay";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "uiNamespace setVariable ['GUI_OVERLAY', _this select 0];";
      controls[]= { BGPicture,LabelManpower,LabelAmmo,LabelFuel,LabelCap,PictureManpowerShadow,PictureAmmoShadow, BGPictureActiveSectors,
	  PictureFuelShadow,PictureCapShadow,PictureManpower,PictureAmmo,PictureFuel,PictureCap,PictureCombatReadinessShadow,PictureCombatReadiness,
	  PictureIntelShadow, PictureIntel, LabelIntel,
	  BGPictureSector,CaptureFrame_OPFOR, CaptureFrame_BLUFOR, CaptureFrame, LabelPoint, LabelCombatReadiness, CentralShadow, CentralLabel, ActiveSectors,
	  AlertBGPicture, AlertLabel, AlertTimer };
	  class BGPicture {
	  	idc = -1;
		type =  CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.8,0.8,0.8,0.9};
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.5;
		x = 0.95 * safezoneW + safezoneX;
		w = 0.075 * safezoneW;
		y = 0.395 * safezoneH + safezoneY;
		h = 0.153 * safezoneH;
		text = "res\gradient.paa";
	  };
	  class BGPictureSector : BGPicture {
	  	idc = 201;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.33 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
	  };
	  class GenericLabel69 {
		idc = -1;
		type =  CT_STATIC;
		style = ST_RIGHT;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.022 * safezoneH;
		x = 0.905 * safezoneW + safezoneX;
		w = 0.08 * safezoneW;
		y = 0.5225 * safezoneH + safezoneY;
		h = 0.04 * safezoneH;
		text = "";
		shadow = 2;
	  };
	  class CentralLabel : GenericLabel69 {
		idc = 266;
		type = CT_STATIC;
		style = ST_CENTER;
		colorText[] = {1,1,0,1};
		sizeEx = 0.03 * safezoneH;
		x = 0 * safezoneW + safezoneX;
		w = 1 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
		text = "";
	  };
	  class CentralShadow : CentralLabel {
		idc = 267;
		shadow = 1;
	  };
	  class GenericPicture69 {
	  	idc = -1;
		type =  CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.9,0.9,0.9,1};
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.5;
		x = 0.985 * safezoneW + safezoneX;
		w = 0.012 * safezoneW;
		h = 0.0213333333 * safezoneH;
	  };
	 class PictureManpower : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		text = "res\ui_manpo.paa";
	  };
	  class PictureAmmo : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		text = "res\ui_ammo.paa";
	  };
	  class PictureFuel : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		text = "res\ui_fuel.paa";
	  };
	  class PictureCap : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
	  };
	  class PictureCombatReadiness : GenericPicture69 {
		idc = 135;
		y = (0.4 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		text = "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa";
	  };
	  class PictureIntel : GenericPicture69 {
	  	colorText[] = {0,0.45,0.95,1};
		y = (0.4 + ( ICONE_SPACY * 5 ) - 0.0025) * safezoneH + safezoneY;
		text = "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
	  };
	  class PictureManpowerShadow : PictureManpower {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureAmmoShadow : PictureAmmo {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureFuelShadow : PictureFuel {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureCapShadow : PictureCap {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureCombatReadinessShadow : PictureCombatReadiness {
	  	idc = -1;
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureIntelShadow : PictureIntel {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 5 ) - 0.0025 ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class LabelManpower : GenericLabel69 {
	  	idc = 101;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		colorText[] = {0, 0.75, 0, 1};
	  };
	 class LabelAmmo : GenericLabel69 {
	  	idc = 102;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0, 0, 1};
	  };
	  class LabelFuel : GenericLabel69 {
	  	idc = 103;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0.75, 0, 1};
	  };
	  	class LabelCap : GenericLabel69 {
	  	idc = 104;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class LabelCombatReadiness : GenericLabel69 {
	  	idc = 105;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class LabelIntel : GenericLabel69 {
	  	idc = 106;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 5 ) - 0.0015 ) * safezoneH + safezoneY;
		colorText[] = {0, 0.45, 0.95, 1};
	  };
	  class CaptureFrameStandard {
		type =  CT_STATIC;
		font = FontM;
		sizeEx = 0.023;
		text = "";
	};
	  class CaptureFrame : CaptureFrameStandard {
		idc = 202;
		style = ST_FRAME;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_OPFOR_NOALPHA;
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.085 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.012 * safezoneH;
	};
	class CaptureFrame_OPFOR : CaptureFrameStandard{
		idc = 203;
		style = ST_STATIC;
		colorText[] = {0.6, 0, 0, 1};
		colorBackground[] = {0.6, 0, 0, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;

	};
	class CaptureFrame_BLUFOR : CaptureFrameStandard{
		idc = 244;
		style = ST_STATIC;
		colorText[] = {0, 0.2, 0.6, 1};
		colorBackground[] = {0, 0.2, 0.6, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;
	};
	class LabelPoint : GenericLabel69 {
	  	idc = 205;
		text = "";
		style = ST_RIGHT;
		sizeEx = 0.024 * safezoneH;
		x = 0.8 * safezoneW + safezoneX;
		w = 0.2 * safezoneW;
		y = 0.33 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.7, 0, 0, 1};
	  };
	  class ActiveSectors
 		{
 			idc = 516;
 			type = CT_STRUCTURED_TEXT;
 			colorBackground[] = COLOR_NOALPHA;
 			style = ST_RIGHT;
			x = 0.7 * safezoneW + safezoneX;
			w = 0.295 * safezoneW;
			y = 0.8 * safezoneH + safezoneY;
			h = 0.2 * safezoneH;
 			text= "";
 			size = 0.02 * safezoneH;
 			sizeEx = 0.02 * safezoneH;
 			shadow = 2;
				font = FontM;
				color = "#e0e000";
				align = "right";
				valign = "top";
 		};
 	class BGPictureActiveSectors : BGPicture {
	  	idc = 517;
		x = 0.93 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.8 * safezoneH + safezoneY;
		h = 0.2 * safezoneH;
	  };


	  class AlertBGPicture : BGPicture {
	  	idc = 401;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.27 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
	  };

	  class AlertLabel : GenericLabel69 {
	  	idc = 402;
		text = "";
		style = ST_CENTER;
		sizeEx = 0.022 * safezoneH;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.2675 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.85, 0, 0, 1};
	  };
	  class AlertTimer : GenericLabel69 {
	  	idc = 403;
		text = "";
		style = ST_CENTER;
		sizeEx = 0.026 * safezoneH;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.29 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.85, 0, 0, 1};
	  };
	};
	class dojoingroup
	{
		name = "dojoingroup";
		duration = 10;
		idd = 5321;
		movingEnable = false;
		controlsBackground[] = {};

		objects[] = {};

		class controls
		{
			class Background: RscPicture
			{
				idc = 1200;
				text = "#(argb,8,8,3)color(1,0,0,1)";
				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
			class Text: RscText
			{
				idc = 1000;
				text = "PRESS [ U ] KEY TO JOIN GROUP"; //--- ToDo: Localize;

				font = FontM;

				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
		};
	};
	class dosetyourtag
	{
		name = "dosetyourtag";
		duration = 10;
		idd = 5321;
		movingEnable = false;
		controlsBackground[] = {};

		objects[] = {};

		class controls
		{
			class Background: RscPicture
			{
				idc = 1200;
				text = "#(argb,8,8,3)color(1,0,0,1)";
				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
			class Text: RscText
			{
				idc = 1000;
				text = "PLEASE SET YOUR GROUP TAG"; //--- ToDo: Localize;

				font = FontM;

				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
		};
	};
	class teamkillactivated
	{
		name = "teamkillactivated";
		duration = 10;
		idd = 5321;
		movingEnable = false;
		controlsBackground[] = {};

		objects[] = {};

		class controls
		{
			class Background: RscPicture
			{
				idc = 1200;
				text = "#(argb,8,8,3)color(1,0,0,1)";
				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
			class Text: RscText
			{
				idc = 1000;
				text = "TEAM KILL Damage Reflection Activated"; //--- ToDo: Localize;

				font = FontM;

				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
		};
	};
	class askteamkill
	{
		name = "askteamkill";
		duration = 15;
		idd = 5627;
		movingEnable = false;
		controlsBackground[] = {};

		objects[] = {};

		class controls
		{
			class Background: RscPicture
			{
				idc = 1200;
				text = "#(argb,8,8,3)color(0,0,0,0.8)";
				x = 0.840313 * safezoneW + safezoneX;
				y = 0.016 * safezoneH + safezoneY;
				w = 0.149531 * safezoneW;
				h = 0.077 * safezoneH;
			};
			class Title_Background: RscPicture
			{
				idc = 1201;
				text = "#(argb,8,8,3)color(0.3,0.3,0.3,0.9)";
				x = 0.840312 * safezoneW + safezoneX;
				y = 0.016 * safezoneH + safezoneY;
				w = 0.118601 * safezoneW;
				h = 0.0264 * safezoneH;
			};
			class Timer_Background: RscPicture
			{
				idc = 1202;
				text = "#(argb,8,8,3)color(0.15,0.15,0.15,1)";
				x = 0.958906 * safezoneW + safezoneX;
				y = 0.016 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.0264 * safezoneH;
			};
			class Title: RscText
			{
				idc = 1000;
				text = "Punish %1"; //--- ToDo: Localize;

				font = FontM;

				x = 0.840312 * safezoneW + safezoneX;
				y = 0.016 * safezoneH + safezoneY;
				w = 0.117558 * safezoneW;
				h = 0.0264 * safezoneH;
			};
			class Timer: RscText
			{
				idc = 1001;
				text = "%1 s"; //--- ToDo: Localize;

				font = FontM;

				x = 0.958906 * safezoneW + safezoneX;
				y = 0.016 * safezoneH + safezoneY;
				w = 0.0309377 * safezoneW;
				h = 0.0264 * safezoneH;
			};
			class label_OK: RscText
			{
				idc = 1002;
				text = "Agree"; //--- ToDo: Localize;

				font = FontM;

				x = 0.873312 * safezoneW + safezoneX;
				y = 0.0446 * safezoneH + safezoneY;
				w = 0.0319688 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class label_NO: RscText
			{
				idc = 1003;
				text = "DisAgree"; //--- ToDo: Localize;

				font = FontM;

				x = 0.939311 * safezoneW + safezoneX;
				y = 0.0446 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Key_OK: RscPicture
			{
				idc = 1203;
				text = "#(argb,8,8,3)color(0.9,0.9,0.9,0.8)";
				x = 0.845469 * safezoneW + safezoneX;
				y = 0.0512 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class Key_NO: RscPicture
			{
				idc = 1204;
				text = "#(argb,8,8,3)color(0.9,0.9,0.9,0.8)";
				x = 0.907354 * safezoneW + safezoneX;
				y = 0.0512 * safezoneH + safezoneY;
				w = 0.0268129 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class label_KEYOK: RscText
			{
				idc = 1004;
				text = "HOME"; //--- ToDo: Localize;

				font = FontM;

				x = 0.844438 * safezoneW + safezoneX;
				y = 0.0534 * safezoneH + safezoneY;
				w = 0.022688 * safezoneW;
				h = 0.0286 * safezoneH;
			};
			class label_KEYNO: RscText
			{
				idc = 1005;
				text = "END"; //--- ToDo: Localize;

				font = FontM;

				x = 0.909416 * safezoneW + safezoneX;
				y = 0.0534 * safezoneH + safezoneY;
				w = 0.0247505 * safezoneW;
				h = 0.0286 * safezoneH;
			};
		};
	};
};
