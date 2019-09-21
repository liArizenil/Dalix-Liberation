// If left empty, everything is allowed, otherwise only whitelisted items will be available
GRLIB_arsenal_weapons = [

];

GRLIB_arsenal_magazines = [

];

GRLIB_arsenal_items = [

];

GRLIB_arsenal_backpacks = [

];

bannedbackpack = [	
	"I_UAV_06_backpack_F",
	"O_UAV_06_backpack_F",
	"B_UAV_06_backpack_F",
	"I_UAV_06_medical_backpack_F",
	"O_UAV_06_medical_backpack_F",
	"B_UAV_06_medical_backpack_F",
	"C_IDAP_UAV_06_medical_backpack_F",
	"C_IDAP_UAV_06_backpack_F",
	"C_IDAP_UAV_06_antimine_backpack_F",
	"C_IDAP_UAV_01_backpack_F",
	"C_UAV_06_backpack_F",
	"C_UAV_06_medical_backpack_F"
];
OPFOR_Items = [
	"O_UavTerminal",
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"ItemRadio",
	"ItemGPS",
	"Binocular",
	"Rangefinder",
	"Laserdesignator",
	"G_Balaclava_TI_tna_F",
	"G_Balaclava_TI_blk_F",
	"G_Balaclava_TI_G_tna_F",
	"G_Balaclava_TI_G_blk_F"
];	
OPFOR_Mines = [
	"IEDUrbanBig_Remote_Mag",
	"ATMine_Range_Mag",
	"IEDLandBig_Remote_Mag",
	"IEDUrbanSmall_Remote_Mag",
	"IEDLandSmall_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"DemoCharge_Remote_Mag"
];
OPFOR_Goggles = [
	"NVGoggles_OPFOR"
];
OPFOR_Weapons = [
	"hgun_Pistol_heavy_01_F",
	"hgun_ACPC2_F",
	"hgun_P07_khk_F",
	"hgun_P07_F",
	"hgun_Pistol_01_F",
	"hgun_Rook40_F",
	"hgun_Pistol_heavy_02_F"
];
OPFOR_Vest = [
	"V_PlateCarrierGL_blk",
	"V_PlateCarrier1_blk",
	"V_TacVest_brn",
	"V_TacVest_camo",
	"V_TacVest_khk",
	"V_TacVest_blk",
	"V_HarnessOGL_brn",
	"V_HarnessOGL_gry",
	"V_HarnessO_brn"
];
OPFOR_Backpacks = [];
OPFOR_Sight = [];
OPFOR_Helmet = [];
OPFOR_Uniform = [];
OPFOR_Muzzles = [];
	if(typeOf player == "O_soldier_M_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
			"srifle_DMR_01_F",
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_06_olive_F",
			"srifle_DMR_06_camo_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_HelmetO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetSpecO_ocamo",
			"H_HelmetSpecO_blk",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetB_camo",
			"H_HelmetB_grass"
		];
		OPFOR_Uniform = OPFOR_Uniform + [
			"U_O_CombatUniform_oucamo",
			"U_O_CombatUniform_ocamo",
			"U_O_V_Soldier_Viper_hex_F"
		];
		OPFOR_Sight = OPFOR_Sight + [
			"optic_SOS",
			"optic_SOS_khk_F",
			"optic_NVS"
		];
		OPFOR_Backpacks = OPFOR_Backpacks + [
			"B_ViperLightHarness_khk_F",
			"B_ViperLightHarness_hex_F",
			"B_ViperLightHarness_blk_F",
			"B_ViperHarness_khk_F",
			"B_ViperHarness_hex_F",
			"B_ViperHarness_blk_F",
			"B_AssaultPack_khk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_ocamo",
			"B_AssaultPack_blk"
		];
		OPFOR_Muzzles = OPFOR_Muzzles + [
			"muzzle_snds_B_snd_F",
			"muzzle_snds_B_khk_F",
			"muzzle_snds_B"
		];	
	};
	if(typeOf player == "O_sniper_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
			"srifle_LRR_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_tna_F",
			"srifle_GM6_camo_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_HelmetO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetSpecO_ocamo",
			"H_HelmetSpecO_blk",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetB_camo",
			"H_HelmetB_grass"
		];
		OPFOR_Uniform = OPFOR_Uniform + [
			"U_O_T_Sniper_F",
			"U_O_GhillieSuit",
			"U_O_FullGhillie_ard",
			"U_O_FullGhillie_sard",
			"U_O_FullGhillie_lsh",
			"U_O_T_FullGhillie_tna_F"
		];
		OPFOR_Sight = OPFOR_Sight + [
			"optic_KHS_old",
			"optic_tws",
			"optic_NVS"
		];
		OPFOR_Backpacks = OPFOR_Backpacks + [
			"B_ViperLightHarness_khk_F",
			"B_ViperLightHarness_hex_F",
			"B_ViperLightHarness_blk_F",
			"B_ViperHarness_khk_F",
			"B_ViperHarness_hex_F",
			"B_ViperHarness_blk_F",
			"B_AssaultPack_khk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_ocamo",
			"B_AssaultPack_blk"
		];
	};
	if(typeOf player == "O_soldier_AT_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
		    "SMG_03_camo",
			"SMG_03_khaki",
			"SMG_03_hex",
			"SMG_03_black",
			"SMG_03_TR_camo",
			"SMG_03_TR_khaki",
			"SMG_03_TR_hex",
			"SMG_03_TR_black",
			"SMG_03C_camo",
			"SMG_03C_khaki",
			"SMG_03C_hex",
			"SMG_03C_black",
			"SMG_03C_TR_camo",
			"SMG_03C_TR_khaki",
			"SMG_03C_TR_hex",
			"SMG_03C_TR_black",
			"hgun_PDW2000_F",
			"SMG_05_F",
			"SMG_01_F",
			"SMG_02_F",
			"launch_RPG32_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_HelmetO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetSpecO_ocamo",
			"H_HelmetSpecO_blk",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetB_camo",
			"H_HelmetB_grass"
		];
		OPFOR_Uniform = OPFOR_Uniform + [
			"U_O_CombatUniform_oucamo",
			"U_O_CombatUniform_ocamo",
			"U_O_V_Soldier_Viper_hex_F"
		];
		OPFOR_Sight = OPFOR_Sight + [
			"optic_ACO_grn_smg",
			"optic_aco_smg",
			"optic_ACO_grn",
			"optic_aco",
			"optic_Arco",
			"optic_Arco_ghex_F",
			"optic_Arco_blk_F",
			"optic_ERCO_snd_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_blk_F",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_Holosight_smg_khk_F",
			"optic_Holosight_smg_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_blk_F",
			"optic_MRCO",
			"optic_hamr",
			"optic_Hamr_khk_F"
		];
		OPFOR_Backpacks = OPFOR_Backpacks + [
			"B_AssaultPack_khk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_ocamo",
			"B_AssaultPack_blk"
		];
	};
	if(typeOf player == "O_soldier_AA_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
		    "SMG_03_camo",
			"SMG_03_khaki",
			"SMG_03_hex",
			"SMG_03_black",
			"SMG_03_TR_camo",
			"SMG_03_TR_khaki",
			"SMG_03_TR_hex",
			"SMG_03_TR_black",
			"SMG_03C_camo",
			"SMG_03C_khaki",
			"SMG_03C_hex",
			"SMG_03C_black",
			"SMG_03C_TR_camo",
			"SMG_03C_TR_khaki",
			"SMG_03C_TR_hex",
			"SMG_03C_TR_black",
			"hgun_PDW2000_F",
			"SMG_05_F",
			"SMG_01_F",
			"SMG_02_F",
			"launch_O_Titan_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_HelmetO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetSpecO_ocamo",
			"H_HelmetSpecO_blk",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetB_camo",
			"H_HelmetB_grass"
		];
		OPFOR_Uniform = OPFOR_Uniform + [
			"U_O_CombatUniform_oucamo",
			"U_O_CombatUniform_ocamo",
			"U_O_V_Soldier_Viper_hex_F"
		];
		OPFOR_Sight = OPFOR_Sight + [
			"optic_ACO_grn_smg",
			"optic_aco_smg",
			"optic_ACO_grn",
			"optic_aco",
			"optic_Arco",
			"optic_Arco_ghex_F",
			"optic_Arco_blk_F",
			"optic_ERCO_snd_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_blk_F",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_Holosight_smg_khk_F",
			"optic_Holosight_smg_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_blk_F",
			"optic_MRCO",
			"optic_hamr",
			"optic_Hamr_khk_F"
		];
		OPFOR_Backpacks = OPFOR_Backpacks + [
			"B_FieldPack_khk",
			"B_FieldPack_cbr",
			"B_FieldPack_ocamo",
			"B_FieldPack_blk"
		];
	};
	if(typeOf player == "O_Pilot_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_HelmetO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetSpecO_ocamo",
			"H_HelmetSpecO_blk",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetB_camo",
			"H_HelmetB_grass",
			"H_PilotHelmetFighter_O",
			"H_PilotHelmetHeli_O"
		];
		OPFOR_Uniform = OPFOR_Uniform + [
			"U_O_PilotCoveralls"
		];
		OPFOR_Sight = OPFOR_Sight + [
			"optic_ACO_grn_smg",
			"optic_aco_smg",
			"optic_ACO_grn",
			"optic_aco",
			"optic_Arco",
			"optic_Arco_ghex_F",
			"optic_Arco_blk_F",
			"optic_DMS",
			"optic_DMS_ghex_F",
			"optic_AMS_snd",
			"optic_AMS_khk",
			"optic_ams",
			"optic_ERCO_snd_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_blk_F",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_Holosight_smg_khk_F",
			"optic_Holosight_smg_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_blk_F",
			"optic_SOS",
			"optic_SOS_khk_F",
			"optic_MRCO",
			"optic_hamr",
			"optic_Hamr_khk_F"
		];
		OPFOR_Backpacks = OPFOR_Backpacks + [
			"B_Parachute",
			"B_AssaultPack_khk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_ocamo",
			"B_AssaultPack_blk"
		];	
	};
