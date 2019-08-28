

// !! IF YOU WANT TO EDIT THIS FOR MODDING PURPOSES, PLEASE USE CLASSNAMES_EXTENSIONS.SQF INSTEAD !!
// If you know what you're doing then sure, proceed :)




if ( isNil "FOB_typename" ) then { FOB_typename = "Land_Cargo_HQ_V1_F"; };
if ( isNil "FOB_box_typename" ) then { FOB_box_typename = "B_Slingload_01_Cargo_F"; };
if ( isNil "FOB_truck_typename" ) then { FOB_truck_typename = "B_Truck_01_box_F"; };
if ( isNil "Arsenal_typename" ) then { Arsenal_typename = "B_supplyCrate_F"; };
if ( isNil "Respawn_truck_typename" ) then { Respawn_truck_typename = "B_Truck_01_medical_F"; };
if ( isNil "huron_typename" ) then { huron_typename = "C_IDAP_Heli_Transport_02_F"; };
if ( isNil "ammobox_b_typename" ) then { ammobox_b_typename = "Box_NATO_AmmoVeh_F"; };
if ( isNil "ammobox_o_typename" ) then { ammobox_o_typename = "Box_East_AmmoVeh_F"; };
if ( isNil "opfor_ammobox_transport" ) then { opfor_ammobox_transport = "O_Truck_03_transport_F"; };
if ( isNil "commander_classname" ) then { commander_classname = "B_officer_F"; };
if ( isNil "crewman_classname" ) then { crewman_classname = "B_crew_F" };
if ( isNil "pilot_classname" ) then { pilot_classname = "B_Helipilot_F" };

infantry_units = [
	["B_soldier_F",2,0,0],
	["B_soldier_GL_F",3,0,0],
	["B_soldier_AR_F",3,0,0],
	["B_medic_F",3,0,0],
	["B_soldier_M_F",3,0,0],
	["B_engineer_F",3,0,0],
	["B_soldier_LAT_F",4,0,0],
	["B_Sharpshooter_F",5,0,0],
	["B_HeavyGunner_F",5,0,0],
	["B_recon_F",4,0,0],
	["B_recon_medic_F",4,0,0],
	["B_recon_M_F",5,0,0],
	["B_Recon_Sharpshooter_F",8,0,0],
	["B_soldier_AA_F",5,10,0],
	["B_soldier_AT_F",5,10,0],
	["B_sniper_F",10,0,0],
	["B_soldier_PG_F",2,0,0],
	["B_crew_F",1,0,0],
	["B_helipilot_F",1,0,0]
];
if ( isNil "infantry_units_extension" ) then { infantry_units_extension = [] };
if ( isNil "infantry_units_overwrite" ) then { infantry_units_overwrite = false };
if ( infantry_units_overwrite ) then { infantry_units = infantry_units_extension; } else { infantry_units = infantry_units + infantry_units_extension; };


light_vehicles = [
	["B_Quadbike_01_F",10,0,10],
	["C_Offroad_02_unarmed_green_F",15,0,15],
	["C_Offroad_01_F",15,0,15],
	["I_E_Offroad_01_covered_F",15,0,15],
	["I_E_Offroad_01_comms_F",15,0,15],
	["I_G_Offroad_01_AT_F",15,20,15],
	["I_C_Offroad_02_LMG_F",15,10,15],
	["I_C_Offroad_02_AT_F",15,20,15],
	["C_SUV_01_F",15,0,15],
	["C_Hatchback_01_sport_F",15,0,15],
	["B_G_Van_01_transport_F",15,0,15],
	["B_G_Van_02_transport_F",15,0,15],
	["C_Van_02_medevac_F",15,0,15],
	["C_Van_02_service_F",15,0,15],
	["C_IDAP_Van_02_vehicle_F",15,0,15],
	["C_IDAP_Van_02_medevac_F",15,0,15],
	["I_Truck_02_covered_F",20,0,20],
	["I_Truck_02_transport_F",20,0,20],
	["B_Truck_01_transport_F",25,0,25],
	["B_Truck_01_covered_F",25,0,25],
	["B_Truck_01_mover_F",25,0,25],
	["B_Truck_01_flatbed_F",25,0,25],
	["B_Truck_01_cargo_F",25,0,25],
	["C_IDAP_Truck_02_water_F",20,0,20],
	["B_LSV_01_unarmed_sand_F",15,0,15],
	["B_LSV_01_armed_sand_F",15,15,15],
	["B_T_LSV_at_F",15,20,15],
	["B_MRAP_01_F",25,0,25],
	["B_MRAP_01_hmg_F",25,15,25],
	["B_MRAP_01_gmg_F",25,20,25],
	["I_MRAP_03_F",30,0,30],
	["I_MRAP_03_hmg_F",30,15,30],
	["I_MRAP_03_gmg_F",30,20,30],
	["B_UGV_01_F",20,0,20],
	["B_UGV_01_rcws_F",35,20,35],
	["C_Scooter_Transport_01_F",10,0,10],
	["B_Boat_Transport_01_F",15,0,15],
	["B_Boat_Armed_01_minigun_F",30,20,40],
	["C_Boat_Civil_01_F",20,0,20],
	["B_SDV_01_F",20,0,20]
];
if ( isNil "light_vehicles_extension" ) then { light_vehicles_extension = [] };
if ( isNil "light_vehicles_overwrite" ) then { light_vehicles_overwrite = false };
if ( light_vehicles_overwrite ) then { light_vehicles = light_vehicles_extension; } else { light_vehicles = light_vehicles + light_vehicles_extension; };

