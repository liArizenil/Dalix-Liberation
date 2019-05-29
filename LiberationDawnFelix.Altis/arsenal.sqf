// If left empty, everything is allowed, otherwise only whitelisted items will be available
GRLIB_arsenal_weapons = [

];

GRLIB_arsenal_magazines = [

];

GRLIB_arsenal_items = [

];

GRLIB_arsenal_backpacks = [

];

bannedbackpack = [	"I_UAV_06_backpack_F",
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
if(side player == GRLIB_side_enemy) then {
	OPFOR_Weapons = [
		"hgun_Pistol_heavy_01_F",
		"hgun_ACPC2_F",
		"hgun_P07_khk_F",
		"hgun_P07_F",
		"hgun_Pistol_01_F",
		"hgun_Rook40_F",
		"hgun_Pistol_heavy_02_F"
	];
	OPFOR_Sight = [
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
	OPFOR_Vest = [
		"V_PlateCarrierGL_mtp",
		"V_PlateCarrierGL_rgr",
		"V_PlateCarrierGL_tna_F",
		"V_PlateCarrierGL_blk",
		"V_PlateCarrier1_rgr",
		"V_PlateCarrier1_rgr_noflag_F",
		"V_PlateCarrier1_tna_F",
		"V_PlateCarrier1_blk",
		"V_TacVest_brn",
		"V_I_G_resistanceLeader_F",
		"V_TacVest_oli",
		"V_TacVest_camo",
		"V_TacVest_khk",
		"V_TacVest_blk"
	];
	OPFOR_Backpacks = [
		"B_ViperLightHarness_ghex_F",
		"B_ViperLightHarness_oli_F",
		"B_ViperLightHarness_khk_F",
		"B_ViperLightHarness_hex_F",
		"B_ViperLightHarness_blk_F",
		"B_ViperHarness_ghex_F",
		"B_ViperHarness_oli_F",
		"B_ViperHarness_khk_F",
		"B_ViperHarness_hex_F",
		"B_ViperHarness_blk_F",
		"B_AssaultPack_mcamo",
		"B_AssaultPack_rgr",
		"B_AssaultPack_dgtl",
		"B_AssaultPack_sgg",
		"B_AssaultPack_tna_F",
		"B_AssaultPack_khk",
		"B_AssaultPack_cbr",
		"B_AssaultPack_ocamo",
		"B_AssaultPack_blk"
	];
	OPFOR_Helmet = [];
	OPFOR_Uniform = [];
	if(typeOf player == "O_soldier_M_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
			"arifle_AK12_F",
			"arifle_AKM_F",
			"arifle_AKS_F",
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F",
			"srifle_DMR_01_F",
			"arifle_Katiba_F",
			"arifle_Katiba_C_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_HelmetO_ViperSP_ghex_F",
			"H_HelmetO_ViperSP_hex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetO_oucamo",
			"H_HelmetO_ocamo"
		];
		OPFOR_Uniform = OPFOR_Uniform + [
			"U_O_T_Soldier_F",
			"U_O_CombatUniform_oucamo",
			"U_O_CombatUniform_ocamo",
			"U_O_V_Soldier_Viper_hex_F",
			"U_O_V_Soldier_Viper_F"
		];
	};
	if(typeOf player == "O_sniper_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_04_F",
			"srifle_LRR_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_tna_F",
			"srifle_GM6_ghex_F",
			"srifle_GM6_camo_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_HelmetO_ViperSP_ghex_F",
			"H_HelmetO_ViperSP_hex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetO_oucamo",
			"H_HelmetO_ocamo"
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
		    "optic_Nightstalker"
	};
	if(typeOf player == "O_Pilot_F") then {
		OPFOR_Weapons = OPFOR_Weapons + [
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F"
		];
		OPFOR_Helmet = OPFOR_Helmet + [
			"H_PilotHelmetFighter_O"
		];
		OPFOR_Uniform = OPFOR_Uniform + [
			"U_O_PilotCoveralls",
			"U_B_PilotCoveralls"
		];
	};
};
