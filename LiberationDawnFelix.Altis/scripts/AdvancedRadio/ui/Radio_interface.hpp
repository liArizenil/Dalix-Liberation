// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUT_BUTTON  16 // Arma 2 - textured button

#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_List_N_Box       102 // Arma 2 - N columns list box


// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define CT_MAP_MAIN 101
#define ST_PICTURE 48

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define FontM             "puristaMedium"

#define COLOR_BROWN { 0.18, 0.14, 0.11, 0.75 }
#define COLOR_GREEN { 0.2, 0.23, 0.18, 0.75 }
#define COLOR_LIGHTGREEN { 0.4, 0.55, 0.36, 0.4 }
#define COLOR_LIGHTGRAY { 0.6, 0.6, 0.6, 0.8 }
#define COLOR_WHITE { 1, 1, 1, 1 }
#define COLOR_NOALPHA { 0, 0, 0, 0 }
#define COLOR_BLUFOR { 0, 0.3, 1, 1 }
#define COLOR_OPFOR { 1, 0, 0, 1 }
#define COLOR_GUER { 0.5, 0.5, 0.5, 0.5 }
#define COLOR_WHITE_TRANSP { 1, 1, 1, 0.5 }
#define COLOR_BLACK { 0, 0, 0, 1 }
#define COLOR_BLACK_ALPHA { 0, 0, 0, 0.85 }
#define COLOR_BLUFOR_NOALPHA { 0, 0, 1, 1 }
#define COLOR_OPFOR_NOALPHA { 1, 0, 0, 1 }
#define COLOR_RED_DISABLED { 1,0,0,0.4 }
#define COLOR_BLEEDOUT { 0.66,0,0,0.8 }
#define COLOR_BRIGHTGREEN { 0.2,1,0.2,1 }

#define BORDERSIZE      0.01

#define BASE_Y 			0.075

class Radio_Menu {
	idd = 5568;
	movingEnable = false;
	objects[] = {};
	controlsBackground[] = {};
	controls[] = {"BgPicture",
					"Radio_OuterBG",
					"Radio_OuterBG_F",
					"Radio_InnerBG",
					"Radio_InnerBG_F",
					"Radio_Listview",
					"Radio_Header",
					"Radio_Close",
					"Radio_RadioHead",
					"Radio_LabelInfantry1",
					"Radio_LabelInfantry2",
					"Radio_LabelArmor",
					"Radio_LabelCASAH",
					"Radio_LabelMortor",
					"Radio_LabelTrans",
					"Radio_Infantry1Main",
					"Radio_Infantry1Sub",
					"Radio_Infantry1list",
					"Radio_Infantry2Main",
					"Radio_Infantry2Sub",
					"Radio_Infantry2list",
					"Radio_ArmorMain",
					"Radio_ArmorSub",
					"Radio_Armorlist",
					"Radio_CASAHMain",
					"Radio_CASAHSub",
					"Radio_CASAHlist",
					"Radio_MortorMain",
					"Radio_MortorSub",
					"Radio_Mortorlist",
					"Radio_TransMain",
					"Radio_TransSub",
					"Radio_Translist",
					"Radio_Infantry1Mainlabel",
		      			"Radio_Infantry2Mainlabel",
					"Radio_ArmorMainlabel",
					"Radio_CASAHMainlabel",
					"Radio_MortorMainlabel",
					"Radio_TransMainlabel",
					"Radio_Infantry1Sublabel",
		      			"Radio_Infantry2Sublabel",
					"Radio_ArmorSublabel",
					"Radio_CASAHSublabel",
					"Radio_MortorSublabel",
					"Radio_TransSublabel",
	};