heavy_vehicles = [
	["B_APC_Wheeled_01_cannon_F",70,70,70],
	["I_APC_Wheeled_03_cannon_F",80,100,80],
	["I_APC_tracked_03_cannon_F",70,80,70],
	["B_APC_Tracked_01_rcws_F",50,60,50],
	["B_APC_Tracked_01_AA_F",135,110,150],
	["I_MBT_03_cannon_F",150,150,150],
	["B_MBT_01_cannon_F",135,135,150],
	["B_MBT_01_TUSK_F",135,150,150],
	["B_AFV_Wheeled_01_cannon_F",120,135,120],
	["B_AFV_Wheeled_01_up_cannon_F",120,150,120],
	["I_LT_01_AT_F",40,60,40],
	["I_LT_01_scout_F",40,10,40],
	["I_LT_01_AA_F",40,60,40],
	["I_LT_01_cannon_F",40,60,40],
	["B_MBT_01_arty_F",200,300,170]
];
if ( isNil "heavy_vehicles_extension" ) then { heavy_vehicles_extension = [] };
if ( isNil "heavy_vehicles_overwrite" ) then { heavy_vehicles_overwrite = false };
if ( heavy_vehicles_overwrite ) then { heavy_vehicles = heavy_vehicles_extension; } else { heavy_vehicles = heavy_vehicles + heavy_vehicles_extension; };

air_vehicles = [
	["B_Heli_Light_01_F",20,0,30],
	["I_Heli_light_03_unarmed_F",40,0,60],
	["B_Heli_Transport_01_F",50,40,110],
	["I_Heli_Transport_02_F",80,0,120],
	["B_Heli_Transport_03_F",100,40,150],
	["B_Heli_Transport_03_unarmed_F",100,0,150],
	["O_Heli_Transport_04_black_F",80,0,120],
	["O_Heli_Transport_04_covered_black_F",100,0,150],
	["O_Heli_Transport_04_medevac_black_F",80,0,120],
	["B_Heli_Light_01_armed_F",70,60,80],
	["I_Heli_light_03_F",80,60,90],
	["B_Heli_Attack_01_F",150,320,150],
	["O_Heli_Attack_02_black_F",200,340,180],
	["B_UAV_01_F",10,0,15],
	["B_UAV_02_F",130,100,150],
	["B_UAV_02_CAS_F",130,80,150],
	["B_UAV_05_F",160,80,180],
	["B_T_UAV_03_F",100,220,100],
	["I_Plane_Fighter_03_AA_F",110,220,110],
	["I_Plane_Fighter_03_CAS_F",110,220,110],
	["B_Plane_CAS_01_F",200,520,250],
	["B_T_VTOL_01_infantry_F",150,0,200],
	["B_T_VTOL_01_vehicle_F",150,0,200],
	["B_T_VTOL_01_armed_F",250,650,350],
	["I_Plane_Fighter_04_F",150,220,150],
	["B_Plane_Fighter_01_F",230,420,280],
	["B_Plane_Fighter_01_Stealth_F",230,280,280],
	["B_Plane_CAS_01_Cluster_F",200,570,250],
	["B_Plane_Fighter_01_Cluster_F",230,470,280],
	["I_Plane_Fighter_03_Cluster_F",110,280,110],
	["I_Plane_Fighter_04_Cluster_F",150,320,150]
];


if ( isNil "air_vehicles_extension" ) then { air_vehicles_extension = [] };
if ( isNil "air_vehicles_overwrite" ) then { air_vehicles_overwrite = false };
if ( air_vehicles_overwrite ) then { air_vehicles = air_vehicles_extension; } else { air_vehicles = air_vehicles + air_vehicles_extension; };

static_vehicles = [
	["B_HMG_01_F",20,0,0],
	["B_HMG_01_high_F",20,0,0],
	["B_GMG_01_F",20,0,0],
	["B_GMG_01_high_F",20,0,0],
	["B_static_AA_F",20,0,0],
	["B_static_AT_F",20,0,0],
	["B_Radar_System_01_F",50,0,100],
	["B_AAA_System_01_F",100,200,100],
	["B_SAM_System_01_F",100,200,100],
	["B_Mortar_01_F",20,0,0]
];
if ( isNil "static_vehicles_extension" ) then { static_vehicles_extension = [] };
if ( isNil "static_vehicles_overwrite" ) then { static_vehicles_overwrite = false };
if ( static_vehicles_overwrite ) then { static_vehicles = static_vehicles_extension; } else { static_vehicles = static_vehicles + static_vehicles_extension; };

