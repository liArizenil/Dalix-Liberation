[//Loadout
	[//Primary Weapon
		"LMG_Zafir_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"optic_Holosight",							//Sight
		["150Rnd_762x54_Box",150],			//Primary Magazine
		[],													//Secondary Magazine
		"Bipod_01_F_BLK"									//Bipod
	],

	[//Launcher
		"",													//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		[],													//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Secondary Weapon
		"hgun_Rook40_F",									//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform

		"U_O_T_Soldier_F",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		selectRandom										//Vest
		["V_TacVest_oli", "V_TacChestrig_oli_F"],
		[//Inventory
			["NVGoggles_OPFOR",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["150Rnd_762x54_Box",2,150]

		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
	"B_FieldPack_ghex_F",								//Backpack
	[//Inventory
		["150Rnd_762x54_Box",1,150]
	]
],

		selectRandom										//Headgear
		["H_Booniehat_oli", "H_MilCap_ghex_F", "H_HelmetLeaderO_ghex_F", "H_HelmetSpecO_ghex_F", "H_HelmetO_ghex_F"],
		"",													//Facewear

	[//Binocular
		"",													//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[//Item
		"ItemMap",											//Map
		"",													//Terminal
		["tf_fadak"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		"ItemWatch",										//Watch
		""													//Goggles
	]
];