	class Radio_StdText {
		idc = -1;
		type =  CT_STATIC;
		style = ST_LEFT;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.02 * safezoneH;
		shadow = 2;
	};
	class Radio_StdHeader : Radio_StdText {
		style = ST_CENTER;
		sizeEx = 0.03 * safezoneH;
	};
	class Radio_Label : Radio_StdHeader {
		x = 0.15 * safezoneW + safezoneX;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.02 * safezoneH;
		colorBackground[] = COLOR_LIGHTGREEN;
	};
	class Radio_RegularLabel : Radio_Label {
		colorBackground[] = COLOR_NOALPHA;
		style = ST_LEFT;
	};
	class Radio_ButtonGeneric {
		idc = -1;
		type = CT_BUTTON;
		style = ST_CENTER;
		default = false;
		font = FontM;
		sizeEx = 0.018 * safezoneH;
		colorText[] = { 0, 0, 0, 1 };
		colorFocused[] = { 1, 1, 1, 1 };
		colorDisabled[] = { 0.2, 0.2, 0.2, 0.7 };
		colorBackground[] = { 0.8, 0.8, 0.8, 0.8 };
		colorBackgroundDisabled[] = { 0.5, 0.5, 0.5, 0.5 };
		colorBackgroundActive[] = { 1, 1, 1, 1 };
		offsetX = 0.003;
		offsetY = 0.003;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		colorShadow[] = { 0, 0, 0, 0.5 };
		colorBorder[] = { 0, 0, 0, 1 };
		borderSize = 0;
		soundEnter[] = { "", 0, 1 };          // no sound
		soundPush[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.891251, 1};
		soundClick[] = { "", 0, 1 };          // no sound
		soundEscape[] = { "", 0, 1 };          // no sound
		x = 0.15 * safezoneW + safezoneX;
		w = 0.2 * safezoneW; h = 0.03 * safezoneH;
		text = "";
		action = "";
		shadow = 1;
	};
	class BgPicture {
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.5, 0.4, 0.25, 0.6};
		colorBackground[] = {0, 0, 0, 1};
		font = FontM;
		sizeEx = 0.023;
		moving = false;
		text = "";
		x = (0.15 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = ((BASE_Y + 0.02) * safezoneH) + safezoneY - (3 * BORDERSIZE);
		w = (0.2 * safezoneW) + (4 * BORDERSIZE);
		h = (0.3 * safezoneH) + (4 * BORDERSIZE);
	};
	class Radio_OuterBG {
		idc = -1;
		type =  CT_STATIC;
		style = ST_SINGLE;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_BROWN;
		font = FontM;
		sizeEx = 0.023;
		x = (0.15 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = ((BASE_Y + 0.02) * safezoneH) + safezoneY - (3 * BORDERSIZE);
		w = (0.2 * safezoneW) + (4 * BORDERSIZE);
		h = (0.3 * safezoneH) + (6 * BORDERSIZE);
		text = "";
	};
	class Radio_Listview : Radio_OuterBG {
		idc = 561;
		type = CT_STRUCTURED_TEXT;
		style = ST_MULTI;
		lineSpacing = 1;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_BLACK_ALPHA;
		font = FontM;
		sizeEx = 0.025 * safezoneH;
		size = 0.023 * safezoneH;

		x = (0.35 * safezoneW + safezoneX);
		y = 0.192 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.3 * safezoneH;

