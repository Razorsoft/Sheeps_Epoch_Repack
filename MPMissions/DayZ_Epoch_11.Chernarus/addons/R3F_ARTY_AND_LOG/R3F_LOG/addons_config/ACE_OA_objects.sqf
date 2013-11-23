


if (isClass (configFile >> "CfgVehicles" >> "ACE_Required_Logic")) then
{

	R3F_LOG_CFG_remorqueurs = R3F_LOG_CFG_remorqueurs +
	[
		"ACE_Truck5tMG_Base"
	];

	R3F_LOG_CFG_objets_remorquables = R3F_LOG_CFG_objets_remorquables +
	[
		"ACE_EASA_Vehicle"
	];
	
	

	R3F_LOG_CFG_heliporteurs = R3F_LOG_CFG_heliporteurs +
	[
		
	];
	

	R3F_LOG_CFG_objets_heliportables = R3F_LOG_CFG_objets_heliportables +
	[
		"ACE_Truck5tMG_Base",
		"ACE_Lifeboat",
		"ACE_EASA_Vehicle"
	];
	
	R3F_LOG_CFG_transporteurs = R3F_LOG_CFG_transporteurs +
	[
		["ACE_Truck5tRepair", 35],
		["ACE_Truck5tRepair_Base", 35],
		["ACE_Truck5tReammo", 35],
		["ACE_Truck5tReammo_Base", 35],
		["ACE_Truck5tRefuel", 10],
		["ACE_Truck5tRefuel_Base", 10],
		["ACE_Truck5tMG_Base", 50],
		["ACE_UralReammo_TK_EP1", 35],
		["ACE_UralRefuel_TK_EP1", 10],
		["ACE_UralRepair_TK_EP1", 35],
		["ACE_V3S_Reammo_TK_GUE_EP1", 35],
		["ACE_V3S_Refuel_TK_GUE_EP1", 10],
		["ACE_V3S_Repair_TK_GUE_EP1", 35],
		["ACE_Lifeboat", 5]
	];
	
	R3F_LOG_CFG_objets_transportables = R3F_LOG_CFG_objets_transportables +
	[
		["ACE_Stretcher", 2],
		["ACE_KonkursTripod_NoGeo", 5],
		["ACE_M3Tripod", 3],
		["ACE_Konkurs", 7],
		["ACE_SpottingScope", 3],
		["ACE_Lifeboat", 7],
		["ACE_Sandbag_NoGeo", 1],
		["ACE_BandageBoxWest", 4],
		["ACE_CSW_Box_Base", 12],
		["ACE_RuckBox_East", 12],
		["ACE_RuckBox_Ind", 12],
		["ACE_RUCK_Box_Base", 35],
		["ACE_Rope_Box_Base", 35],
		["ACE_SandBox", 35],
		["ACE_GuerillaCacheBox", 9],
		["ACE_RUBasicAmmunitionBox", 5],
		["ACE_RUOrdnanceBox", 9],
		["ACE_RUVehicleBox", 40],
		["ACE_RUBasicWeaponsBox", 15],
		["ACE_RULaunchers", 9],
		["ACE_RULaunchersBox", 9],
		["ACE_RUSpecialWeaponsBox", 15],
		["ACE_LocalBasicAmmunitionBox", 5],
		["ACE_LocalBasicWeaponsBox", 10],
		["ACE_EmptyBox", 5],
		["ACE_HuntIRBox", 4],
		["ACE_KnicklichtBox", 4],
		["ACE_USBasicAmmunitionBox", 4],
		["ACE_USOrdnanceBox", 4],
		["ACE_USVehicleBox", 35],
		["ACE_USVehicleBox_EP1", 35],
		["ACE_USBasicWeaponsBox", 12],
		["ACE_USLaunchersBox", 9],
		["ACE_SpecialWeaponsBox", 12],
		["ACE_USSpecialWeaponsBox", 12],
		["ACE_TargetBase", 2],
		["ACE_UsedTubes", 2],
		["ACE_MS2000_STROBE_OBJECT", 1]
	];
	

	R3F_LOG_CFG_objets_deplacables = R3F_LOG_CFG_objets_deplacables +
	[
		"ACE_Stretcher",
		"ACE_Lifeboat",
		"ACE_Sandbag_NoGeo",
		"ACE_TargetBase",
		"ACE_UsedTubes",
		"ACE_MS2000_STROBE_OBJECT"
	];
};