buildings = [
["PortableHelipadLight_01_blue_F",0,0,0],
	["Land_PortableHelipadLight_01_F",0,0,0],
	["PortableHelipadLight_01_red_F",0,0,0],
	["PortableHelipadLight_01_white_F",0,0,0],
	["PortableHelipadLight_01_green_F",0,0,0],
	["PortableHelipadLight_01_yellow_F",0,0,0],
	["Land_NavigLight",0,0,0],
	["Land_NavigLight_3_F",0,0,0],
	["Land_Flush_Light_green_F",0,0,0],
	["Land_Flush_Light_red_F",0,0,0],
	["Land_Flush_Light_yellow_F",0,0,0],
	["Land_runway_edgelight",0,0,0],
	["Land_runway_edgelight_blue_F",0,0,0],
	["Land_Runway_PAPI",0,0,0],
	["Land_Camping_Light_F",0,0,0],
	["Land_FloodLight_F",0,0,0],
	["Land_LampHalogen_F",0,0,0],
	["Land_LampAirport_F",20,0,0],
	["Land_LampSolar_F",0,0,0],
	["Land_LampShabby_F",0,0,0],
	["Land_LampStreet_small_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_BagFence_Corner_F",0,0,0],
	["Land_BagFence_End_F",0,0,0],
	["Land_BagFence_Long_F",0,0,0],
	["Land_BagFence_Short_F",0,0,0],
	["Land_BagFence_Round_F",1,0,0],
	["Land_Wall_IndCnc_2deco_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_CncWall4_F",0,0,0],		
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrierBig_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corridor_F",0,0,0],	
	["Land_Mil_WallBig_Corner_F",0,0,0],
	["Land_Mil_WallBig_Gate_F",0,0,0],	
	["Land_Mil_WallBig_4m_F",0,0,0],		
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_Bunker_01_big_F",0,0,0],
	["Land_Bunker_01_tall_F",0,0,0],
	["Land_Bunker_01_HQ_F",0,0,0],
	["Land_Bunker_01_blocks_1_F",0,0,0],
	["Land_Bunker_01_small_F",0,0,0],
	["Land_Bunker_01_blocks_3_F",0,0,0],
	["Land_SandbagBarricade_01_F",0,0,0],
	["Land_SandbagBarricade_01_hole_F",0,0,0],
	["Land_SandbagBarricade_01_half_F",0,0,0],
	["Land_Cargo_Tower_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
	["Land_CzechHedgehog_01_F",0,0,0],
	["RoadBarrier_F",0,0,0],
	["RoadCone_F",0,0,0],
	["RoadCone_L_F",0,0,0],
	["RoadBarrier_small_F",0,0,0],
	["ArrowDesk_L_F",0,0,0],
	["ArrowDesk_R_F",0,0,0],
	["Land_BarGate_F",0,0,0],
	["Land_PlasticBarrier_02_F",0,0,0],
	["PlasticBarrier_02_grey_F",0,0,0],
	["Land_PlasticBarrier_03_F",0,0,0],
	["PlasticBarrier_03_blue_F",0,0,0],
	["Land_HelipadSquare_F",0,0,0],
	["Land_HelipadCircle_F",0,0,0],
	["Land_HelipadCivil_F",0,0,0],
	["Land_HelipadRescue_F",0,0,0],
	["Land_JumpTarget_F",0,0,0],
	["CargoNet_01_box_F",10,0,0],
	["Land_Cargo20_military_green_F",0,0,0],
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Medevac_house_V1_F",0,0,0],
	["Land_Medevac_HQ_V1_F",0,0,0],
	["Land_Research_house_V1_F",0,0,0],
	["Land_Research_HQ_F",0,0,0],	
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_Sign_WarningMilitaryArea_F",0,0,0],	
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],	
	["Land_MetalCase_01_large_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_Metal_rack_Tall_F",0,0,0],
	["Land_fs_feed_F",0,0,0],	
	["MapBoard_altis_F",0,0,0],
	["MetalBarrel_burning_F",0,0,0],	
	["Land_Grave_V2_F",0,0,0],
	["Land_Grave_V3_F",0,0,0],
	["Land_Grave_soldier_F",0,0,0],
	["Land_Grave_obelisk_F",0,0,0],
	["Land_Slide_F",0,0,0],
	["Land_Maroula_F",0,0,0],
	["Land_Airport_Tower_F",0,0,0],
	["Land_dp_transformer_F",0,0,0],
	["Land_fs_price_F",0,0,0],
	["Land_fs_sign_F",0,0,0],
	["Land_PowLines_Transformer_F",0,0,0],
	["Land_Shed_Small_F",0,0,0],
	["Land_SolarPanel_1_F",0,0,0],
	["Land_SolarPanel_2_F",0,0,0],
	["Land_spp_Mirror_F",0,0,0],
	["Land_PowerGenerator_F",0,0,0],
	["Land_MedicalTent_01_floor_light_F",0,0,0],
	["Land_TentHangar_V1_F",0,0,0],
	["Land_Obstacle_Bridge_F",0,0,0],
	["Land_Obstacle_Climb_F",0,0,0],
	["Land_Obstacle_Crawl_F",0,0,0],
	["Land_Obstacle_Pass_F",0,0,0],
	["Land_Obstacle_Ramp_F",0,0,0],
	["Land_Obstacle_RunAround_F",0,0,0],
	["Land_Obstacle_Cross_F",0,0,0],
	["Land_RampConcrete_F",0,0,0],
	["Land_RampConcreteHigh_F",0,0,0],
	["Land_Grave_dirt_F",0,0,0],
	["Land_Grave_forest_F",0,0,0],
	["Land_Grave_rocks_F",0,0,0],
	["Land_Atm_02_F",0,0,0],
	["Land_SlideCastle_F",0,0,0],
	["Land_LifeguardTower_01_F",0,0,0],
	["Land_Kiosk_blueking_F",0,0,0],
	["Land_Kiosk_gyros_F",0,0,0],
	["Land_Kiosk_papers_F",0,0,0],
	["Land_Kiosk_redburger_F",0,0,0],
	["Land_Carousel_01_F",0,0,0],
	["Land_Swing_01_F",0,0,0],
	["Campfire_burning_F",0,0,0],
	["Land_Sink_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["FirePlace_burning_F",0,0,0],
	["Land_HumanSkeleton_F",0,0,0],
	["Land_HumanSkull_F",0,0,0],
	["Land_Bench_F",0,0,0],
	["Land_WoodenTable_large_F",0,0,0],
	["Land_WoodenTable_small_F",0,0,0],
	["Land_GarbageContainer_closed_F",0,0,0],
	["Land_GarbageContainer_open_F",0,0,0],
	["Land_Bench_01_F",0,0,0],
	["Land_Bench_02_F",0,0,0],
	["MapBoard_seismic_F",0,0,0],
	["Land_Sign_Mines_F",0,0,0],
	["Land_Sign_WarningMilAreaSmall_F",0,0,0],
	["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
	["Land_Sign_WarningUnexplodedAmmo_F",0,0,0],
	["Land_Scrap_MRAP_01_F",0,0,0],
	["Land_ScrapHeap_1_F",0,0,0],
	["Land_ScrapHeap_2_F",0,0,0],
	["Land_EngineCrane_01_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_PressureWasher_01_F",0,0,0],
	["WaterPump_01_forest_F",0,0,0],
	["WaterPump_01_sand_F",0,0,0],
	["Land_WoodPile_F",0,0,0],
	["Land_Sleeping_bag_F",0,0,0],
	["Land_Sleeping_bag_blue_F",0,0,0],
	["Land_Sleeping_bag_brown_F",0,0,0],
	["Land_Sleeping_bag_folded_F",0,0,0],
	["Land_Sleeping_bag_blue_folded_F",0,0,0],
	["Land_Sleeping_bag_brown_folded_F",0,0,0],
	["Land_TentA_F",0,0,0],
	["Land_GarbageBarrel_01_F",0,0,0],
	["Land_Device_assembled_F",0,0,0],
	["Land_Device_disassembled_F",0,0,0],
	["Land_PartyTent_01_F",0,0,0],
	["Land_GymBench_01_F",0,0,0],
	["Land_GymRack_01_F",0,0,0],
	["Land_GymRack_02_F",0,0,0],
	["Land_GymRack_03_F",0,0,0],
	["Land_WaterCooler_01_new_F",0,0,0],
	["Land_OfficeCabinet_01_F",0,0,0],
	["Land_OfficeChair_01_F",0,0,0],
	["OfficeTable_01_new_F",0,0,0],
	["Land_RattanChair_01_F",0,0,0],
	["Land_RattanTable_01_F",0,0,0],
	["Land_MobileLandingPlatform_01_F",0,0,0],
	["Land_LuggageHeap_01_F",0,0,0],
	["Land_LuggageHeap_02_F",0,0,0],
	["Land_LuggageHeap_03_F",0,0,0],
	["Land_LuggageHeap_04_F",0,0,0],
	["Land_LuggageHeap_05_F",0,0,0],
	["Land_MedicalTent_01_white_IDAP_med_closed_F",0,0,0],
	["Land_MedicalTent_01_white_IDAP_closed_F",0,0,0],
	["Land_MedicalTent_01_white_IDAP_open_F",0,0,0],
	["Land_MedicalTent_01_white_IDAP_outer_F",0,0,0],
	["Flag_NATO_F",0,0,0],
	["Flag_Vrana_F",0,0,0],
	["Flag_ARMEX_F",0,0,0],
	["Flag_Quontrol_F",0,0,0],
	["Flag_ION_F",0,0,0],
	["Flag_Larkin_F",0,0,0],
	["Flag_FD_Green_F",0,0,0],
	["Flag_FD_Red_F",0,0,0],
	["Flag_FD_Blue_F",0,0,0],
	["Flag_FD_Orange_F",0,0,0],
	["Flag_UK_F",0,0,0],
	["Flag_US_F",0,0,0],
	["Flag_AAF_F",0,0,0],
	["Flag_Altis_F",0,0,0],
	["Flag_FIA_F",0,0,0],
	["Flag_AltisColonial_F",0,0,0],
	["Flag_RedCrystal_F",0,0,0],
	["Flag_POWMIA_F",0,0,0],
	["Flag_UNO_F",0,0,0],
	["Flag_BI_F",0,0,0]
];
if ( isNil "buildings_extension" ) then { buildings_extension = [] };
if ( isNil "buildings_overwrite" ) then { buildings_overwrite = false };
if ( buildings_overwrite ) then { buildings = buildings_extension; } else { buildings = buildings + buildings_extension; };

support_vehicles = [
	[Arsenal_typename,50,200,0],
	[FOB_box_typename,100,500,0],	
	[FOB_truck_typename,100,500,60],
	["B_APC_Tracked_01_CRV_F",50,0,50],
	["B_T_APC_Tracked_01_CRV_F",50,0,50],
	["B_Truck_01_Repair_F",50,0,30],	
	["B_Truck_01_fuel_F",30,0,50],	
	["B_Truck_01_ammo_F",30,50,30],	
	["B_Slingload_01_Repair_F",50,0,0],	
	["B_Slingload_01_Fuel_F",0,0,50],	
	["B_Slingload_01_Ammo_F",0,50,0],	
	["B_Slingload_01_Medevac_F",10,0,0],
	["Box_NATO_AmmoVeh_F",0,154,0],
	["B_G_Van_01_fuel_F",10,0,30],
	["C_Offroad_01_repair_F",30,0,20],
	["C_Truck_02_fuel_F",30,0,50],
	["C_Truck_02_box_F",50,0,30],
	["C_Van_01_fuel_F",10,0,10],
	["I_G_Van_01_fuel_F",10,0,10],
	["I_Truck_02_fuel_F",30,0,50],
	["I_Truck_02_medical_F",40,0,30],
	["I_Truck_02_box_F",50,0,30],
	["I_Truck_02_ammo_F",50,0,60],
	["Box_East_AmmoVeh_F",0,307,0]
];
if ( isNil "support_vehicles_extension" ) then { support_vehicles_extension = [] };
if ( isNil "support_vehicles_overwrite" ) then { support_vehicles_overwrite = false };
if ( support_vehicles_overwrite ) then { support_vehicles = support_vehicles_extension; } else { support_vehicles = support_vehicles + support_vehicles_extension; };

if ( isNil "blufor_squad_inf_light" ) then { blufor_squad_inf_light = [] };
if ( count blufor_squad_inf_light == 0 ) then { blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F" ]; };
if ( isNil "blufor_squad_inf" ) then { blufor_squad_inf = [] };
if ( count blufor_squad_inf == 0 ) then { blufor_squad_inf = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_AR_F","B_HeavyGunner_F","B_medic_F","B_Soldier_GL_F","B_Soldier_LAT_F","B_Soldier_LAT_F","B_soldier_M_F","B_Sharpshooter_F" ]; };
if ( isNil "blufor_squad_at" ) then { blufor_squad_at = [] };
if ( count blufor_squad_at == 0 ) then { blufor_squad_at = [ "B_Soldier_SL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_medic_F","B_soldier_F" ]; };
if ( isNil "blufor_squad_aa" ) then { blufor_squad_aa = [] };
if ( count blufor_squad_aa == 0 ) then { blufor_squad_aa = [ "B_Soldier_SL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_medic_F","B_soldier_F" ]; };
if ( isNil "blufor_squad_recon" ) then { blufor_squad_recon = [] };
if ( count blufor_squad_recon == 0 ) then { blufor_squad_recon = [ "B_recon_TL_F","B_recon_F","B_recon_exp_F","B_recon_medic_F","B_recon_LAT_F","B_recon_LAT_F","B_recon_M_F","B_Recon_Sharpshooter_F","B_recon_F" ]; };
if ( isNil "blufor_squad_para" ) then { blufor_squad_para = [] };
if ( count blufor_squad_para == 0 ) then { blufor_squad_para = [ "B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F" ]; };
if ( isNil "blufor_squad_inf_light" ) then { blufor_squad_inf_light = [] };
if ( count blufor_squad_inf_light == 0 ) then { blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F"]; };
if ( isNil "uavs" ) then { uavs = [] }; uavs = [] + uavs + [];
if ( isNil "elite_vehicles_extension" ) then { elite_vehicles_extension = [] }; elite_vehicles = [] + elite_vehicles_extension + [];
if ( isNil "ai_resupply_sources_extension" ) then { ai_resupply_sources_extension = [] };
ai_resupply_sources = [] + ai_resupply_sources_extension + [ Respawn_truck_typename, huron_typename, Arsenal_typename, "B_Slingload_01_Ammo_F", "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black" ];
if ( isNil "vehicle_repair_sources_extension" ) then { vehicle_repair_sources_extension = [] };
vehicle_repair_sources = [] + vehicle_repair_sources_extension + [ "B_APC_Tracked_01_CRV_F", "C_Offroad_01_repair_F", "B_Truck_01_Repair_F", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Black" ];
if ( isNil "vehicle_rearm_sources_extension" ) then { vehicle_rearm_sources_extension = [] };
vehicle_rearm_sources = [] + vehicle_rearm_sources_extension + [ "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "B_Slingload_01_Ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black" ];
if ( isNil "vehicle_refuel_sources_extension" ) then { vehicle_refuel_sources_extension = [] };
vehicle_refuel_sources = [] + vehicle_refuel_sources_extension +  [ "B_APC_Tracked_01_CRV_F", "B_Truck_01_fuel_F", "B_Slingload_01_Fuel_F" ];
squads = [
	[blufor_squad_inf_light,20,0,0],
	[blufor_squad_inf,30,0,0],
	[blufor_squad_at,20,25,0],
	[blufor_squad_aa,20,25,0],
	[blufor_squad_recon,25,0,0],
	[blufor_squad_para,20,0,0]
];

if ( isNil "opfor_sentry") then { opfor_sentry = "O_Soldier_lite_F"; };
if ( isNil "opfor_rifleman") then { opfor_rifleman = "O_Soldier_F"; };
if ( isNil "opfor_grenadier") then { opfor_grenadier = "O_Soldier_GL_F"; };
if ( isNil "opfor_squad_leader") then { opfor_squad_leader = "O_Soldier_SL_F"; };
if ( isNil "opfor_team_leader") then { opfor_team_leader = "O_Soldier_TL_F"; };
if ( isNil "opfor_marksman") then { opfor_marksman = "O_soldier_M_F"; };
if ( isNil "opfor_machinegunner") then { opfor_machinegunner = "O_Soldier_AR_F"; };
if ( isNil "opfor_heavygunner") then { opfor_heavygunner = "O_HeavyGunner_F"; };
if ( isNil "opfor_medic") then { opfor_medic = "O_medic_F"; };
if ( isNil "opfor_rpg") then { opfor_rpg = "O_Soldier_LAT_F"; };
if ( isNil "opfor_at") then { opfor_at = "O_Soldier_AT_F"; };
if ( isNil "opfor_aa") then { opfor_aa = "O_Soldier_AA_F"; };
if ( isNil "opfor_officer") then { opfor_officer = "O_officer_F"; };
if ( isNil "opfor_sharpshooter") then { opfor_sharpshooter = "O_Sharpshooter_F"; };
if ( isNil "opfor_sniper") then { opfor_sniper = "O_sniper_F"; };
if ( isNil "opfor_engineer") then { opfor_engineer = "O_engineer_F"; };
if ( isNil "opfor_paratrooper") then { opfor_paratrooper = "O_soldier_PG_F"; };
if ( isNil "opfor_mrap") then { opfor_mrap = "O_MRAP_02_F"; };
if ( isNil "opfor_mrap_armed") then { opfor_mrap_armed = "O_MRAP_02_gmg_F"; };
if ( isNil "opfor_transport_helo") then { opfor_transport_helo = "O_Heli_Transport_04_bench_F"; };
if ( isNil "opfor_transport_truck") then { opfor_transport_truck = "O_Truck_03_covered_F"; };
if ( isNil "opfor_fuel_truck") then { opfor_fuel_truck = "O_Truck_03_fuel_F"; };
if ( isNil "opfor_ammo_truck") then { opfor_ammo_truck = "O_Truck_03_ammo_F"; };
if ( isNil "opfor_fuel_container") then { opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F"; };
if ( isNil "opfor_ammo_container") then { opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F"; };
if ( isNil "opfor_flag") then { opfor_flag = "Flag_CSAT_F"; };

militia_squad = [
	"O_G_Soldier_SL_F",
	"O_G_Soldier_A_F",
	"O_G_Soldier_AR_F",
	"O_G_medic_F",
	"O_G_engineer_F",
	"O_Soldier_AA_F",
	"O_Soldier_AAR_F",
	"O_Soldier_AAT_F",
	"O_Soldier_AAA_F",
	"O_soldierU_AAR_F",
	"O_soldierU_AAT_F",
	"O_soldierU_AA_F",
	"O_soldierU_AAA_F",
	"O_G_Soldier_exp_F",
	"O_G_Soldier_GL_F",
	"O_G_Soldier_M_F",
	"O_G_Soldier_F",
	"O_G_Soldier_LAT_F",
	"O_G_Soldier_lite_F",
	"O_G_Sharpshooter_F",
	"O_V_Soldier_LAT_hex_F",
	"O_V_Soldier_TL_hex_F",
	"O_V_Soldier_Exp_hex_F",
	"O_V_Soldier_M_hex_F",
	"O_V_Soldier_JTAC_hex_F",
	"O_V_Soldier_hex_F",
	"O_G_Soldier_TL_F",
	"O_Soldier_AHAT_F",
	"O_Soldier_HAT_F",
	"O_G_Soldier_LAT2_F"
];
if ( isNil "militia_squad_extension" ) then { militia_squad_extension = [] };
if ( isNil "militia_squad_overwrite" ) then { militia_squad_overwrite = false };
if ( militia_squad_overwrite ) then { militia_squad = militia_squad_extension; } else { militia_squad = militia_squad + militia_squad_extension; };

militia_vehicles = [
	"O_G_Offroad_01_armed_F",
	"O_G_Offroad_01_AT_F",
	"O_LSV_02_AT_F",
	"O_T_LSV_02_AT_F",
	"O_T_LSV_02_armed_black_F",
	"O_T_LSV_02_armed_ghex_F",
	"O_LSV_02_armed_F",
	"O_T_LSV_02_armed_arid_F",
	"O_LSV_02_armed_viper_F",
	"O_Mortar_01_F",
	"O_G_Mortar_01_F",
	"O_Static_Designator_02_F",
	"O_HMG_01_F",
	"O_HMG_01_high_F",
	"O_GMG_01_F",
	"O_GMG_01_high_F",
	"O_T_MRAP_02_hmg_ghex_F",
	"O_T_MRAP_02_gmg_ghex_F",
	"O_static_AT_F",
	"O_static_AA_F"
];
if ( isNil "militia_vehicles_extension" ) then { militia_vehicles_extension = [] };
if ( isNil "militia_vehicles_overwrite" ) then { militia_vehicles_overwrite = false };
if ( militia_vehicles_overwrite ) then { militia_vehicles = militia_vehicles_extension; } else { militia_vehicles = militia_vehicles + militia_vehicles_extension; };

opfor_vehicles = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_G_Offroad_01_AT_F",
	"O_LSV_02_AT_F",
	"O_T_LSV_02_AT_F",
	"O_T_LSV_02_armed_black_F",
	"O_T_LSV_02_armed_ghex_F",
	"O_LSV_02_armed_F",
	"O_T_LSV_02_armed_arid_F",
	"O_LSV_02_armed_viper_F",
	"O_T_APC_Tracked_02_cannon_ghex_F",
	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_T_APC_Wheeled_02_rcws_ghex_F",
	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
	"O_MBT_02_arty_F",
	"O_MBT_02_cannon_F",
	"O_T_MBT_02_arty_ghex_F",
	"O_T_MBT_02_cannon_ghex_F",
	"O_APC_Tracked_02_AA_F",
	"O_Mortar_01_F",
	"O_Static_Designator_02_F",
	"O_static_AT_F",
	"O_static_AA_F",
	"O_UGV_01_rcws_F",
	"O_T_UGV_01_rcws_ghex_F",
	"O_T_MRAP_02_hmg_ghex_F",
	"O_T_MRAP_02_gmg_ghex_F",
	"O_MRAP_02_gmg_F",
	"O_MRAP_02_hmg_F",
	"O_T_MBT_04_command_F",
	"O_MBT_04_command_F",
	"O_T_MBT_04_cannon_F",
	"O_MBT_04_cannon_F",
	"O_SAM_System_04_F",
	"O_Rader_System_02_F"
];
if ( isNil "opfor_vehicles_extension" ) then { opfor_vehicles_extension = [] };
if ( isNil "opfor_vehicles_overwrite" ) then { opfor_vehicles_overwrite = false };
if ( opfor_vehicles_overwrite ) then { opfor_vehicles = opfor_vehicles_extension; } else { opfor_vehicles = opfor_vehicles + opfor_vehicles_extension; };

opfor_vehicles_low_intensity = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_T_APC_Tracked_02_cannon_ghex_F",
	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_T_APC_Wheeled_02_rcws_ghex_F",
	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_G_Offroad_01_AT_F",
	"O_LSV_02_AT_F",
	"O_T_LSV_02_AT_F",
	"O_T_LSV_02_armed_black_F",
	"O_T_LSV_02_armed_ghex_F",
	"O_LSV_02_armed_F",
	"O_T_LSV_02_armed_arid_F",
	"O_LSV_02_armed_viper_F",
	"O_T_MRAP_02_hmg_ghex_F",
	"O_T_MRAP_02_gmg_ghex_F",
	"O_UGV_01_rcws_F",
	"O_T_UGV_01_rcws_ghex_F",
	"O_Mortar_01_F",
	"O_MRAP_02_gmg_F"
];
if ( isNil "opfor_vehicles_low_intensity_extension" ) then { opfor_vehicles_low_intensity_extension = [] };
if ( isNil "opfor_vehicles_low_intensity_overwrite" ) then { opfor_vehicles_low_intensity_overwrite = false };
if ( opfor_vehicles_low_intensity_overwrite ) then { opfor_vehicles_low_intensity = opfor_vehicles_low_intensity_extension; } else { opfor_vehicles_low_intensity = opfor_vehicles_low_intensity + opfor_vehicles_low_intensity_extension; };

opfor_battlegroup_vehicles = [
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_G_Offroad_01_AT_F",
	"O_LSV_02_AT_F",
	"O_T_LSV_02_AT_F",
	"O_T_LSV_02_armed_black_F",
	"O_T_LSV_02_armed_ghex_F",
	"O_LSV_02_armed_F",
	"O_T_LSV_02_armed_arid_F",
	"O_LSV_02_armed_viper_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
	"O_T_APC_Tracked_02_cannon_ghex_F",
	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_T_APC_Wheeled_02_rcws_ghex_F",
	"O_T_MBT_02_arty_ghex_F",
	"O_T_MBT_02_cannon_ghex_F",
	"O_T_MRAP_02_hmg_ghex_F",
	"O_T_MRAP_02_gmg_ghex_F",
	"O_Truck_03_covered_F",
	"O_MBT_02_cannon_F",
	"O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Light_02_F",
	"O_MBT_02_arty_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F",
	"O_T_MBT_04_command_F",
	"O_MBT_04_command_F",
	"O_T_MBT_04_cannon_F",
	"O_MBT_04_cannon_F"
];
if ( isNil "opfor_battlegroup_vehicles_extension" ) then { opfor_battlegroup_vehicles_extension = [] };
if ( isNil "opfor_battlegroup_vehicles_overwrite" ) then { opfor_battlegroup_vehicles_overwrite = false };
if ( opfor_battlegroup_vehicles_overwrite ) then { opfor_battlegroup_vehicles = opfor_battlegroup_vehicles_extension; } else { opfor_battlegroup_vehicles = opfor_battlegroup_vehicles + opfor_battlegroup_vehicles_extension; };

opfor_battlegroup_vehicles_low_intensity = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_G_Offroad_01_AT_F",
	"O_LSV_02_AT_F",
	"O_T_LSV_02_AT_F",
	"O_T_LSV_02_armed_black_F",
	"O_T_LSV_02_armed_ghex_F",
	"O_LSV_02_armed_F",
	"O_T_LSV_02_armed_arid_F",
	"O_LSV_02_armed_viper_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
	"O_T_APC_Tracked_02_cannon_ghex_F",
	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_T_APC_Wheeled_02_rcws_ghex_F",
	"O_T_MRAP_02_hmg_ghex_F",
	"O_T_MRAP_02_gmg_ghex_F",
	"O_Truck_03_covered_F",
	"O_MBT_02_arty_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F"
];
if ( isNil "opfor_battlegroup_vehicles_low_intensity_extension" ) then { opfor_battlegroup_vehicles_low_intensity_extension = [] };
if ( isNil "opfor_battlegroup_vehicles_low_intensity_overwrite" ) then { opfor_battlegroup_vehicles_low_intensity_overwrite = false };
if ( opfor_battlegroup_vehicles_low_intensity_overwrite ) then { opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity_extension; } else { opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity + opfor_battlegroup_vehicles_low_intensity_extension; };

opfor_troup_transports = [
	"O_APC_Wheeled_02_rcws_F",
	"O_Truck_03_covered_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F",
	"O_Truck_02_covered_F",
	"O_T_Truck_03_transport_ghex_F",
	"O_T_Truck_03_covered_ghex_F",
	"O_Heli_Light_02_F"
];
if ( isNil "opfor_troup_transports_extension" ) then { opfor_troup_transports_extension = [] };
if ( isNil "opfor_troup_transports_overwrite" ) then { opfor_troup_transports_overwrite = false };
if ( opfor_troup_transports_overwrite ) then { opfor_troup_transports = opfor_troup_transports_extension; } else { opfor_troup_transports = opfor_troup_transports + opfor_troup_transports_extension; };

opfor_choppers = [
	"O_Heli_Attack_02_F",
	"O_T_VTOL_02_infantry_F",
	"O_T_VTOL_02_infantry_hex_F",
	"O_Heli_Light_02_F",
	"O_T_VTOL_02_vehicle_F"
];
if ( isNil "opfor_choppers_extension" ) then { opfor_choppers_extension = [] };
if ( isNil "opfor_choppers_overwrite" ) then { opfor_choppers_overwrite = false };
if ( opfor_choppers_overwrite ) then { opfor_choppers = opfor_choppers_extension; } else { opfor_choppers = opfor_choppers + opfor_choppers_extension; };

opfor_air = [
	"O_Plane_CAS_02_F",
	"O_Heli_Attack_02_F",
	"O_Plane_Fighter_02_F",
	"O_Plane_Fighter_02_Stealth_F",
	"O_Plane_Fighter_02_Cluster_F",
	"O_Plane_CAS_02_Cluster_F",
	"O_UAV_02_F",
	"O_UAV_02_CAS_F",
	"O_T_UAV_04_CAS_F",
	"O_T_VTOL_02_infantry_F",
	"O_T_VTOL_02_infantry_hex_F"
];
if ( isNil "opfor_air_extension" ) then { opfor_air_extension = [] };
if ( isNil "opfor_air_overwrite" ) then { opfor_air_overwrite = false };
if ( opfor_air_overwrite ) then { opfor_air = opfor_air_extension; } else { opfor_air = opfor_air + opfor_air_extension; };

captured_vehicles = [
	["O_APC_Tracked_02_cannon_F",0,70,0],
	["O_APC_Wheeled_02_rcws_F",0,30,0],
	["O_G_Offroad_01_AT_F",0,20,0],
	["O_LSV_02_unarmed_F",0,10,0],
	["O_LSV_02_armed_F",0,15,0],
	["O_LSV_02_AT_F",0,20,0],
	["O_T_LSV_02_unarmed_F",0,10,0],
	["O_T_LSV_02_AT_F",0,20,0],
	["O_T_LSV_02_armed_black_F",0,15,0],
	["O_T_LSV_02_armed_ghex_F",0,15,0],
	["O_T_LSV_02_armed_arid_F",0,15,0],
	["O_LSV_02_armed_viper_F",0,15,0],
	["O_T_APC_Tracked_02_cannon_ghex_F",0,70,0],
	["O_T_APC_Tracked_02_AA_ghex_F",0,110,0],
	["O_T_APC_Wheeled_02_rcws_ghex_F",0,60,0],
	["O_T_APC_Wheeled_02_rcws_v2_ghex_F",0,60,0],
	["O_MBT_02_arty_F",0,300,0],
	["O_MBT_02_cannon_F",0,135,0],
	["O_T_MBT_02_arty_ghex_F",0,300,0],
	["O_T_MBT_02_cannon_ghex_F",0,135,0],
	["O_APC_Tracked_02_AA_F",0,110,0],
	["O_T_MRAP_02_hmg_ghex_F",0,15,0],
	["O_T_MRAP_02_gmg_ghex_F",0,20,0],
	["O_MRAP_02_F",0,10,0],
	["O_MRAP_02_gmg_F",0,20,0],
	["O_MRAP_02_hmg_F",0,15,0],
	["O_T_MBT_04_command_F",0,150,0],
	["O_MBT_04_command_F",0,150,0],
	["O_T_MBT_04_cannon_F",0,135,0],
	["O_MBT_04_cannon_F",0,135,0],
	["O_Truck_03_covered_F",0,10,0],
	["O_Truck_03_transport_F",0,10,0],
	["O_Truck_02_covered_F",0,10,0],
	["O_T_Truck_03_transport_ghex_F",0,10,0],
	["O_T_Truck_03_covered_ghex_F",0,10,0],
	["O_Heli_Attack_02_F",0,320,0],
	["O_T_VTOL_02_infantry_F",0,700,0],
	["O_Heli_Light_02_F",0,60,0],
	["O_T_VTOL_02_vehicle_F",0,700,0],
	["O_Plane_CAS_02_F",0,520,0],
	["O_Plane_Fighter_02_Stealth_F",0,280,0],
	["O_Plane_Fighter_02_Cluster_F",470,0],
	["O_Plane_CAS_02_Cluster_F",0,570,0],
	["O_T_VTOL_02_infantry_hex_F",0,700,0]
];

civilians = [
	"C_man_1",
	"C_man_polo_6_F",
	"C_man_polo_3_F",
	"C_man_polo_2_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_1_F",
	"C_man_p_beggar_F",
	"C_man_1_2_F",
	"C_man_p_fugitive_F",
	"C_man_hunter_1_F",
	"C_journalist_F",
	"C_man_shorts_2_F",
	"C_man_w_worker_F"
];
if ( isNil "civilians_extension" ) then { civilians_extension = [] };
if ( isNil "civilians_overwrite" ) then { civilians_overwrite = false };
if ( civilians_overwrite ) then { civilians = civilians_extension; } else { civilians = civilians + civilians_extension; };

civilian_vehicles = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_01_fuel_F",
	"C_Quadbike_01_F"
];
if ( isNil "civilian_vehicles_extension" ) then { civilian_vehicles_extension = [] };
if ( isNil "civilian_vehicles_overwrite" ) then { civilian_vehicles_overwrite = false };
if ( civilian_vehicles_overwrite ) then { civilian_vehicles = civilian_vehicles_extension; } else { civilian_vehicles = civilian_vehicles + civilian_vehicles_extension; };

GRLIB_blacklisted_from_arsenal = [
	"B_Respawn_Sleeping_bag_blue_F",
	"B_Respawn_Sleeping_bag_brown_F",
	"B_Respawn_TentDome_F",
	"B_Respawn_Sleeping_bag_F",
	"B_Respawn_TentA_F",
	"I_GMG_01_A_weapon_F",
	"O_GMG_01_A_weapon_F",
	"B_GMG_01_A_weapon_F",
	"I_HMG_01_A_weapon_F",
	"B_HMG_01_A_weapon_F",
	"O_HMG_01_A_weapon_F",
	"O_HMG_01_weapon_F",
	"B_HMG_01_weapon_F",
	"I_HMG_01_weapon_F",
	"I_HMG_01_high_weapon_F",
	"O_HMG_01_high_weapon_F",
	"B_HMG_01_high_weapon_F",
	"O_GMG_01_weapon_F",
	"I_GMG_01_weapon_F",
	"B_GMG_01_weapon_F",
	"B_GMG_01_high_weapon_F",
	"I_GMG_01_high_weapon_F",
	"O_GMG_01_high_weapon_F",
	"I_Mortar_01_support_F",
	"B_Mortar_01_support_F",
	"O_Mortar_01_support_F",
	"B_Mortar_01_weapon_F",
	"O_Mortar_01_weapon_F",
	"I_Mortar_01_weapon_F",
	"B_HMG_01_support_F",
	"O_HMG_01_support_F",
	"I_HMG_01_support_F",
	"B_HMG_01_support_high_F",
	"O_HMG_01_support_high_F",
	"I_HMG_01_support_high_F",
	"B_AA_01_weapon_F",
	"O_AA_01_weapon_F",
	"I_AA_01_weapon_F",
	"B_AT_01_weapon_F",
	"O_AT_01_weapon_F",
	"I_AT_01_weapon_F",
	"I_UAV_01_backpack_F",
	"B_UAV_01_backpack_F",
	"O_UAV_01_backpack_F",
	"I_E_UAV_01_backpack_F",
	"I_E_UGV_02_Demining_backpack_F",
	"I_UGV_02_Demining_backpack_F",
	"O_UGV_02_Demining_backpack_F",
	"B_UGV_02_Demining_backpack_F",
	"I_UGV_02_Science_backpack_F",
	"I_E_UGV_02_Science_backpack_F",
	"O_UGV_02_Science_backpack_F",
	"B_UGV_02_Science_backpack_F",
	"C_IDAP_UGV_02_Demining_backpack_F",
	"I_E_AA_01_weapon_F",
	"I_E_AT_01_weapon_F",
	"I_E_HMG_01_high_Weapon_F",
	"I_E_HMG_01_Weapon_F",
	"I_E_GMG_01_high_Weapon_F",
	"I_E_GMG_01_Weapon_F",
	"I_E_GMG_01_A_Weapon_F",
	"I_E_HMG_01_A_Weapon_F",
	"I_E_Mortar_01_support_F",
	"I_E_HMG_01_support_high_F",
	"I_E_HMG_01_support_F",
	"I_E_Mortar_01_Weapon_F",
	"B_Patrol_Respawn_bag_F"
];
if ( isNil "blacklisted_from_arsenal_extension" ) then { blacklisted_from_arsenal_extension = [] };
GRLIB_blacklisted_from_arsenal = [] + blacklisted_from_arsenal_extension + GRLIB_blacklisted_from_arsenal;

box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "O_Truck_03_transport_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "O_Truck_03_covered_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "I_Heli_Transport_02_F", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];
if ( isNil "box_transport_config_extension" ) then { box_transport_config_extension = [] };
box_transport_config = [] + box_transport_config + box_transport_config_extension;

infantry_units = [ infantry_units ] call F_filterMods;
light_vehicles = [ light_vehicles ] call F_filterMods;
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;
air_vehicles = [ air_vehicles ] call F_filterMods;
support_vehicles = [ support_vehicles ] call F_filterMods;
static_vehicles = [ static_vehicles ] call F_filterMods;
buildings = [ buildings ] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];
militia_squad = [ militia_squad , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports = [ opfor_troup_transports , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_choppers = [ opfor_choppers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_low_intensity = [opfor_team_leader,opfor_machinegunner,opfor_medic,opfor_rpg,opfor_sentry,opfor_sentry,opfor_sentry,opfor_sentry];
opfor_squad_8_standard = [opfor_squad_leader,opfor_team_leader,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_grenadier,opfor_rpg];
opfor_squad_8_infkillers = [opfor_squad_leader,opfor_machinegunner,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_sharpshooter,opfor_sniper];
opfor_squad_8_tankkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_at,opfor_at,opfor_at];
opfor_squad_8_airkillers = [opfor_squad_leader,opfor_medic,opfor_medic,opfor_machinegunner,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_aa,opfor_aa,opfor_aa,opfor_aa];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD",  localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD" ];
boats_names = [ "B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F" ];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "O_G_Soldier_SL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F","O_G_Soldier_TL_F"];
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_ignore_colisions_when_building = [
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_yellow_F",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_HelipadSquare_F",
	"Sign_Sphere100cm_F",
	"TMR_Autorest_Georef",
	"Land_ClutterCutter_large_F"
];
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";