		text = "";
	};
	class Radio_OuterBG_F: Radio_OuterBG
	{
		style = ST_FRAME;
	};
	class Radio_InnerBG: Radio_OuterBG
	{
		colorBackground[] = COLOR_GREEN;
		x = (0.15 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = ((BASE_Y + 0.07) * safezoneH) + safezoneY - (1.5 * BORDERSIZE);
		w = 0.2 * safezoneW +  (2 * BORDERSIZE);
		h = 0.25 * safezoneH  + (3 * BORDERSIZE);
	};
	class Radio_InnerBG_F: Radio_InnerBG
	{
		style = ST_FRAME;
	};
	class Radio_Header: Radio_StdHeader
	{
		idc = 1005;
		text = "무전망"; //--- ToDo: Localize;
		x = 0.15 * safezoneW + safezoneX - (BORDERSIZE);
		y = ((BASE_Y + 0.01) * safezoneH) + safezoneY;
		w = 0.2 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		colorBackground[] = {0.6,0.6,0.6,0.8};
	};
	class Radio_Close: Radio_ButtonGeneric
	{
		idc = 6677;
		action = "closeDialog 0";
		text = "X"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		w = 0.015 * safezoneW;  h = 0.02 * safezoneH;
		y = ((BASE_Y + 0.015) * safezoneH) + safezoneY;
	};
	class Radio_RadioHead: Radio_Label
	{
		idc = 510;
		text = "무전망 설정"; //--- ToDo: Localize;
		y = ((BASE_Y + 0.07) * safezoneH) + safezoneY;
		colorBackground[] = {0.4,0.55,0.36,0.4};
	};
	class Radio_LabelInfantry1: Radio_RegularLabel
	{
		idc = 601;
		text = "보병 1 무전망"; //--- ToDo: Localize;
		x = 0.149375 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
		colorText[] = {0.9,0.2,0.06,1};
	};
	class Radio_LabelInfantry2: Radio_RegularLabel
	{
		idc = 602;
		text = "보병 2 무전망"; //--- ToDo: Localize;
		x = 0.149375 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
		colorText[] = {0.84,0.14,0,1};
	};
	class Radio_LabelArmor: Radio_RegularLabel
	{
		idc = 603;

		text = "기갑 무전망"; //--- ToDo: Localize;
		x = 0.149375 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0,0.9,0.7,1};
	};
	class Radio_LabelCASAH: Radio_RegularLabel
	{
		idc = 604;

		text = "CAS/공헬 무전망"; //--- ToDo: Localize;
		x = 0.149375 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
		colorText[] = {0.2,0.28,1,1};
	};
	class Radio_LabelMortor: Radio_RegularLabel
	{
		idc = 605;

		text = "포병 무전망"; //--- ToDo: Localize;
		x = 0.149375 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
		colorText[] = {0.56,0.56,0.56,1};
	};
	class Radio_LabelTrans: Radio_RegularLabel
	{
		idc = 606;

		text = "수송 무전망"; //--- ToDo: Localize;
		x = 0.149375 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
		colorText[] = {0.98,0.06,0.87,1};
	};
	class Radio_Infantry1Main: Radio_ButtonGeneric
	{
		idc = 700;
		action = "curMain = 1";

