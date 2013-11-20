#include "missions.sqf"
// Active Mission List
						// Name							Recurring
active_mission_list =  [
						[mission_kamenka,				true],
						[mission_balota_airfield,		true],
						[mission_cherno_outside, 		true],
						[mission_cherno_hospital, 		true],
						[mission_cherno_hostpital2,		true],
						[mission_cherno_firestation,	true],
						[mission_cherno_shop,			true],
						[mission_cherno_petrol,			true],
						[mission_electro_petrol,		true],
						[mission_electro_school,		true],
						[mission_electro_shop,			true],
						[mission_dam,					true],
						[mission_green_mountain,		true]
						];

// List of possible Vehicles & Count for AI to spawn with
//		These vehicles are added to database
//			These vehicles should have a higher count than epoch dynamic vehicles..
//				Otherwise epoch will have spawned them before Mission System gets a chance to.
//					Ideally made for patrols or missions with a disabled Vehicle						
dynamic_ai_vehicles = [
["AH6X_DZ",1],
["AN2_DZ",1],
["ArmoredSUV_PMC_DZ",1],
["C130J_US_EP1",1],
["CH_47F_EP1_DZ",1],
["CSJ_GyroC",1],
["CSJ_GyroCover",1],
["CSJ_GyroP",1],
["datsun1_civil_1_open",1],
["datsun1_civil_2_covered",1],
["datsun1_civil_3_open",1],
["GAZ_Vodnik",1],
["GAZ_Vodnik_MedEvac",1],
["GLT_M300_LT",1],
["GLT_M300_ST",1],
["GNT_C185",1],
["GNT_C185C",1],
["GNT_C185R",1],
["GNT_C185U",1],
["HMMWV_Ambulance",1],
["HMMWV_Ambulance_CZ_DES_EP1",1],
["HMMWV_DES_EP1",1],
["HMMWV_DZ",1],
["HMMWV_M1035_DES_EP1",1],
["HMMWV_M1151_M2_CZ_DES_EP1",1],
["HMMWV_M998A2_SOV_DES_EP1",1],
["KamazRefuel_DZ",1],
["LandRover_MG_TK_EP1",1],
["LandRover_Special_CZ_EP1",1],
["MH6J_DZ",1],
["Mi17_Civilian_DZ",1],
["Mi17_DZ",1],
["MtvrRefuel_DES_EP1_DZ",1],
["Offroad_DSHKM_Gue",1],
["Pickup_PK_GUE",1],
["Pickup_PK_INS",1],
["Pickup_PK_TK_GUE_EP1",1],
["RHIB",1],
["UH1H_DZ",1],
["UH1Y_DZ",1],
["UH60M_EP1_DZ",1],
["Ural_CDF",1],
["Ural_TK_CIV_EP1",1],
["Ural_UN_EP1",1],
["VIL_asistvan_DZE",2]
];