		text = "메인"; //--- ToDo: Localize;
		x = 0.283437 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Infantry1Sub: Radio_ButtonGeneric
	{
		idc = 710;
		action = "curSub = 1";

		text = "보조"; //--- ToDo: Localize;
		x = 0.309219 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Infantry1list: Radio_ButtonGeneric
	{
		idc = 710;
		action = "listview = 1";

		text = ">>"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Infantry2Main: Radio_ButtonGeneric
	{
		idc = 701;
		action = "curMain = 2";

		text = "메인"; //--- ToDo: Localize;
		x = 0.283437 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Infantry2Sub: Radio_ButtonGeneric
	{
		idc = 711;
		action = "curSub = 2";

		text = "보조"; //--- ToDo: Localize;
		x = 0.309219 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Infantry2list: Radio_ButtonGeneric
	{
		idc = 902;
		action = "listview = 2";

		text = ">>"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_ArmorMain: Radio_ButtonGeneric
	{
		idc = 702;
		action = "curMain = 3";

		text = "메인"; //--- ToDo: Localize;
		x = 0.283437 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_ArmorSub: Radio_ButtonGeneric
	{
		idc = 712;
		action = "curSub = 3";

		text = "보조"; //--- ToDo: Localize;
		x = 0.309219 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Armorlist: Radio_ButtonGeneric
	{
		idc = 903;
		action = "listview = 3";

		text = ">>"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_CASAHMain: Radio_ButtonGeneric
	{
		idc = 703;
		action = "curMain = 4";

		text = "메인"; //--- ToDo: Localize;
		x = 0.283437 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_CASAHSub: Radio_ButtonGeneric
	{
		idc = 713;
		action = "curSub = 4";

		text = "보조"; //--- ToDo: Localize;
		x = 0.309219 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_CASAHlist: Radio_ButtonGeneric
	{
		idc = 904;
		action = "listview = 4";

		text = ">>"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_MortorMain: Radio_ButtonGeneric
	{
		idc = 704;
		action = "curMain = 5";

		text = "메인"; //--- ToDo: Localize;
		x = 0.283437 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_MortorSub: Radio_ButtonGeneric
	{
		idc = 714;
		action = "curSub = 5";

		text = "보조"; //--- ToDo: Localize;
		x = 0.309219 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Mortorlist: Radio_ButtonGeneric
	{
		idc = 710;
		action = "listview = 5";

		text = ">>"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_TransMain: Radio_ButtonGeneric
	{
		idc = 705;
		action = "curMain = 6";

		text = "메인"; //--- ToDo: Localize;
		x = 0.283437 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_TransSub: Radio_ButtonGeneric
	{
		idc = 715;
		action = "curSub = 6";

		text = "보조"; //--- ToDo: Localize;
		x = 0.309219 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Translist: Radio_ButtonGeneric
	{
		idc = 710;
		action = "listview = 6";

		text = ">>"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class Radio_Infantry1Mainlabel: Radio_RegularLabel
	{
		idc = 801;
		style = 1;

		text = "메인"; //--- ToDo: Localize;
		x = 0.216406 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,1,0.2,1};
	};
	class Radio_Infantry2Mainlabel: Radio_RegularLabel
	{
		idc = 802;
		style = 1;

		text = "메인"; //--- ToDo: Localize;
		x = 0.216406 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,1,0.2,1};
	};
	class Radio_ArmorMainlabel: Radio_RegularLabel
	{
		idc = 803;
		style = 1;

		text = "메인"; //--- ToDo: Localize;
		x = 0.216406 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,1,0.2,1};
	};
	class Radio_CASAHMainlabel: Radio_RegularLabel
	{
		idc = 804;
		style = 1;

		text = "메인"; //--- ToDo: Localize;
		x = 0.216406 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,1,0.2,1};
	};
	class Radio_MortorMainlabel: Radio_RegularLabel
	{
		idc = 805;
		style = 1;

		text = "메인"; //--- ToDo: Localize;
		x = 0.216406 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,1,0.2,1};
	};
	class Radio_TransMainlabel: Radio_RegularLabel
	{
		idc = 806;
		style = 1;

		text = "메인"; //--- ToDo: Localize;
		x = 0.216406 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,1,0.2,1};
	};
	class Radio_Infantry1Sublabel: Radio_RegularLabel
	{
		idc = 811;
		style = 1;

		text = "보조"; //--- ToDo: Localize;
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,0.2,1,1};
	};
	class Radio_Infantry2Sublabel: Radio_RegularLabel
	{
		idc = 812;
		style = 1;

		text = "보조"; //--- ToDo: Localize;
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,0.2,1,1};
	};
	class Radio_ArmorSublabel: Radio_RegularLabel
	{
		idc = 813;
		style = 1;

		text = "보조"; //--- ToDo: Localize;
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,0.2,1,1};
	};
	class Radio_CASAHSublabel: Radio_RegularLabel
	{
		idc = 814;
		style = 1;

		text = "보조"; //--- ToDo: Localize;
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,0.2,1,1};
	};
	class Radio_MortorSublabel: Radio_RegularLabel
	{
		idc = 815;
		style = 1;

		text = "보조"; //--- ToDo: Localize;
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,0.2,1,1};
	};
	class Radio_TransSublabel: Radio_RegularLabel
	{
		idc = 816;
		style = 1;

		text = "보조"; //--- ToDo: Localize;
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0.2,0.2,1,1};
	};
};
